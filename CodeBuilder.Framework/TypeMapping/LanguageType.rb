require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TypeMapping
	# <summary>
	# programming design value's data dbType.(such as int|string|bool|double| etc.)
	# </summary>
	class LanguageType
		def initialize(typeName, defaultValue)
			self.@_typeName = typeName
			self.@_defaultValue = defaultValue
		end

		def TypeName
			return self.@_typeName
		end

		def TypeName=(value)
			self.@_typeName = value
		end

		def DefaultValue
			return self.@_defaultValue
		end

		def DefaultValue=(value)
			self.@_defaultValue = value
		end
	end
end