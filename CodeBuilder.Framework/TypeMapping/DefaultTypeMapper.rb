require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TypeMapping
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class DefaultTypeMapper < ITypeMapper
		def initialize()
			@logger = InternalTrace.GetLogger(DefaultTypeMapper.to_clr_type)
		end

		def GetLanguageType(database, language, dbDataTypeName)
			database = database.ToLower()
			language = language.ToLower()
			dbDataTypeName = dbDataTypeName.ToLower()
			name = String.Format("{0}-{1}", database.ToLower(), language.ToLower())
			mappings = ConfigManager.TypeMappingSection.Mappings
			if mappings[name] == nil then
				@logger.Info(System::String.Format("Not Found {0} To {1} Data Type Mapping", database, language))
				return nil
			end
			#throw new ArgumentNullException(name, string.Format("Not Found {0} To {1} Data Type Mapping", database, language));
			dbType = nil
			if mappings[name].Types[dbDataTypeName] == nil then
				dbType = mappings[name].Types["default"]
				@logger.Info(System::String.Format("Not Found {0} {1} Data Type Item", database, dbDataTypeName))
			else
				#throw new ArgumentNullException(name, string.Format("Not Found {0} {1} Data Type Item", database, dbDataTypeName));
				dbType = mappings[name].Types[dbDataTypeName]
			end
			return LanguageType.new(dbType.LanguageType, dbType.DefaultValue)
		end
	end
end