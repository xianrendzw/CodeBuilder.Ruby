require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.PhysicalDataModel
	class Column < IMetaData
		def initialize(id, displayName, name, dataType, comment)
			@_languageType = System::String.Empty
			@_languageDefaultValue = System::String.Empty
			@_ordinal = -1
			self.@_comment = comment
		end

		def initialize(id, displayName, name, dataType, comment)
			@_languageType = System::String.Empty
			@_languageDefaultValue = System::String.Empty
			@_ordinal = -1
			self.@_comment = comment
		end

		def initialize(id, displayName, name, dataType, comment)
			@_languageType = System::String.Empty
			@_languageDefaultValue = System::String.Empty
			@_ordinal = -1
			self.@_comment = comment
		end

		def initialize(id, displayName, name, dataType, comment)
			@_languageType = System::String.Empty
			@_languageDefaultValue = System::String.Empty
			@_ordinal = -1
			self.@_comment = comment
		end

		def Id
			return self.@_id
		end

		def Id=(value)
			self.@_id = value
		end

		def DisplayName
			return self.@_displayName
		end

		def DisplayName=(value)
			self.@_displayName = value
		end

		def Name
			return self.@_name
		end

		def Name=(value)
			self.@_name = value
		end

		def OriginalName
			return self.@_originalName == System::String.Empty
		end

		def OriginalName=(value)
			self.@_originalName = value
		end

		def Comment
			return self.@_comment
		end

		def Comment=(value)
			self.@_comment = value
		end

		def DataType
			return self.@_dataType
		end

		def DataType=(value)
			self.@_dataType = value
		end

		def Length
			return self.@_length
		end

		def Length=(value)
			self.@_length = value
		end

		def IsAutoIncremented
			return self.@_isAutoIncremented
		end

		def IsAutoIncremented=(value)
			self.@_isAutoIncremented = value
		end

		def IsNullable
			return self.@_isNullable
		end

		def IsNullable=(value)
			self.@_isNullable = value
		end

		def DefaultValue
			return self.@_defaultValue
		end

		def DefaultValue=(value)
			self.@_defaultValue = value
		end

		def LanguageType
			return self.@_languageType == System::String.Empty
		end

		def LanguageType=(value)
			self.@_languageType = value
		end

		def LanguageDefaultValue
			return self.@_languageDefaultValue == System::String.Empty
		end

		def LanguageDefaultValue=(value)
			self.@_languageDefaultValue = value
		end

		def Ordinal
			return self.@_ordinal
		end

		def Ordinal=(value)
			self.@_ordinal = value
		end

		def HasDefault
			return self.@_hasDefault
		end

		def HasDefault=(value)
			self.@_hasDefault = value
		end

		def IsComputed
			return self.@_isComputed
		end

		def IsComputed=(value)
			self.@_isComputed = value
		end

		def MetaTypeName
			return "column"
		end
	end
end