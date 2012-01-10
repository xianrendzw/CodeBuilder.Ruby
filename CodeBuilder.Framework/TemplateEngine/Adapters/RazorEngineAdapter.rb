require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "RazorEngine, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "RazorEngine.Templating, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class RazorEngineAdapter < ITemplateEngine
		def initialize()
			@logger = InternalTrace.GetLogger(RazorEngineAdapter.to_clr_type)
		end

		def Run(templateData)
			begin
				streamWriter = StreamWriter.new(templateData.CodeFileName, false, Encoding.GetEncoding(templateData.Encoding))
				streamWriter.Write(Razor.Parse(File.ReadAllText(templateData.TemplateFileName), templateData))
				return true
			rescue Exception => ex
				@logger.Error(String.Format("RazorEngineAdapter:{0}", templateData.CodeFileName), ex)
				return false
			ensure
			end
		end
	end
end