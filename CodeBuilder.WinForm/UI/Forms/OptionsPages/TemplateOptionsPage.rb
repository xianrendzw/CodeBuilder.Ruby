require "mscorlib"

			require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI.OptionsPages
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class TemplateOptionsPage < BaseOptionsPage
		def initialize(key)
			@logger = InternalTrace.GetLogger(TemplateOptionsPage.to_clr_type)
			@listBoxItems = Dictionary[System::String, TemplateItem].new(20)
			self.InitializeComponent()
		end

		def initialize(key)
			@logger = InternalTrace.GetLogger(TemplateOptionsPage.to_clr_type)
			@listBoxItems = Dictionary[System::String, TemplateItem].new(20)
			self.InitializeComponent()
		end

		def LoadSettings()
			self.@isLoaded = true
			self.SetComboBoxItems()
			self.ListTemplateItems()
		end

		def ApplySettings()
			begin
				self.SaveChanged()
				self.@listBoxItems.Clear()
				ConfigManager.RefreshTemplates()
				ConfigManager.Save()
			rescue Exception => ex
				raise ApplicationException.new("Save Template Items Failure", ex)
			ensure
			end
		end

		def templateListbox_SelectedIndexChanged(sender, e)
			if self.@templateListbox.SelectedItem == nil then
				return 
			end
			self.SelectedListBoxItem(self.@templateListbox.SelectedItem.ToString())
		end

		def openFileDialogBtn_Click(sender, e)
			if self.@openFileDialog.ShowDialog() == DialogResult.OK then
				self.@fileNameTextbox.Text = self.@openFileDialog.FileName
			end
		end

		def editBtn_Click(sender, e)
			if self.@fileNameTextbox.Text.Trim().Length == 0 then
				return 
			end
			begin
				System.Diagnostics.Process.Start("Notepad.exe", self.@fileNameTextbox.Text)
			rescue Exception => ex
				@logger.Error("Edit Template File", ex)
				MessageBoxHelper.DisplayFailure("Edit template file failure!")
			ensure
			end
		end

		def removeBtn_Click(sender, e)
			selectedItem = self.@templateListbox.SelectedItem
			if selectedItem == nil then
				return 
			end
			name = selectedItem.ToString().Trim().ToLower()
			self.@listBoxItems[name].Status = TemplateItemStatus.Deleted
			begin
				self.@templateListbox.Items.RemoveAt(self.@templateListbox.SelectedIndex)
			rescue Exception => ex
				@logger.Error("Remove template item failure!", ex)
				MessageBoxHelper.DisplayFailure("Remove template item failure!")
			ensure
			end
		end

		def newsaveBtn_Click(sender, e)
			language = self.@languageCombox.Text.Trim()
			engine = self.@engineCombox.Text.Trim()
			fileName = self.@fileNameTextbox.Text.Trim()
			displayName = self.@displayNameTxtbox.Text.Trim()
			prefix = self.@prefixTxtBox.Text.Trim()
			suffix = self.@suffixTxtBox.Text.Trim()
			if displayName.Length == 0 or fileName.Length == 0 then
				MessageBoxHelper.Display("DisplayName or FileName cann't set empty")
				return 
			end
			if not File.Exists(fileName) then
				MessageBoxHelper.Display("Template file not found")
				return 
			end
			begin
				name = self.GetTemplateUniqueName(language, engine, displayName)
				if self.@listBoxItems.ContainsKey(name) then
					self.@listBoxItems[name].Name = name
					self.@listBoxItems[name].Language = language
					self.@listBoxItems[name].Engine = engine
					self.@listBoxItems[name].FileName = fileName
					self.@listBoxItems[name].DisplayName = displayName
					self.@listBoxItems[name].Prefix = prefix
					self.@listBoxItems[name].Suffix = suffix
					if self.@listBoxItems[name].Status != TemplateItemStatus.New then
						self.@listBoxItems[name].Status = TemplateItemStatus.Edit
					end
					return 
				end
				self.@listBoxItems.Add(name, TemplateItem.new(name, language, engine, fileName, displayName, prefix, suffix, TemplateItemStatus.New))
				self.@templateListbox.Items.Add(name)
			rescue Exception => ex
				@logger.Error("Save/New Template File", ex)
				MessageBoxHelper.DisplayFailure("Save/New template file failure!")
			ensure
			end
		end

		def getItFromOnlineBtn_Click(sender, e)
		end

		def SetComboBoxItems()
			self.@languageCombox.Items.Clear()
			self.@engineCombox.Items.Clear()
			enumerator = ConfigManager.SettingsSection.Languages.GetEnumerator()
			while enumerator.MoveNext()
				language = enumerator.Current
				self.@languageCombox.Items.Add(language.Name)
			end
			enumerator = ConfigManager.SettingsSection.TemplateEngines.GetEnumerator()
			while enumerator.MoveNext()
				templateEngine = enumerator.Current
				self.@engineCombox.Items.Add(templateEngine.Name)
			end
			self.@languageCombox.Text = self.@languageCombox.Items[0].ToString()
			self.@engineCombox.Text = self.@engineCombox.Items[0].ToString()
		end

		def ListTemplateItems()
			self.@templateListbox.Items.Clear()
			self.@listBoxItems.Clear()
			enumerator = ConfigManager.TemplateSection.Templates.GetEnumerator()
			while enumerator.MoveNext()
				template = enumerator.Current
				name = template.Name.Trim()
				fileName = Path.Combine(ConfigManager.TemplatePath, template.FileName)
				if not @listBoxItems.ContainsKey(name) then
					self.@templateListbox.Items.Add(name)
					@listBoxItems.Add(name, TemplateItem.new(template.Name, template.Language, template.Engine, fileName, template.DisplayName, template.Prefix, template.Suffix))
				end
			end
		end

		def SelectedListBoxItem(selectedItem)
			if selectedItem == nil then
				return 
			end
			name = selectedItem.ToString()
			if not @listBoxItems.ContainsKey(name) then
				return 
			end
			self.@languageCombox.Text = @listBoxItems[name].Language
			self.@engineCombox.Text = @listBoxItems[name].Engine
			self.@displayNameTxtbox.Text = @listBoxItems[name].DisplayName
			self.@fileNameTextbox.Text = @listBoxItems[name].FileName
			self.@prefixTxtBox.Text = @listBoxItems[name].Prefix
			self.@suffixTxtBox.Text = @listBoxItems[name].Suffix
		end

		def SaveChanged()
			enumerator = self.@listBoxItems.GetEnumerator()
			while enumerator.MoveNext()
				item = enumerator.Current
				if item.Value.Status == TemplateItemStatus.None then
					next
				end
				if item.Value.Status == TemplateItemStatus.Deleted then
					ConfigManager.TemplateSection.Templates.Remove(item.Value.Name)
					next
				end
				item.Value.FileName = self.GetTemplateReleatedFileName(item.Value)
				if System::String.IsNullOrEmpty(item.Value.FileName) then
					next
				end
				if item.Value.Status == TemplateItemStatus.New then
					self.AddTemplate(item.Value)
					next
				end
				if item.Value.Status == TemplateItemStatus.Edit then
					self.EditTemplate(item.Value)
					next
				end
			end
		end

		def AddTemplate(item)
			element = TemplateElement.new()
			element.Name = item.Name
			element.Language = item.Language
			element.Engine = item.Engine
			element.FileName = item.FileName
			element.DisplayName = item.DisplayName
			element.Prefix = item.Prefix
			element.Suffix = item.Suffix
			element.Url = item.Url
			element.Description = item.Description
			ConfigManager.TemplateSection.Templates.Add(element)
		end

		def EditTemplate(item)
			ConfigManager.TemplateSection.Templates[item.Name].Name = item.Name
			ConfigManager.TemplateSection.Templates[item.Name].Language = item.Language
			ConfigManager.TemplateSection.Templates[item.Name].Engine = item.Engine
			ConfigManager.TemplateSection.Templates[item.Name].FileName = item.FileName
			ConfigManager.TemplateSection.Templates[item.Name].DisplayName = item.DisplayName
			ConfigManager.TemplateSection.Templates[item.Name].Prefix = item.Prefix
			ConfigManager.TemplateSection.Templates[item.Name].Suffix = item.Suffix
			ConfigManager.TemplateSection.Templates[item.Name].Url = item.Url
			ConfigManager.TemplateSection.Templates[item.Name].Description = item.Description
		end

		def GetTemplateReleatedFileName(item)
			languageAlais = ConfigManager.SettingsSection.Languages[item.Language].Alias
			fileName = self.CopyTemplateFile(item.DisplayName.ToLower(), languageAlais, item.Engine, item.FileName)
			return fileName.Replace(ConfigManager.TemplatePath, "").TrimStart('\\', '/')
		end

		def CopyTemplateFile(displayName, language, engine, srcFileName)
			destFileName = System::String.Empty
			begin
				if File.Exists(srcFileName) then
					path = Path.Combine(ConfigManager.TemplatePath, language, engine)
					enginext = ConfigManager.SettingsSection.TemplateEngines[engine].Extension
					destFileName = Path.Combine(path, displayName + enginext)
					if destFileName.Equals(srcFileName, StringComparison.CurrentCultureIgnoreCase) then
						return srcFileName
					end
					if not Directory.Exists(path) then
						Directory.CreateDirectory(path)
					end
					File.Copy(srcFileName, destFileName, true)
				end
			rescue Exception => ex
				destFileName = System::String.Empty
				@logger.Error(System::String.Format("Save template file: {0} failure!", srcFileName), ex)
			ensure
			end
			return destFileName
		end

		def GetTemplateUniqueName(language, engineName, displayName)
			langext = ConfigManager.SettingsSection.Languages[language].Extension
			enginext = ConfigManager.SettingsSection.TemplateEngines[engineName].Extension
			return System::String.Format("{0}{1}{2}", displayName, langext, enginext).ToLower()
		end

		class TemplateItem
			def initialize(name, language, engine, fileName, displayName, prefix, suffix, url, desc, status)
				self.@Name = name
				self.@Language = language
				self.@Engine = engine
				self.@FileName = fileName
				self.@DisplayName = displayName
				self.@Prefix = prefix
				self.@Suffix = suffix
				self.@Url = url
				self.@Description = desc
				self.@Status = status
			end

			def initialize(name, language, engine, fileName, displayName, prefix, suffix, url, desc, status)
				self.@Name = name
				self.@Language = language
				self.@Engine = engine
				self.@FileName = fileName
				self.@DisplayName = displayName
				self.@Prefix = prefix
				self.@Suffix = suffix
				self.@Url = url
				self.@Description = desc
				self.@Status = status
			end

			def initialize(name, language, engine, fileName, displayName, prefix, suffix, url, desc, status)
				self.@Name = name
				self.@Language = language
				self.@Engine = engine
				self.@FileName = fileName
				self.@DisplayName = displayName
				self.@Prefix = prefix
				self.@Suffix = suffix
				self.@Url = url
				self.@Description = desc
				self.@Status = status
			end

			def initialize(name, language, engine, fileName, displayName, prefix, suffix, url, desc, status)
				self.@Name = name
				self.@Language = language
				self.@Engine = engine
				self.@FileName = fileName
				self.@DisplayName = displayName
				self.@Prefix = prefix
				self.@Suffix = suffix
				self.@Url = url
				self.@Description = desc
				self.@Status = status
			end

			def Name
			end

			def Name=(value)
			end

			def Language
			end

			def Language=(value)
			end

			def Engine
			end

			def Engine=(value)
			end

			def FileName
			end

			def FileName=(value)
			end

			def DisplayName
			end

			def DisplayName=(value)
			end

			def Prefix
			end

			def Prefix=(value)
			end

			def Suffix
			end

			def Suffix=(value)
			end

			def Url
			end

			def Url=(value)
			end

			def Description
			end

			def Description=(value)
			end

			def Status
			end

			def Status=(value)
			end
		end
		class TemplateItemStatus
			def initialize()
			end
		end
	end
end