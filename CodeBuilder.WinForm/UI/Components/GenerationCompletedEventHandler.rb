require "mscorlib"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class GenerationCompletedEventArgs < AsyncCompletedEventArgs
		def initialize(ex, canceled, state)
		end
	end
end