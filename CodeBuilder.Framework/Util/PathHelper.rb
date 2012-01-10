require "mscorlib"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class PathHelper
		def PathHelper.CreateCodeFileNamePath(path)
			if not Directory.Exists(path) then
				Directory.CreateDirectory(path)
			end
		end

		def PathHelper.GetCodeFileNamePath(outputPath, languageAlias, engineName, templateName, packageName, modelId)
			return Path.Combine(outputPath, modelId, languageAlias, engineName, templateName, packageName)
		end

		def PathHelper.GetCodeFileName(outputPath, languageAlias, engineName, templateName, packageName, modelId, fileName)
			return Path.Combine(PathHelper.GetCodeFileNamePath(outputPath, languageAlias, engineName, templateName, packageName, modelId), fileName)
		end
	end
end