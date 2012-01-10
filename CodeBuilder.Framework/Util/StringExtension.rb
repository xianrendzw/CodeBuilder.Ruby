require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text.RegularExpressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class StringExtension
		def StringExtension.StandardizeName(str)
			if String.IsNullOrEmpty(str) then
				return str
			end
			words = Regex.Split(str, "[_\\-\\. ]")
			return System::String.Join("", words.Select(FirstCharToUpper))
		end

		def StringExtension.FirstCharToLower(str)
			if String.IsNullOrEmpty(str) or str.Length == 0 then
				return str
			end
			if str.Length == 1 then
				return str.ToLower()
			end
			return str.Substring(0, 1).ToLower() + str.Substring(1)
		end

		def StringExtension.FirstCharToUpper(str)
			if String.IsNullOrEmpty(str) or str.Length == 0 then
				return str
			end
			if str.Length == 1 then
				return str.ToUpper()
			end
			return str.Substring(0, 1).ToUpper() + str.Substring(1)
		end

		def StringExtension.ToEmpty(str)
			if String.IsNullOrEmpty(str) or str.Length == 0 then
				return System::String.Empty
			end
			if str.Trim().Equals("''") then
				return System::String.Empty
			end
			return str
		end

		def StringExtension.SingleQuoteToDoubleQuote(str)
			if String.IsNullOrEmpty(str) or str.Length == 0 then
				return str
			end
			return Regex.Replace(str, "[']", "\"")
		end
	end
end