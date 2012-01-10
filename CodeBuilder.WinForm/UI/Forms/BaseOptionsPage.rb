require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class BaseOptionsPage < UserControl
		def initialize(key)
			self.@key = key
			self.@title = key
			dot = key.LastIndexOf('.')
			if dot >= 0 then
				@title = key.Substring(dot + 1)
			end
		end

		def initialize(key)
			self.@key = key
			self.@title = key
			dot = key.LastIndexOf('.')
			if dot >= 0 then
				@title = key.Substring(dot + 1)
			end
		end

		def OnLoad(e)
			self.OnLoad(e)
			if not DesignMode then
				self.LoadSettings()
			end
		end

		def Key
			return @key
		end

		def Title
			return @title
		end

		def IsLoaded
			return self.@isLoaded
		end

		def LoadSettings()
		end

		def ApplySettings()
		end
	end
end