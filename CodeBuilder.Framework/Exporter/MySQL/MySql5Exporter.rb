require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "MySql.Data.MySqlClient, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.DataSource.Exporter
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class MySql5Exporter < BaseExporter, IExporter
		def Export(connectionString)
			if connectionString == nil then
				raise ArgumentNullException.new("connectionString", "Argument is null")
			end
			connBuilder = MySqlConnectionStringBuilder.new(connectionString)
			originalDbName = connBuilder.Database
			connBuilder.Database = "information_schema"
			model = Model.new()
			model.Database = "MySQL5"
			begin
				model.Tables = self.GetTables(originalDbName, connBuilder.ConnectionString)
				model.Views = self.GetViews(originalDbName, connBuilder.ConnectionString)
				return model
			rescue Exception => ex
				raise ex
			ensure
			end
		end

		def GetTables(originalDbName, connectionString)
			tables = Tables.new(10)
			sqlCmd = System::String.Format("SELECT TABLE_NAME, TABLE_COMMENT FROM TABLES WHERE TABLE_SCHEMA = '{0}'", originalDbName)
			dr = MySqlHelper.ExecuteReader(connectionString, sqlCmd)
			while dr.Read()
				id = dr.GetString(0)
				name = dr.GetString(0)
				code = dr.GetString(0)
				comment = dr.IsDBNull(1) ? System::String.Empty : dr.GetString(1)
				table = Table.new(id, name, code, comment)
				table.OriginalName = code
				table.Columns = self.GetColumns(name, originalDbName, connectionString)
				table.PrimaryKeys = self.GetPrimaryKeys(name, originalDbName, connectionString)
				tables.Add(id, table)
			end
			dr.Close()
			return tables
		end

		def GetViews(originalDbName, connectionString)
			views = Views.new(10)
			sqlCmd = System::String.Format("SELECT TABLE_NAME FROM VIEWS WHERE TABLE_SCHEMA = '{0}'", originalDbName)
			dr = MySqlHelper.ExecuteReader(connectionString, sqlCmd)
			while dr.Read()
				id = dr.GetString(0)
				name = dr.GetString(0)
				code = dr.GetString(0)
				comment = System::String.Empty
				view = View.new(id, name, code, comment)
				view.OriginalName = code
				view.Columns = self.GetColumns(name, originalDbName, connectionString)
				views.Add(id, view)
			end
			dr.Close()
			return views
		end

		def GetColumns(tableOrViewName, originalDbName, connectionString)
			sqlBuilder = StringBuilder.new()
			sqlBuilder.Append("SELECT TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,DATA_TYPE,COLUMN_KEY,COLUMN_DEFAULT, ")
			sqlBuilder.Append("IS_NULLABLE,CHARACTER_MAXIMUM_LENGTH,EXTRA,COLUMN_COMMENT ")
			sqlBuilder.Append("FROM COLUMNS ")
			sqlBuilder.AppendFormat("WHERE TABLE_SCHEMA = '{0}' AND TABLE_NAME ='{1}' ", originalDbName, tableOrViewName)
			return self.GetColumns(connectionString, sqlBuilder.ToString())
		end

		def GetKeys(tableName, originalDbName, connectionString)
			sqlBuilder = StringBuilder.new()
			sqlBuilder.Append("SELECT TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,DATA_TYPE,COLUMN_KEY,COLUMN_DEFAULT, ")
			sqlBuilder.Append("IS_NULLABLE,CHARACTER_MAXIMUM_LENGTH,EXTRA,COLUMN_COMMENT ")
			sqlBuilder.Append("FROM COLUMNS ")
			sqlBuilder.AppendFormat("WHERE TABLE_SCHEMA = '{0}' AND TABLE_NAME ='{1}' AND CHARACTER_LENGTH(COLUMN_KEY)>0 ", originalDbName, tableName)
			return self.GetColumns(connectionString, sqlBuilder.ToString())
		end

		def GetPrimaryKeys(tableName, originalDbName, connectionString)
			sqlBuilder = StringBuilder.new()
			sqlBuilder.Append("SELECT TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,DATA_TYPE,COLUMN_KEY,COLUMN_DEFAULT, ")
			sqlBuilder.Append("IS_NULLABLE,CHARACTER_MAXIMUM_LENGTH,EXTRA,COLUMN_COMMENT ")
			sqlBuilder.Append("FROM COLUMNS ")
			sqlBuilder.AppendFormat("WHERE TABLE_SCHEMA = '{0}' AND TABLE_NAME ='{1}' AND COLUMN_KEY='PRI'", originalDbName, tableName)
			return self.GetColumns(connectionString, sqlBuilder.ToString())
		end

		def GetColumns(connectionString, sqlCmd)
			columns = Columns.new(50)
			dr = MySqlHelper.ExecuteReader(connectionString, sqlCmd.ToString())
			while dr.Read()
				id = dr.IsDBNull(2) ? System::String.Empty : dr.GetString(2)
				name = dr.IsDBNull(2) ? System::String.Empty : dr.GetString(2)
				code = dr.IsDBNull(2) ? System::String.Empty : dr.GetString(2)
				dataType = dr.IsDBNull(3) ? System::String.Empty : dr.GetString(3)
				key = dr.IsDBNull(4) ? System::String.Empty : dr.GetString(4)
				defaultValue = dr.IsDBNull(5) ? System::String.Empty : dr.GetString(5)
				isNullable = dr.IsDBNull(6) ? System::String.Empty : dr.GetString(6)
				length = dr.IsDBNull(7) ? System::String.Empty : dr.GetString(7)
				identity = dr.IsDBNull(8) ? System::String.Empty : dr.GetString(8)
				comment = dr.IsDBNull(9) ? System::String.Empty : dr.GetString(9)
				column = Column.new(id, name, code, dataType, comment)
				column.Length = ConvertHelper.GetInt32(length)
				column.IsAutoIncremented = identity.Equals("auto_increment")
				column.IsNullable = isNullable.Equals("YES")
				column.DefaultValue = defaultValue.ToEmpty()
				column.DataType = dataType
				column.OriginalName = code
				columns.Add(id, column)
			end
			dr.Close()
			return columns
		end
	end
end