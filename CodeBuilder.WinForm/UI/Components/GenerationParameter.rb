require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class GenerationParameter
		def initialize(models, generationObjects, settings)
			self.@_models = models
			self.@_generationObjects = generationObjects
			self.@_settings = settings
		end

		def Models
			return self.@_models
		end

		def GenerationObjects
			return self.@_generationObjects
		end

		def Settings
			return self.@_settings
		end
	end
end