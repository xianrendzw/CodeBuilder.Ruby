require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Reflection, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "NVelocity, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "NVelocity.App, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "NVelocity.Runtime, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "NVelocity.Util.Introspection, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class NVelocityEngineAdapter < ITemplateEngine
		def initialize()
			@logger = InternalTrace.GetLogger(NVelocityEngineAdapter.to_clr_type)
			@velocityEngine = VelocityEngine.new()
		end

		def Run(templateData)
			context = VelocityContext.new()
			context.Put("tdo", templateData)
			begin
				loaderPath = Path.GetDirectoryName(templateData.TemplateFileName)
				templateFile = Path.GetFileName(templateData.TemplateFileName)
				@velocityEngine.SetProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH, loaderPath)
				@velocityEngine.Init()
				template = @velocityEngine.GetTemplate(templateFile)
				StreamWriter = StreamWriter.new(templateData.CodeFileName, false, Encoding.GetEncoding(templateData.Encoding))
				template.Merge(context, StreamWriter)
				return true
			rescue Exception => ex
				@logger.Error(String.Format("NVelocityAdapter:{0}", templateData.CodeFileName), ex)
				return false
			ensure
			end
		end
	end
	class NVelocityDuck < IDuck
		def initialize(instance)
			if instance == nil then
				raise ArgumentNullException.new("instance")
			end
			@_extensionTypes = Array[Type].new([StringExtension.to_clr_type])
			@_instance = instance
			@_instanceType = @_instance.GetType()
		end

		def Introspector
			if @_introspector == nil then
				@_introspector = RuntimeSingleton.Introspector
			end
			return @_introspector
		end

		def Introspector=(value)
			@_introspector = value
		end

		def GetInvoke(propName)
			return nil
		end

		def SetInvoke(propName, value)
		end

		def Invoke(method, args)
			if System::String.IsNullOrEmpty(method) then
				return nil
			end
			methodInfo = self.Introspector.GetMethod(@_instanceType, method, args)
			if methodInfo != nil then
				return methodInfo.Invoke(@_instance, args)
			end
			extensionArgs = Array.CreateInstance(System::Object, args.Length + 1)
			extensionArgs[0] = @_instance
			Array.Copy(args, 0, extensionArgs, 1, args.Length)
			enumerator = _extensionTypes.GetEnumerator()
			while enumerator.MoveNext()
				extensionType = enumerator.Current
				methodInfo = self.Introspector.GetMethod(extensionType, method, extensionArgs)
				if methodInfo != nil then
					return methodInfo.Invoke(nil, extensionArgs)
				end
			end
			return nil
		end
	end
end