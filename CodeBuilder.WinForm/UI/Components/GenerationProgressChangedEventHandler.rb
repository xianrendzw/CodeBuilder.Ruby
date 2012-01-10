require "mscorlib"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class GenerationProgressChangedEventArgs < ProgressChangedEventArgs
		def initialize(generatedCount, errorCount, currentFileName, progressPercentage, userToken)
			self.@_generatedCount = generatedCount
			self.@_errorCount = errorCount
			self.@_currentFileName = currentFileName
		end

		def GeneratedCount
			return self.@_generatedCount
		end

		def ErrorCount
			return self.@_errorCount
		end

		def CurrentFileName
			return self.@_currentFileName
		end
	end
end