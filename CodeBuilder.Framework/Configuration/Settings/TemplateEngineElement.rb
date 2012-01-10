require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class TemplateEngineElement < ConfigurationElement
		def Name
			return self["name"].ToString()
		end

		def Name=(value)
			self["name"] = value
		end

		def Extension
			return self["ext"].ToString()
		end

		def Extension=(value)
			self["ext"] = value
		end

		def Adapter
			return self["adapter"].ToString()
		end

		def Adapter=(value)
			self["adapter"] = value
		end
	end
end