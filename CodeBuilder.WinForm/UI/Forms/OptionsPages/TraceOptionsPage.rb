require "mscorlib"

			require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI.OptionsPages
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class TraceOptionsPage < BaseOptionsPage
		def initialize(key)
			@logger = InternalTrace.GetLogger(TraceOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def initialize(key)
			@logger = InternalTrace.GetLogger(TraceOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def LoadSettings()
			self.@isLoaded = true
			traceLevelCombox.Text = ConfigManager.OptionSection.Options["Options.InternalTraceLevel"].Value
			logDirectoryLabel.Text = ConfigManager.LogDirectory
		end

		def ApplySettings()
			begin
				ConfigManager.OptionSection.Options["Options.InternalTraceLevel"].Value = traceLevelCombox.Text
				ConfigManager.RefreshOptions()
				ConfigManager.Save()
			rescue Exception => ex
				raise ApplicationException.new("Save Options.InternalTraceLevel Failure", ex)
			ensure
			end
			level = Enum.Parse(InternalTraceLevel.Default.GetType(), traceLevelCombox.Text, true)
			InternalTrace.ReInitialize("CodeBuilder_%p.log", level)
		end
	end
end