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
	class RecentFilesOptionsPage < BaseOptionsPage
		def initialize(key)
			@logger = InternalTrace.GetLogger(RecentFilesOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def initialize(key)
			@logger = InternalTrace.GetLogger(RecentFilesOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def LoadSettings()
			self.@isLoaded = true
			self.@recentFilesCountTextBox.Text = ConfigManager.OptionSection.Options["Environment.RecentFiles.MaxFiles"].Value
			value = ConfigManager.OptionSection.Options["Environment.RecentFiles.IsCheckFileExist"].Value
			self.@checkFilesExistCheckBox.Checked = ConvertHelper.GetBoolean(value)
		end

		def ApplySettings()
			begin
				ConfigManager.OptionSection.Options["Environment.RecentFiles.MaxFiles"].Value = self.@recentFilesCountTextBox.Text
				ConfigManager.OptionSection.Options["Environment.RecentFiles.IsCheckFileExist"].Value = self.@checkFilesExistCheckBox.Checked.ToString()
				ConfigManager.RefreshOptions()
				ConfigManager.Save()
			rescue Exception => ex
				raise ApplicationException.new("Save Environment.RecentFiles Failure", ex)
			ensure
			end
		end
	end
end