require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "DataSource.Exporter, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class ExportModelHelper
		def ExportModelHelper.ExportPDM(connectionString, treeView)
			rootNode = TreeNode.new(connectionString, 1, 1)
			treeView.Nodes.Add(rootNode)
			ExportModelHelper.Export(PowerDesigner12Exporter.new(), connectionString, rootNode)
			return rootNode
		end

		def ExportModelHelper.Export(dataSourceName, treeView)
			rootNode = TreeNode.new(dataSourceName, 1, 1)
			treeView.Nodes.Add(rootNode)
			connectionString = ConfigManager.DataSourceSection.DataSources[dataSourceName].ConnectionString
			exporterName = ConfigManager.DataSourceSection.DataSources[dataSourceName].Exporter
			typeName = ConfigManager.SettingsSection.Exporters[exporterName].Type
			exporter = Activator.CreateInstance(Type.GetType(typeName))
			ExportModelHelper.Export(exporter, connectionString, rootNode)
			return rootNode
		end

		def ExportModelHelper.Export(exporter, connectionString, rootNode)
			model = exporter.Export(connectionString)
			rootNode.Tag = model.Database
			ExportModelHelper.AddBranchToTree(model, rootNode)
			ModelManager.Add(rootNode.Index.ToString(), model)
		end

		def ExportModelHelper.AddBranchToTree(model, parentNode)
			ExportModelHelper.AddBranchToTree(model.Tables, parentNode)
			ExportModelHelper.AddBranchToTree(model.Views, parentNode)
		end

		def ExportModelHelper.CheckedTreeNode(tn)
			enumerator = tn.Nodes.GetEnumerator()
			while enumerator.MoveNext()
				childNode = enumerator.Current
				if childNode.Checked != tn.Checked then
					childNode.Checked = tn.Checked
				end
				ExportModelHelper.CheckedTreeNode(childNode)
			end
		end

		def ExportModelHelper.AddBranchToTree(objects, parentNode)
			if objects == nil or objects.Count == 0 then
				return 
			end
			text = T.to_clr_type.Name.Equals("Table") ? "Tables" : "Views"
			childNode = TreeNode.new(text, 1, 1)
			enumerator = objects.Values.GetEnumerator()
			while enumerator.MoveNext()
				baseTable = enumerator.Current
				newNode = TreeNode.new()
				newNode.Tag = baseTable.Id
				newNode.Text = baseTable.DisplayName
				newNode.ToolTipText = baseTable.DisplayName
				newNode.ImageIndex = 2
				newNode.SelectedImageIndex = 2
				childNode.Nodes.Add(newNode)
			end
			parentNode.Nodes.Add(childNode)
		end
	end
end