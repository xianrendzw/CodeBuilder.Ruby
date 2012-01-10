require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.PhysicalDataModel
	class BaseTable < IMetaData
		def initialize(id, displayName, name, comment)
			self.@_id = id
			self.@_displayName = displayName
			self.@_name = name
			self.@_comment = comment
		end

		def initialize(id, displayName, name, comment)
			self.@_id = id
			self.@_displayName = displayName
			self.@_name = name
			self.@_comment = comment
		end

		def initialize(id, displayName, name, comment)
			self.@_id = id
			self.@_displayName = displayName
			self.@_name = name
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

		def MetaTypeName
			return self.@_mataTypeName
		end

		def Columns
			return self.@_columns
		end

		def Columns=(value)
			self.@_columns = value
		end
	end
end