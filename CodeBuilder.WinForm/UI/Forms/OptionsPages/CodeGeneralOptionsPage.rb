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
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI.OptionsPages
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class CodeGeneralOptionsPage < BaseOptionsPage
		def initialize(key)
			@logger = InternalTrace.GetLogger(CodeGeneralOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def initialize(key)
			@logger = InternalTrace.GetLogger(CodeGeneralOptionsPage.to_clr_type)
			self.InitializeComponent()
		end

		def LoadSettings()
			self.@isLoaded = true
			self.@ouputPathTxtbox.Text = ConfigManager.GenerationCodeOuputPath
			self.@templatePathTxtbox.Text = ConfigManager.TemplatePath
		end

		def ApplySettings()
			begin
				templatePath = self.@templatePathTxtbox.Text
				ouputPath = self.@ouputPathTxtbox.Text
				if not Directory.Exists(templatePath) then
					Directory.CreateDirectory(templatePath)
				end
				if not Directory.Exists(ouputPath) then
					Directory.CreateDirectory(ouputPath)
				end
				ConfigManager.OptionSection.Options["CodeGeneration.General.TemplatePath"].Value = templatePath
				ConfigManager.OptionSection.Options["CodeGeneration.General.OutputPath"].Value = ouputPath
				ConfigManager.RefreshOptions()
				ConfigManager.Save()
			rescue Exception => ex
				raise ApplicationException.new("Save Options.CodeGeneration.General Failure", ex)
			ensure
			end
		end

		def ouputPathBtn_Click(sender, e)
			if self.@folderBrowserDialog.ShowDialog() == DialogResult.OK then
				self.@ouputPathTxtbox.Text = self.@folderBrowserDialog.SelectedPath
			end
		end

		def templatePathBtn_Click(sender, e)
			if self.@folderBrowserDialog.ShowDialog() == DialogResult.OK then
				self.@templatePathTxtbox.Text = self.@folderBrowserDialog.SelectedPath
			end
		end
	end
end