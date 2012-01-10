require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class TemplateElement < ConfigurationElement
		def Name
			return self["name"].ToString().ToLower()
		end

		def Name=(value)
			self["name"] = value
		end

		def DisplayName
			return self["displayName"].ToString()
		end

		def DisplayName=(value)
			self["displayName"] = value
		end

		def Language
			return self["language"].ToString()
		end

		def Language=(value)
			self["language"] = value
		end

		def Engine
			return self["engine"].ToString()
		end

		def Engine=(value)
			self["engine"] = value
		end

		def FileName
			return self["fileName"].ToString()
		end

		def FileName=(value)
			self["fileName"] = value
		end

		def Prefix
			return self["prefix"].ToString()
		end

		def Prefix=(value)
			self["prefix"] = value
		end

		def Suffix
			return self["suffix"].ToString()
		end

		def Suffix=(value)
			self["suffix"] = value
		end

		def Url
			return self["url"].ToString()
		end

		def Url=(value)
			self["url"] = value
		end

		def Description
			return self["desc"].ToString()
		end

		def Description=(value)
			self["desc"] = value
		end

		def Parser
			return self["parser"].ToString()
		end

		def Parser=(value)
			self["parser"] = value
		end
	end
end