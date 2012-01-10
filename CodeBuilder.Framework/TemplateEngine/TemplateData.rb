require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class TemplateData
		def initialize(name, language, database, templateEngine, package, tablePrefix, author, version, templateName, prefix, suffix, encoding, templateFileName, codeFileName, isOmitTablePrefix, isStandardizeName, modelObject)
			self.@_name = name
			self.@_language = language
			self.@_database = database
			self.@_templateEngine = templateEngine
			self.@_package = package
			self.@_tablePrefix = tablePrefix
			self.@_author = author
			self.@_version = version
			self.@_templateName = templateName
			self.@_prefix = prefix
			self.@_suffix = suffix
			self.@_encoding = encoding
			self.@_templateFileName = templateFileName
			self.@_codeFileName = codeFileName
			self.@_isOmitTablePrefix = isOmitTablePrefix
			self.@_isStandardizeName = isStandardizeName
			self.@_modelObject = modelObject
		end

		def initialize(name, language, database, templateEngine, package, tablePrefix, author, version, templateName, prefix, suffix, encoding, templateFileName, codeFileName, isOmitTablePrefix, isStandardizeName, modelObject)
			self.@_name = name
			self.@_language = language
			self.@_database = database
			self.@_templateEngine = templateEngine
			self.@_package = package
			self.@_tablePrefix = tablePrefix
			self.@_author = author
			self.@_version = version
			self.@_templateName = templateName
			self.@_prefix = prefix
			self.@_suffix = suffix
			self.@_encoding = encoding
			self.@_templateFileName = templateFileName
			self.@_codeFileName = codeFileName
			self.@_isOmitTablePrefix = isOmitTablePrefix
			self.@_isStandardizeName = isStandardizeName
			self.@_modelObject = modelObject
		end

		def Name
			return self.@_name
		end

		def Name=(value)
			self.@_name = value
		end

		def Language
			return self.@_language
		end

		def Language=(value)
			self.@_language = value
		end

		def Database
			return self.@_database
		end

		def Database=(value)
			self.@_database = value
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

		def TemplateName
			return self.@_templateName
		end

		def TemplateName=(value)
			self.@_templateName = value
		end

		def Prefix
			return self.@_prefix == System::String.Empty
		end

		def Prefix=(value)
			self.@_prefix = value
		end

		def Suffix
			return self.@_suffix == System::String.Empty
		end

		def Suffix=(value)
			self.@_suffix = value
		end

		def Encoding
			return self.@_encoding == "UTF-8"
		end

		def Encoding=(value)
			self.@_encoding = value
		end

		def TemplateFileName
			return self.@_templateFileName
		end

		def TemplateFileName=(value)
			self.@_templateFileName = value
		end

		def CodeFileName
			return self.@_codeFileName
		end

		def CodeFileName=(value)
			self.@_codeFileName = value
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

		def ModelObject
			return self.@_modelObject
		end

		def ModelObject=(value)
			self.@_modelObject = value
		end
	end
end