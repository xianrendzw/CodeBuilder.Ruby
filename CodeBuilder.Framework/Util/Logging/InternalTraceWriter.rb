require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Diagnostics, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class InternalTraceWriter < TextWriter
		def LogDirectory
			if @logDirectory == nil then
				@logDirectory = Path.Combine(Environment.CurrentDirectory, "Logs")
				if not Directory.Exists(@logDirectory) then
					Directory.CreateDirectory(@logDirectory)
				end
			end
			return @logDirectory
		end

		def initialize(logName)
			#int pId = Process.GetCurrentProcess().Id;
			#string domainName = AppDomain.CurrentDomain.FriendlyName;
			fileName = logName.Replace("%p", DateTime.Now.ToString("yyyy-MM-dd"))
			logPath = Path.Combine(self.LogDirectory, fileName)
			self.@writer = StreamWriter.new(logPath, true)
			self.@writer.AutoFlush = true
		end

		def Encoding
			return @writer.Encoding
		end

		def Write(value)
			@writer.Write(value)
		end

		def Write(value)
			self.Write(value)
		end

		def WriteLine(value)
			@writer.WriteLine(value)
		end

		def Close()
			if @writer != nil then
				@writer.Flush()
				@writer.Close()
				@writer = nil
			end
		end

		def Flush()
			if @writer != nil then
				@writer.Flush()
			end
		end
	end
end