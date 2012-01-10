require "mscorlib"

			require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Specialized, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Threading, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "TemplateEngine, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class CodeGeneration < Component
		def initialize(container)
			@logger = InternalTrace.GetLogger(CodeGeneration.to_clr_type)
			@userStateToLifetime = HybridDictionary.new()
			container.Add(self)
			self.InitializeComponent()
			self.InitializeDelegates()
		end

		def initialize(container)
			@logger = InternalTrace.GetLogger(CodeGeneration.to_clr_type)
			@userStateToLifetime = HybridDictionary.new()
			container.Add(self)
			self.InitializeComponent()
			self.InitializeDelegates()
		end

		def InitializeDelegates()
			@onProgressReportDelegate = SendOrPostCallback.new(ReportProgress)
			@onCompletedDelegate = SendOrPostCallback.new(GenerateCompleted)
		end

		def GenerateAsync(parameter, taskId)
			asyncOp = AsyncOperationManager.CreateOperation(taskId)
@userStateToLifetime.SyncRoot			if @userStateToLifetime.Contains(taskId) then
				raise ArgumentException.new("Task ID parameter must be unique", "taskId")
			end
			@userStateToLifetime[taskId] = asyncOp
			workerDelegate = WorkerEventHandler.new(GenerateWorker)
			workerDelegate.BeginInvoke(parameter, asyncOp, nil, nil)
		end

		def CancelAsync(taskId)
			asyncOp = @userStateToLifetime[taskId]
			if asyncOp != nil then
@userStateToLifetime.SyncRoot				@userStateToLifetime.Remove(taskId)
			end
		end

		def GenerateWorker(parameter, asyncOp)
			if self.IsTaskCanceled(asyncOp.UserSuppliedState) then
				return 
			end
			genratedCount = 0
			errorCount = 0
			progressCount = 0
			begin
				adapterTypeName = ConfigManager.SettingsSection.TemplateEngines[parameter.Settings.TemplateEngine].Adapter
				templateEngine = Activator.CreateInstance(Type.GetType(adapterTypeName))
				enumerator = parameter.Settings.TemplatesNames.GetEnumerator()
				while enumerator.MoveNext()
					templateName = enumerator.Current
					self.GenerateCode(parameter, templateEngine, templateName, genratedCount, errorCount, progressCount, asyncOp)
				end
			rescue Exception => ex
				@logger.Error("", ex)
			ensure
			end
			self.CompletionMethod(nil, self.IsTaskCanceled(asyncOp.UserSuppliedState), asyncOp)
		end

		def GenerateCode(parameter, templateEngine, templateName, genratedCount, errorCount, progressCount, asyncOp)
			enumerator = parameter.GenerationObjects.Keys.GetEnumerator()
			while enumerator.MoveNext()
				modelId = enumerator.Current
				codeFileNamePath = PathHelper.GetCodeFileNamePath(ConfigManager.GenerationCodeOuputPath, ConfigManager.SettingsSection.Languages[parameter.Settings.Language].Alias, ConfigManager.SettingsSection.TemplateEngines[parameter.Settings.TemplateEngine].Name, ConfigManager.TemplateSection.Templates[templateName].DisplayName, parameter.Settings.Package, modelId)
				PathHelper.CreateCodeFileNamePath(codeFileNamePath)
				enumerator = .GetEnumerator()
				while enumerator.MoveNext()
					objId = enumerator.Current
					modelObject = ModelManager.GetModelObject(parameter.Models[modelId], objId)
					templateData = TemplateDataBuilder.Build(modelObject, parameter.Settings, templateName, parameter.Models[modelId].Database, modelId)
					if templateData == nil or not templateEngine.Run(templateData) then
						errorCount += 1
					else
						genratedCount += 1
					end
					currentCodeFileName = templateData == nil ? System::String.Empty : templateData.CodeFileName
					args = GenerationProgressChangedEventArgs.new(genratedCount, errorCount, currentCodeFileName, progressCount += 1, asyncOp.UserSuppliedState)
					asyncOp.Post(self.@onProgressReportDelegate, args)
				end
			end
		end

		def GenerateCompleted(operationState)
			e = operationState
			self.OnCompleted(e)
		end

		def ReportProgress(state)
			e = state
			self.OnProgressChanged(e)
		end

		def OnCompleted(e)
			if Completed != nil then
				self.Completed(self, e)
			end
		end

		def OnProgressChanged(e)
			if ProgressChanged != nil then
				self.ProgressChanged(e)
			end
		end

		def CompletionMethod(exception, canceled, asyncOp)
			if not canceled then
@userStateToLifetime.SyncRoot				@userStateToLifetime.Remove(asyncOp.UserSuppliedState)
			end
			e = GenerationCompletedEventArgs.new(exception, canceled, asyncOp.UserSuppliedState)
			asyncOp.PostOperationCompleted(@onCompletedDelegate, e)
		end

		def IsTaskCanceled(taskId)
			return (@userStateToLifetime[taskId] == nil)
		end
	end
end