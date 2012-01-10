require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class MessageBoxHelper
		def initialize()
			@dialogCaption = "CodeBuilder"
		end

		def MessageBoxHelper.Display(message)
			return MessageBoxHelper.Display(message, @dialogCaption, MessageBoxButtons.OK, MessageBoxIcon.None)
		end

		def MessageBoxHelper.Display(message, caption)
			return MessageBoxHelper.Display(message, caption, MessageBoxButtons.OK, MessageBoxIcon.None)
		end

		def MessageBoxHelper.Display(message, buttons)
			return MessageBoxHelper.Display(message, @dialogCaption, buttons, MessageBoxIcon.None)
		end

		def MessageBoxHelper.Display(message, buttons, icon)
			return MessageBoxHelper.Display(message, @dialogCaption, buttons, icon)
		end

		def MessageBoxHelper.Display(message, caption, buttons, icon)
			return MessageBox.Show(message, caption, buttons, icon)
		end

		def MessageBoxHelper.DisplayFailure(message)
			return MessageBoxHelper.DisplayFailure(message, @dialogCaption)
		end

		def MessageBoxHelper.DisplayFailure(message, caption)
			return MessageBoxHelper.Display(message, caption, MessageBoxButtons.OK, MessageBoxIcon.Stop)
		end

		def MessageBoxHelper.DisplayFailure(exception, caption)
			return MessageBoxHelper.DisplayFailure(exception, nil, caption)
		end

		def MessageBoxHelper.DisplayFailure(exception, message, caption)
			ex = exception
			sb = StringBuilder.new()
			sb.AppendFormat("{0} : {1}", ex.GetType().ToString(), ex.Message)
			while ex.InnerException != nil
				ex = ex.InnerException
				sb.AppendFormat("\r----> {0} : {1}", ex.GetType().ToString(), ex.Message)
			end
			if message != nil then
				sb.AppendFormat("\r\r{0}", message)
			end
			sb.Append("\r\rFor further information, use the Exception Details menu item.")
			return MessageBoxHelper.DisplayFailure(sb.ToString(), caption)
		end

		def MessageBoxHelper.DisplayFatalError(exception, message, caption)
			ex = exception
			sb = StringBuilder.new()
			sb.AppendFormat("{0} : {1}", ex.GetType().ToString(), ex.Message)
			while ex.InnerException != nil
				ex = ex.InnerException
				sb.AppendFormat("\r----> {0} : {1}", ex.GetType().ToString(), ex.Message)
			end
			if message != nil then
				sb.AppendFormat("\r\r{0}", message)
			end
			return MessageBoxHelper.DisplayFailure(sb.ToString(), caption)
		end

		def MessageBoxHelper.DisplayInfo(message)
			return MessageBoxHelper.DisplayInfo(message, @dialogCaption)
		end

		def MessageBoxHelper.DisplayInfo(message, caption)
			return MessageBoxHelper.Display(message, caption, MessageBoxButtons.OK, MessageBoxIcon.Information)
		end

		def MessageBoxHelper.Ask(message, buttons)
			return MessageBoxHelper.Ask(message, @dialogCaption, buttons)
		end

		def MessageBoxHelper.Ask(message)
			return MessageBoxHelper.Ask(message, @dialogCaption, MessageBoxButtons.YesNo)
		end

		def MessageBoxHelper.Ask(message, caption)
			return MessageBoxHelper.Display(message, caption, MessageBoxButtons.YesNo, MessageBoxIcon.Question)
		end

		def MessageBoxHelper.Ask(message, caption, buttons)
			return MessageBoxHelper.Display(message, caption, buttons, MessageBoxIcon.Question)
		end
	end
end