﻿require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.PhysicalDataModel
	class View < BaseTable
		def initialize(id, displayName, name, comment)
			self.@_mataTypeName = "view"
		end

		def initialize(id, displayName, name, comment)
			self.@_mataTypeName = "view"
		end

		def initialize(id, displayName, name, comment)
			self.@_mataTypeName = "view"
		end
	end
end