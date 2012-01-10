require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TypeMapping
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class TypeMapperFactory
		def initialize()
		end

		def TypeMapperFactory.Creator()
			if @instance == nil then
				typeName = ConfigManager.SettingsSection.AppSettings["typeMapper"].Value
				@instance = Activator.CreateInstance(Type.GetType(typeName))
			end
			return @instance
		end
	end
end