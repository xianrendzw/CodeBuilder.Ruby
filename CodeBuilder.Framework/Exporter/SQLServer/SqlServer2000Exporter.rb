require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.DataSource.Exporter
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class SqlServer2000Exporter < BaseExporter, IExporter
		def Export(connectionString)
			if connectionString == nil then
				raise ArgumentNullException.new("connectionString", "Argument is null")
			end
			model = Model.new()
			model.Database = "SqlServer2000"
			return model
		end

		def GetTables()
			return nil
		end

		def GetViews()
			return nil
		end

		def GetColumns()
			return nil
		end

		def GetKeys()
			return nil
		end

		def GetPrimaryKeys()
			return nil
		end
	end
end