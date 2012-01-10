require "mscorlib"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "OptionsPages, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class OptionsDialog
		def OptionsDialog.Display(owner)
			OptionsDialog.Display(owner, nil)
		end

		def OptionsDialog.Display(owner, initialPage)
			TreeOptionsDialog.Display(owner, initialPage, RecentFilesOptionsPage.new("Environment.Recent Files"), CodeGeneralOptionsPage.new("Code Generation.General"), DataSourceOptionsPage.new("DataSource Manager.DataSources"), TemplateOptionsPage.new("Template Manager.Templates"), TraceOptionsPage.new("Advanced Settings.Internal Trace"))
		end
	end
end