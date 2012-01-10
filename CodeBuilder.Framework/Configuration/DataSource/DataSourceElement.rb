require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class DataSourceElement < ConfigurationElement
		def Name
			return self["name"].ToString()
		end

		def Name=(value)
			self["name"] = value
		end

		def ConnectionString
			return self["connectionString"].ToString()
		end

		def ConnectionString=(value)
			self["connectionString"] = value
		end

		def Exporter
			return self["exporter"].ToString()
		end

		def Exporter=(value)
			self["exporter"] = value
		end
	end
end