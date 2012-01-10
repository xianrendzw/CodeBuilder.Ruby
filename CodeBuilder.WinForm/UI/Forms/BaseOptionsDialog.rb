require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class BaseOptionsDialog < Form
		def initialize()
			@logger = InternalTrace.GetLogger(BaseOptionsDialog.to_clr_type)
			self.InitializeComponent()
			self.@optionsPages = OptionsPageList.new(6)
		end

		def OptionsPages
			return @optionsPages
		end

		def ApplySettings()
			enumerator = optionsPages.GetEnumerator()
			while enumerator.MoveNext()
				page = enumerator.Current
				begin
					if page.IsLoaded then
						page.ApplySettings()
					end
				rescue Exception => ex
					@logger.Error(ex.Message, ex)
					MessageBoxHelper.DisplayFailure(ex.Message)
				ensure
				end
			end
		end

		def BaseOptionsDialog_FormClosed(sender, e)
		end

		def okButton_Click(sender, e)
			self.ApplySettings()
			DialogResult = DialogResult.OK
			self.Close()
		end

		class OptionsPageList < List
			def initialize(capacity)
			end

			def initialize(capacity)
			end

			def Item
				return self.FirstOrDefault(x.Key == key)
			end
		end
	end
end