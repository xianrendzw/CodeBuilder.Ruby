require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class InternalTraceLevel
		def initialize()
		end
	end
	class InternalTrace
		def initialize()
		end

		#private readonly static string TIME_FMT = "HH:mm:ss.fff";
		def Writer
			return @writer
		end

		def InternalTrace.Initialize(logName)
			lev = System.Diagnostics.TraceSwitch.new("Trace", "CodeBuilder internal trace").Level
			InternalTrace.Initialize(logName, lev)
		end

		def InternalTrace.Initialize(logName, level)
			if not @initialized then
				@Level = level
				if @writer == nil and @Level > InternalTraceLevel.Off then
					@writer = InternalTraceWriter.new(logName)
					@writer.WriteLine("InternalTrace: Initializing at level " + @Level.ToString())
				end
				@initialized = true
			end
		end

		def InternalTrace.ReInitialize(logName, level)
			if @initialized then
				InternalTrace.Close()
				@initialized = false
			end
			InternalTrace.Initialize(logName, level)
		end

		def InternalTrace.Flush()
			if @writer != nil then
				@writer.Flush()
			end
		end

		def InternalTrace.Close()
			if @writer != nil then
				@writer.Close()
			end
			@writer = nil
		end

		def InternalTrace.GetLogger(name)
			return Logger.new(name)
		end

		def InternalTrace.GetLogger(type)
			return Logger.new(type.FullName)
		end

		def InternalTrace.Log(level, message, category)
			InternalTrace.Log(level, message, category, nil)
		end

		def InternalTrace.Log(level, message, category, ex)
			self.Writer.WriteLine("{0} {1,-5} [{2,2}] {3}: {4}", DateTime.Now.ToString(), level == InternalTraceLevel.Verbose ? "Debug" : level.ToString(), System.Threading.Thread.CurrentThread.ManagedThreadId, category, message)
			if ex != nil then
				self.Writer.WriteLine(ex.ToString())
			end
		end
	end
end