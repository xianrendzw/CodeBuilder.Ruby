require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "Ader.TemplateEngine, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class AderEngineAdapter < ITemplateEngine
		def initialize()
			@logger = InternalTrace.GetLogger(AderEngineAdapter.to_clr_type)
		end

		def Run(templateData)
			begin
				mngr = TemplateManager.FromFile(templateData.TemplateFileName)
				mngr.SetValue("tdo", templateData)
				StreamWriter = StreamWriter.new(templateData.CodeFileName, false, Encoding.GetEncoding(templateData.Encoding))
				mngr.Process(StreamWriter)
				return true
			rescue Exception => ex
				@logger.Error(String.Format("AderEngineAdapter:{0}", templateData.CodeFileName), ex)
				return false
			ensure
			end
		end
	end
end