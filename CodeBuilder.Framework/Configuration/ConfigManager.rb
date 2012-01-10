require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Specialized, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Threading, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Reflection, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Exceptions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class ConfigManager
		def initialize()
			@settingsSectionName = "codebuilder/settingsSection"
			@typeMappingSectionName = "codebuilder/typeMappingSection"
			@dataSourceSectionName = "codebuilder/dataSourceSection"
			@templateSectionName = "codebuilder/templateSection"
			@optionSectionName = "codebuilder/optionSection"
			self.LoadConfiguration()
		end

		def SettingsSection
			return self.GetConfigSection(@settingsSectionName)
		end

		def TypeMappingSection
			return self.GetConfigSection(@typeMappingSectionName)
		end

		def DataSourceSection
			return self.GetConfigSection(@dataSourceSectionName)
		end

		def TemplateSection
			return self.GetConfigSection(@templateSectionName)
		end

		def OptionSection
			return self.GetConfigSection(@optionSectionName)
		end

		def ApplicationDataDirectory
			if @applicationDataDirectory == nil then
				@applicationDataDirectory = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CodeBuilder")
			end
			return @applicationDataDirectory
		end

		def AppCurrentDirectory
			return Environment.CurrentDirectory
		end

		def TemplatePath
			templatePath = self.OptionSection.Options["CodeGeneration.General.TemplatePath"].Value
			if System::String.IsNullOrEmpty(templatePath) or templatePath.Trim().Length == 0 then
				templatePath = Path.Combine(self.AppCurrentDirectory, "Templates")
			end
			if not Directory.Exists(templatePath) then
				Directory.CreateDirectory(templatePath)
			end
			return templatePath
		end

		def GenerationCodeOuputPath
			templatePath = self.OptionSection.Options["CodeGeneration.General.OutputPath"].Value
			if System::String.IsNullOrEmpty(templatePath) or templatePath.Trim().Length == 0 then
				templatePath = Path.Combine(self.AppCurrentDirectory, "Codes")
			end
			if not Directory.Exists(templatePath) then
				Directory.CreateDirectory(templatePath)
			end
			return templatePath
		end

		def LogDirectory
			return Path.Combine(Environment.CurrentDirectory, "Logs")
		end

		def HelpUrl
			helpUrl = self.SettingsSection.AppSettings["helpUrl"].Value
			if helpUrl != nil then
				return helpUrl
			end
			helpUrl = "http://www.dengzhiwei.com/category/codebuilder"
			localPath = Path.Combine(self.AppCurrentDirectory, @"doc/index.html")
			if File.Exists(localPath) then
				uri = UriBuilder.new()
				uri.Scheme = "file"
				uri.Host = "localhost"
				uri.Path = localPath
				helpUrl = uri.ToString()
			end
			return helpUrl
		end

		def FeedbackUrl
			feedbackUrl = self.SettingsSection.AppSettings["feedbackUrl"].Value
			if feedbackUrl != nil then
				return feedbackUrl
			end
			return feedbackUrl = "http://www.dengzhiwei.com/category/codebuilder-feedback"
		end

		def OnlineTemplateUrl
			onlineTemplateUrl = self.SettingsSection.AppSettings["onlineTemplateUrl"].Value
			if onlineTemplateUrl != nil then
				return onlineTemplateUrl
			end
			return onlineTemplateUrl = "http://www.dengzhiwei.com/category/codebuilder-templates"
		end

		def ConfigManager.RefreshSettings()
			ConfigurationManager.RefreshSection(@settingsSectionName)
		end

		def ConfigManager.RefreshTypeMapping()
			ConfigurationManager.RefreshSection(@typeMappingSectionName)
		end

		def ConfigManager.RefreshDataSources()
			ConfigurationManager.RefreshSection(@dataSourceSectionName)
		end

		def ConfigManager.RefreshTemplates()
			ConfigurationManager.RefreshSection(@templateSectionName)
		end

		def ConfigManager.RefreshOptions()
			ConfigurationManager.RefreshSection(@optionSectionName)
		end

		def ConfigManager.Save()
			begin
				@config.Save(ConfigurationSaveMode.Modified)
				@config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None)
			rescue Exception => ex
				raise ConfigurationErrorsException.new("Save configuration failure", ex)
			ensure
			end
		end

		def ConfigManager.LoadConfiguration()
			begin
				@config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None)
			rescue Exception => ex
				raise ConfigurationErrorsException.new("Load configuration failure", ex)
			ensure
			end
		end

		def ConfigManager.GetConfigSection(name)
			begin
				return @config.GetSection(name)
			rescue Exception => ex
				raise ConfigurationErrorsException.new(System::String.Format("ConfigurationSection {0} load failure", name), ex)
			ensure
			end
		end
	end
end