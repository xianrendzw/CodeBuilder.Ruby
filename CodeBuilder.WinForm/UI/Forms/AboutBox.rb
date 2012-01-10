require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Reflection, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class AboutBox < Form
		def initialize()
			self.InitializeComponent()
			self.SetAboutInfo()
		end

		def OkButton_Click(sender, e)
			self.Close()
		end

		def infoLinkLabel_LinkClicked(sender, e)
			System.Diagnostics.Process.Start("http://www.dengzhiwei.com/category/codebuilder")
			infoLinkLabel.LinkVisited = true
		end

		def SetAboutInfo()
			executingAssembly = Assembly.GetExecutingAssembly()
			versionText = executingAssembly.GetName().Version.ToString()
			self.@versionLabel.Text = versionText
			dotNetVersionLabel.Text = System::String.Format(".Net Framework {0}", Environment.Version)
		end
	end
end