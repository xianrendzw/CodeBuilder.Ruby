﻿require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class TypeElement < ConfigurationElement
		def Name
			return self["name"].ToString()
		end

		def Name=(value)
			self["name"] = value
		end

		def LanguageType
			return self["langtype"].ToString()
		end

		def LanguageType=(value)
			self["langtype"] = value
		end

		def DefaultValue
			return self["default"].ToString()
		end

		def DefaultValue=(value)
			self["default"] = value
		end
	end
end