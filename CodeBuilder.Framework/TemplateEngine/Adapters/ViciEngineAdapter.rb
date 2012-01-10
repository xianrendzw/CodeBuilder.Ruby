require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "Vici.Core.Parser, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "Vici.Core.Parser.Config, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class ViciEngineAdapter < ITemplateEngine
		def initialize()
			@logger = InternalTrace.GetLogger(ViciEngineAdapter.to_clr_type)
		end

		def Run(templateData)
			begin
				template = TemplateParser[DoubleCurly].new()
				data = CSharpContext.new()
				data.Set("tdo", templateData)
				streamWriter = StreamWriter.new(templateData.CodeFileName, false, Encoding.GetEncoding(templateData.Encoding))
				streamWriter.Write(template.RenderFile(templateData.TemplateFileName, data))
				return true
			rescue Exception => ex
				@logger.Error(String.Format("ViciEngineAdapter:{0}", templateData.CodeFileName), ex)
				return false
			ensure
			end
		end
	end
end