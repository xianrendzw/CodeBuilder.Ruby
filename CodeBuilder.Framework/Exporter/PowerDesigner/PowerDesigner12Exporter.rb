require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text.RegularExpressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.DataSource.Exporter
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Exceptions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class PowerDesigner12Exporter < BaseExporter, IExporter
		def Export(connectionString)
			if connectionString == nil then
				raise ArgumentNullException.new("connectionString", "Argument is null")
			end
			xmlDoc = XmlDocument.new()
			xmlDoc.Load(connectionString)
			root = xmlDoc.DocumentElement
			model = Model.new()
			model.Database = self.GetDatabase(root)
			tableNodes = root.GetElementsByTagName("c:Tables")
			viewNodes = root.GetElementsByTagName("c:Views")
			if tableNodes != nil and tableNodes[0] != nil then
				model.Tables = self.GetTables(tableNodes[0].ChildNodes)
			end
			if viewNodes != nil and viewNodes[0] != nil then
				model.Views = self.GetViews(viewNodes[0].ChildNodes)
			end
			return model
		end

		def GetTables(tableNodes)
			if tableNodes == nil or tableNodes.Count == 0 then
				return nil
			end
			tables = Tables.new(tableNodes.Count)
			enumerator = tableNodes.GetEnumerator()
			while enumerator.MoveNext()
				tableNode = enumerator.Current
				id = tableNode.Attributes["Id"].InnerText
				name = tableNode["a:Name"].InnerText
				code = tableNode["a:Code"].InnerText
				comment = tableNode["a:Comment"] != nil ? tableNode["a:Comment"].InnerText : System::String.Empty
				table = Table.new(id, name, code, comment)
				table.OriginalName = code
				table.Columns = self.GetColumns(tableNode)
				table.PrimaryKeys = self.GetPrimaryKeys(tableNode, table.Columns)
				tables.Add(id, table)
			end
			return tables
		end

		def GetViews(viewNodes)
			if viewNodes == nil or viewNodes.Count == 0 then
				return nil
			end
			views = Views.new(viewNodes.Count)
			enumerator = viewNodes.GetEnumerator()
			while enumerator.MoveNext()
				viewNode = enumerator.Current
				id = viewNode.Attributes["Id"].InnerText
				name = viewNode["a:Name"].InnerText
				code = viewNode["a:Code"].InnerText
				comment = viewNode["a:Comment"] != nil ? viewNode["a:Comment"].InnerText : System::String.Empty
				view = View.new(id, name, code, comment)
				view.OriginalName = code
				view.Columns = self.GetColumns(viewNode)
				views.Add(id, view)
			end
			return views
		end

		def GetColumns(tableOrViewNode)
			columnsNode = tableOrViewNode["c:Columns"]
			if columnsNode == nil or columnsNode.ChildNodes.Count == 0 then
				return nil
			end
			columnNodes = columnsNode.ChildNodes
			columns = Columns.new(columnNodes.Count)
			enumerator = columnNodes.GetEnumerator()
			while enumerator.MoveNext()
				columnNode = enumerator.Current
				id = columnNode.Attributes["Id"].InnerText
				name = columnNode["a:Name"].InnerText
				code = columnNode["a:Code"].InnerText
				comment = columnNode["a:Comment"] != nil ? columnNode["a:Comment"].InnerText : System::String.Empty
				dataType = columnNode["a:DataType"] != nil ? columnNode["a:DataType"].InnerText : System::String.Empty
				length = columnNode["a:Length"] != nil ? columnNode["a:Length"].InnerText : "0"
				identity = columnNode["a:Identity"] != nil ? columnNode["a:Identity"].InnerText : System::String.Empty
				mandatory = columnNode["a:Mandatory"] != nil ? columnNode["a:Mandatory"].InnerText : System::String.Empty
				defaultValue = columnNode["a:DefaultValue"] != nil ? columnNode["a:DefaultValue"].InnerText : System::String.Empty
				column = Column.new(id, name, code, dataType, comment)
				column.Length = Int32.Parse(length)
				column.IsAutoIncremented = identity.Equals("1")
				column.IsNullable = mandatory.Equals("1")
				column.DefaultValue = defaultValue.ToEmpty()
				column.DataType = Regex.Replace(column.DataType, "\\(.*?\\)", "")
				column.OriginalName = code
				columns.Add(id, column)
			end
			return columns
		end

		def GetKeys(tableNode, tableColumns)
			keysNode = tableNode["c:Keys"]
			if keysNode == nil or keysNode.ChildNodes.Count == 0 then
				return nil
			end
			keyColumnsNode = keysNode.ChildNodes[0]["c:Key.Columns"]
			if keyColumnsNode == nil or keyColumnsNode.ChildNodes.Count == 0 then
				return nil
			end
			keyColumnNodes = keyColumnsNode.ChildNodes
			keys = Columns.new(keyColumnNodes.Count)
			enumerator = keyColumnNodes.GetEnumerator()
			while enumerator.MoveNext()
				keyColumnNode = enumerator.Current
				id = keyColumnNode.Attributes["Ref"].InnerText
				if not tableColumns.ContainsKey(id) then
					next
				end
				keys.Add(id, tableColumns[id])
			end
			return keys
		end

		def GetPrimaryKeys(tableNode, tableColumns)
			xmlNode = tableNode["c:PrimaryKey"]
			if xmlNode == nil or xmlNode.ChildNodes.Count == 0 then
				return nil
			end
			primaryKeyNodes = xmlNode.ChildNodes
			primaryKeys = Columns.new(primaryKeyNodes.Count)
			enumerator = primaryKeyNodes.GetEnumerator()
			while enumerator.MoveNext()
				primaryKeyNode = enumerator.Current
				id = primaryKeyNode.Attributes["Ref"].InnerText
				if not tableColumns.ContainsKey(id) then
					next
				end
				primaryKeys.Add(id, tableColumns[id])
			end
			return primaryKeys
		end

		def GetDatabase(root)
			targetModelNodes = root.GetElementsByTagName("o:TargetModel")
			if targetModelNodes == nil or targetModelNodes.Count == 0 then
				raise NotFoundPdmDBMSException.new()
			end
			dbmsName = targetModelNodes[0]["a:Code"].InnerText.Trim().ToLower()
			if ConfigManager.SettingsSection.PdmDatabases[dbmsName] == nil then
				raise NotSupportDatabaseException.new()
			end
			return ConfigManager.SettingsSection.PdmDatabases[dbmsName].Database
		end
	end
end