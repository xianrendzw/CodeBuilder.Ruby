require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class Logger
		def initialize(name)
			self.@fullname = self.@name = name
			index = @fullname.LastIndexOf('.')
			if index >= 0 then
				self.@name = @fullname.Substring(index + 1)
			end
		end

		def Error(message)
			self.Log(InternalTraceLevel.Error, message)
		end

		def Error(message, args)
			self.Log(InternalTraceLevel.Error, message, args)
		end

		def Error(message, ex)
			if InternalTrace.Level >= InternalTraceLevel.Error then
				InternalTrace.Log(InternalTraceLevel.Error, message, @name, ex)
			end
		end

		def Warning(message)
			self.Log(InternalTraceLevel.Warning, message)
		end

		def Warning(message, args)
			self.Log(InternalTraceLevel.Warning, message, args)
		end

		def Info(message)
			self.Log(InternalTraceLevel.Info, message)
		end

		def Info(message, args)
			self.Log(InternalTraceLevel.Info, message, args)
		end

		def Debug(message)
			self.Log(InternalTraceLevel.Verbose, message)
		end

		def Debug(message, args)
			self.Log(InternalTraceLevel.Verbose, message, args)
		end

		def Log(level, message)
			if InternalTrace.Level >= level then
				InternalTrace.Log(level, message, @name)
			end
		end

		def Log(level, format, args)
			if InternalTrace.Level >= level then
				self.Log(level, System::String.Format(format, args))
			end
		end
	end
end