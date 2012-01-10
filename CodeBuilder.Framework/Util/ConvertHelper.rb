require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class ConvertHelper
		def ConvertHelper.GetBoolean(value)
			return value > 0
		end

		def ConvertHelper.GetInt64(str)
			data = 0
			Int64.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetInt32(str)
			data = 0
			Int32.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetInt16(str)
			data = 0
			Int16.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetByte(str)
			data = 0
			Byte.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetFloat(str)
			data = 0
			Single.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetDouble(str)
			data = 0
			Double.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetDecimal(str)
			data = 0
			Decimal.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetSingle(str)
			data = 0
			Single.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetBoolean(str)
			data = false
			Boolean.TryParse(str, data)
			return data
		end

		def ConvertHelper.GetBytes(str)
			if String.IsNullOrEmpty(str) or str.Trim().Length == 0 then
				return nil
			end
			return System.Text.Encoding.Unicode.GetBytes(str)
		end

		def ConvertHelper.GetGuid(str)
			if String.IsNullOrEmpty(str) or str.Trim().Length == 0 then
				return Guid.Empty
			end
			data = Guid.new(str)
			return data
		end

		def ConvertHelper.GetDateTime(str)
			if String.IsNullOrEmpty(str) or str.Trim().Length == 0 then
				return DateTime.Now
			end
			data = DateTime.Now
			DateTime.TryParse(str, data)
			return data
		end
	end
end