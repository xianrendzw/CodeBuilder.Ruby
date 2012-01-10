require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class TypeMappingElement < ConfigurationElement
		def initialize()
			self.EnsureStaticPropertyBag()
		end

		def Name
			return self["name"].ToString()
		end

		def Name=(value)
			self["name"] = value
		end

		def Database
			return self["database"].ToString()
		end

		def Database=(value)
			self["database"] = value
		end

		def Language
			return self["language"].ToString()
		end

		def Language=(value)
			self["language"] = value
		end

		def Types
			return self[@_property]
		end

		def PostDeserialize()
			self.PostDeserialize()
		end

		def TypeMappingElement.EnsureStaticPropertyBag()
			if @_properties == nil then
				@_property = ConfigurationProperty.new(nil, TypeElementCollection.to_clr_type, nil, ConfigurationPropertyOptions.IsDefaultCollection)
				@_properties = ConfigurationPropertyCollection.new()
				@_properties.Add(@_property)
			end
			return @_properties
		end
	end
end