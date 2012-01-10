require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Xml.Serialization, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class GenerationSettings
		def initialize(language, templateEngine, package, tablePrefix, author, version, templateNames, encoding, isOmitTablePrefix, isStandardizeName)
			self.@_language = language
			self.@_templateEngine = templateEngine
			self.@_package = package
			self.@_tablePrefix = tablePrefix
			self.@_author = author
			self.@_version = version
			self.@_templateNames = templateNames
			self.@_encoding = encoding
			self.@_isOmitTablePrefix = isOmitTablePrefix
			self.@_isStandardizeName = isStandardizeName
		end

		def initialize(language, templateEngine, package, tablePrefix, author, version, templateNames, encoding, isOmitTablePrefix, isStandardizeName)
			self.@_language = language
			self.@_templateEngine = templateEngine
			self.@_package = package
			self.@_tablePrefix = tablePrefix
			self.@_author = author
			self.@_version = version
			self.@_templateNames = templateNames
			self.@_encoding = encoding
			self.@_isOmitTablePrefix = isOmitTablePrefix
			self.@_isStandardizeName = isStandardizeName
		end

		def initialize(language, templateEngine, package, tablePrefix, author, version, templateNames, encoding, isOmitTablePrefix, isStandardizeName)
			self.@_language = language
			self.@_templateEngine = templateEngine
			self.@_package = package
			self.@_tablePrefix = tablePrefix
			self.@_author = author
			self.@_version = version
			self.@_templateNames = templateNames
			self.@_encoding = encoding
			self.@_isOmitTablePrefix = isOmitTablePrefix
			self.@_isStandardizeName = isStandardizeName
		end

		def Language
			return self.@_language
		end

		def Language=(value)
			self.@_language = value
		end

		def Package
			return self.@_package == System::String.Empty
		end

		def Package=(value)
			self.@_package = value
		end

		def TablePrefix
			return self.@_tablePrefix == System::String.Empty
		end

		def TablePrefix=(value)
			self.@_tablePrefix = value
		end

		def Author
			return self.@_author == System::String.Empty
		end

		def Author=(value)
			self.@_author = value
		end

		def Version
			return self.@_version == System::String.Empty
		end

		def Version=(value)
			self.@_version = value
		end

		def TemplateEngine
			return self.@_templateEngine
		end

		def TemplateEngine=(value)
			self.@_templateEngine = value
		end

		def TemplatesNames
			return self.@_templateNames
		end

		def TemplatesNames=(value)
			self.@_templateNames = value
		end

		def Encoding
			return self.@_encoding == "UTF-8"
		end

		def Encoding=(value)
			self.@_encoding = value
		end

		def IsOmitTablePrefix
			return self.@_isOmitTablePrefix
		end

		def IsOmitTablePrefix=(value)
			self.@_isOmitTablePrefix = value
		end

		def IsStandardizeName
			return self.@_isStandardizeName
		end

		def IsStandardizeName=(value)
			self.@_isStandardizeName = value
		end
	end
end