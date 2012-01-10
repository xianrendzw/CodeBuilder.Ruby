require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class SettingsSection < ConfigurationSection
		def Databases
			return self["databases"]
		end

		def PdmDatabases
			return self["pdmDatabases"]
		end

		def Exporters
			return self["exporters"]
		end

		def Languages
			return self["languages"]
		end

		def TemplateEngines
			return self["templateEngines"]
		end

		def AppSettings
			return self["appSettings"]
		end

		def PostDeserialize()
			self.PostDeserialize()
		end
	end
end