require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm
	require "UI, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	
	class Program
		def initialize()
			@logger = InternalTrace.GetLogger(Program.to_clr_type)
		end

		def Program.Main()
			Application.EnableVisualStyles()
			Application.SetCompatibleTextRenderingDefault(false)
			begin
				Program.InitializeTraceLevel()
				container = AppContainer.new()
				form = MainForm.new()
				container.Add(form)
				@logger.Info("Starting CodeBuilder")
				Application.Run(form)
				@logger.Info("CodeBuilder Exit")
			rescue Exception => ex
				@logger.Error("Startup", ex)
				MessageBoxHelper.DisplayFailure(ex.Message)
			ensure
			end
			InternalTrace.Close()
		end

		def Program.InitializeTraceLevel()
			traceLevel = ConfigManager.OptionSection.Options["Options.InternalTraceLevel"].Value
			level = Enum.Parse(InternalTraceLevel.Default.GetType(), traceLevel, true)
			InternalTrace.Initialize("CodeBuilder_%p.log", level)
		end
	end
end

Program.Main()