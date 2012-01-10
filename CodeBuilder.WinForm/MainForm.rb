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

module CodeBuilder.WinForm
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "UI, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class MainForm < Form
		def initialize()
			@logger = InternalTrace.GetLogger(MainForm.to_clr_type)
			self.InitializeComponent()
			self.InitializeUIData()
		end

		def InitializeUIData()
			self.SetComboBoxItems()
			self.SetStatusItems()
		end

		def fileOpenMenuItem_Click(sender, e)
			self.@openFileDialog.Title = "Open Generation Settings File"
			self.@openFileDialog.Filter = "Generation Settings (*.xml)|*.xml"
			if self.@openFileDialog.ShowDialog() == DialogResult.OK then
				xmlFileName = self.@openFileDialog.FileName
				begin
					self.SetGenerationSettings(xmlFileName)
				rescue Exception => ex
					@logger.Error("Open Generation Settings File", ex)
					MessageBoxHelper.DisplayFailure("Invalid Generation Settings File")
					return 
				ensure
				end
				menuItemText = System::String.Format("Save {0}...", Path.GetFileName(xmlFileName))
				self.@fileSaveMenuItem.Text = menuItemText
				self.@saveGenSettingCtxMenuItem.Text = menuItemText
				self.@currentGenerationSettingsFile = xmlFileName
				self.@statusBarReady.Text = System::String.Format("Open {0}", xmlFileName)
			end
		end

		def fileSaveMenuItem_Click(sender, e)
			if not self.CheckParameters() then
				return 
			end
			settings = self.GetGenerationSettings()
			xmlFileName = self.@currentGenerationSettingsFile
			cmdText = "Modified"
			if System::String.IsNullOrEmpty(xmlFileName) then
				cmdText = "Saved"
				self.@saveFileDialog.Filter = "Generation Settings (*.xml)|*.xml"
				self.@saveFileDialog.DefaultExt = ".xml"
				self.@saveFileDialog.FileName = "New_GenerationSettings.xml"
				if self.@saveFileDialog.ShowDialog() == DialogResult.OK then
					xmlFileName = self.@saveFileDialog.FileName
				else
					return 
				end
			end
			begin
				SerializeHelper.XmlSerialize(settings, xmlFileName)
			rescue Exception => ex
				@logger.Error("Save Generation Settings File", ex)
				MessageBoxHelper.DisplayFailure(ex.Message)
				return 
			ensure
			end
			self.@statusBarReady.Text = System::String.Format("{0} {1}", cmdText, xmlFileName)
			self.@currentGenerationSettingsFile = xmlFileName
		end

		def fileExportPdmMenuItem_Click(sender, e)
			self.@openFileDialog.Title = "Open PowerDesigner PDM File"
			self.@openFileDialog.Filter = "Physical Data Model (*.pdm)|*.pdm"
			if self.@openFileDialog.ShowDialog() == DialogResult.OK then
				pdmFileName = self.@openFileDialog.FileName
				begin
					rootNode = ExportModelHelper.ExportPDM(pdmFileName, self.@treeView)
					rootNode.ExpandAll()
					self.@treeView.SelectedNode = rootNode
				rescue Exception => ex
					if self.@treeView.Nodes.Count > 0 then
						self.@treeView.Nodes[self.@treeView.Nodes.Count - 1].Remove()
					end
					@logger.Error("Export PDM File", ex)
					MessageBoxHelper.Display(ex.Message)
					return 
				ensure
				end
				self.@clearCtxMenuItem.Enabled = true
				self.@statusBarReady.Text = System::String.Format("Export {0}", pdmFileName)
			end
		end

		def fileExportDataSourceMenuItem_MouseHover(sender, e)
			self.AddDataSourceMenuItems(self.@fileExportDataSourceMenuItem)
		end

		def fileExportDataSourceMenuItem_Click(sender, e)
			menuItem = sender
			begin
				rootNode = ExportModelHelper.Export(menuItem.Text, self.@treeView)
				rootNode.ExpandAll()
				self.@treeView.SelectedNode = rootNode
			rescue Exception => ex
				if self.@treeView.Nodes.Count > 0 then
					self.@treeView.Nodes[self.@treeView.Nodes.Count - 1].Remove()
				end
				@logger.Error("Export DataSource", ex)
				MessageBoxHelper.Display(ex.Message)
				return 
			ensure
			end
			self.@clearCtxMenuItem.Enabled = true
			self.@statusBarReady.Text = System::String.Format("Export DataSource {0}", menuItem.Text)
		end

		def fileExitMenuItem_Click(sender, e)
			self.Close()
		end

		def toolsOptionsMenuItem_Click(sender, e)
			OptionsDialog.Display(self)
		end

		def toolsDSConfigMenuItem_Click(sender, e)
			OptionsDialog.Display(self, "DataSource Manager.DataSources")
		end

		def toolsTemplatesMenuItem_Click(sender, e)
			OptionsDialog.Display(self, "Template Manager.Templates")
		end

		def helpF1MenuItem_Click(sender, e)
			System.Diagnostics.Process.Start(ConfigManager.HelpUrl)
		end

		def helpFeedbackMenuItem_Click(sender, e)
			System.Diagnostics.Process.Start(ConfigManager.HelpUrl)
		end

		def helpAboutMenuItem_Click(sender, e)
			aboutBox = AboutBox.new()
			aboutBox.ShowDialog()
		end

		def exportPDMCtxMenuItem_Click(sender, e)
			self.fileExportPdmMenuItem_Click(sender, e)
		end

		def exportDataSourceCtxMenuItem_MouseHover(sender, e)
			self.AddDataSourceMenuItems(self.@exportDataSourceCtxMenuItem)
		end

		def clearCtxMenuItem_Click(sender, e)
			ModelManager.Clear()
			self.@treeView.Nodes.Clear()
			self.@clearCtxMenuItem.Enabled = false
			self.@statusBarDatabase.Text = System::String.Empty
			self.@statusBarReady.Text = "Ready"
		end

		def openGenSettingsCtxMenuItem_Click(sender, e)
			self.fileOpenMenuItem_Click(sender, e)
		end

		def saveGenSettingCtxMenuItem_Click(sender, e)
			self.fileSaveMenuItem_Click(sender, e)
		end

		def generateCtxMenuItem_Click(sender, e)
			self.generateBtn_Click(sender, e)
		end

		def treeView_AfterCollapse(sender, e)
			e.Node.ImageIndex = 0
			e.Node.SelectedImageIndex = 0
		end

		def treeView_AfterExpand(sender, e)
			e.Node.ImageIndex = 1
			e.Node.SelectedImageIndex = 1
		end

		def treeView_AfterCheck(sender, e)
			ExportModelHelper.CheckedTreeNode(e.Node)
		end

		def treeView_AfterSelect(sender, e)
			if e.Node.Parent == nil and e.Node != nil then
				self.@databaseNameLbl.Text = e.Node.Tag.ToString()
				self.@statusBarDatabase.Text = self.@databaseNameLbl.Text
			end
		end

		def saveSettingsBtn_Click(sender, e)
			self.fileSaveMenuItem_Click(sender, e)
		end

		def generateBtn_Click(sender, e)
			if not self.CheckParameters() then
				return 
			end
			generationObjects = GenerationHelper.GetGenerationObjects(self.@treeView)
			genObjectCount = generationObjects.Sum(x.Value.Count)
			if genObjectCount == 0 then
				MessageBoxHelper.DisplayInfo("You should checked a tables or views treenode")
				return 
			end
			fileCount = genObjectCount * self.@templateListBox.SelectedItems.Count
			self.@generateBtn.Enabled = false
			self.@completedLbl.Visible = false
			self.@totalFileCountLbl.Text = fileCount.ToString()
			self.@genProgressBar.Maximum = fileCount
			parameter = GenerationParameter.new(ModelManager.Clone(), GenerationHelper.GetGenerationObjects(self.@treeView), self.GetGenerationSettings())
			begin
				self.@codeGeneration.GenerateAsync(parameter, Guid.NewGuid().ToString())
			rescue Exception => ex
				@logger.Error("Generate", ex)
			ensure
			end
		end

		def codeGeneration_Completed(sender, args)
			self.@generateBtn.Enabled = true
			self.@completedLbl.Visible = true
			self.@statusBarReady.Text = self.@completedLbl.Text
		end

		def codeGeneration_ProgressChanged(args)
			self.@genProgressBar.Value = args.ProgressPercentage
			self.@genFileCountLbl.Text = args.GeneratedCount.ToString()
			self.@errorFileCountLbl.Text = args.ErrorCount.ToString()
			self.@currentGenFileNameLbl.Text = args.CurrentFileName
			self.@statusBarReady.Text = args.CurrentFileName
		end

		def languageCombx_SelectedIndexChanged(sender, e)
			self.@statusBarLanguage.Text = self.@languageCombx.Text
			self.ChangeTemplateListBox(self.@languageCombx.Text, self.@templateEngineCombox.Text)
		end

		def codeFileEncodingCombox_SelectedIndexChanged(sender, e)
			self.@statusBarEncoding.Text = self.@codeFileEncodingCombox.Text
		end

		def templateEngineCombox_SelectedIndexChanged(sender, e)
			self.ChangeTemplateListBox(self.@languageCombx.Text, self.@templateEngineCombox.Text)
		end

		def SetComboBoxItems()
			self.@languageCombx.Items.Clear()
			self.@templateEngineCombox.Items.Clear()
			self.@codeFileEncodingCombox.Items.Clear()
			enumerator = ConfigManager.SettingsSection.Languages.GetEnumerator()
			while enumerator.MoveNext()
				language = enumerator.Current
				self.@languageCombx.Items.Add(language.Name)
			end
			enumerator = ConfigManager.SettingsSection.TemplateEngines.GetEnumerator()
			while enumerator.MoveNext()
				templateEngine = enumerator.Current
				self.@templateEngineCombox.Items.Add(templateEngine.Name)
			end
			enumerator = Encoding.GetEncodings().GetEnumerator()
			while enumerator.MoveNext()
				encodingInfo = enumerator.Current
				self.@codeFileEncodingCombox.Items.Add(encodingInfo.Name.ToUpper())
			end
			self.@languageCombx.Text = self.@languageCombx.Items[0].ToString()
			self.@templateEngineCombox.Text = self.@templateEngineCombox.Items[0].ToString()
			self.@codeFileEncodingCombox.Text = "UTF-8"
		end

		def SetStatusItems()
			self.@statusBarDatabase.Text = self.@databaseNameLbl.Text
			self.@statusBarEncoding.Text = self.@codeFileEncodingCombox.Text
			self.@statusBarLanguage.Text = self.@languageCombx.Text
		end

		def AddDataSourceMenuItems(parent)
			parent.DropDownItems.Clear()
			enumerator = ConfigManager.DataSourceSection.DataSources.GetEnumerator()
			while enumerator.MoveNext()
				dataSource = enumerator.Current
				ds = ToolStripMenuItem.new(dataSource.Name)
				ds.Click { |sender, e| self.fileExportDataSourceMenuItem_Click(sender, e) }
				parent.DropDownItems.Add(ds)
			end
		end

		def ChangeTemplateListBox(language, engine)
			self.@templateListBox.Items.Clear()
			enumerator = ConfigManager.TemplateSection.Templates.GetEnumerator()
			while enumerator.MoveNext()
				template = enumerator.Current
				if template.Language.Equals(language, StringComparison.CurrentCultureIgnoreCase) and template.Engine.Equals(engine, StringComparison.CurrentCultureIgnoreCase) then
					self.@templateListBox.Items.Add(TemplateListBoxItem.new(template.Name, template.DisplayName))
					self.@templateListBox.DisplayMember = "DisplayName"
				end
			end
		end

		def SetGenerationSettings(xmlFileName)
			settings = SerializeHelper.XmlDeserialize(xmlFileName)
			self.@languageCombx.Text = settings.Language
			self.@templateEngineCombox.Text = settings.TemplateEngine
			self.@packageTxtBox.Text = settings.Package
			self.@tablePrefixTxtBox.Text = settings.TablePrefix
			self.@authorTxtBox.Text = settings.Author
			self.@versionTxtBox.Text = settings.Version
			self.@codeFileEncodingCombox.Text = settings.Encoding
			self.@isOmitTablePrefixChkbox.Checked = settings.IsOmitTablePrefix
			self.@isStandardizeNameChkbox.Checked = settings.IsStandardizeName
			self.@templateListBox.Items.Clear()
			enumerator = settings.TemplatesNames.GetEnumerator()
			while enumerator.MoveNext()
				templateName = enumerator.Current
				template = ConfigManager.TemplateSection.Templates[templateName]
				item = TemplateListBoxItem.new(template.Name, template.DisplayName)
				self.@templateListBox.Items.Add(item)
				self.@templateListBox.SelectedItems.Add(item)
				self.@templateListBox.DisplayMember = "DisplayName"
			end
		end

		def GetGenerationSettings()
			settings = GenerationSettings.new(self.@languageCombx.Text, self.@templateEngineCombox.Text, self.@packageTxtBox.Text, self.@tablePrefixTxtBox.Text, self.@authorTxtBox.Text, self.@versionTxtBox.Text, self.@templateListBox.SelectedItems.Cast().Select(x.Name).ToArray(), self.@codeFileEncodingCombox.Text, self.@isOmitTablePrefixChkbox.Checked, self.@isStandardizeNameChkbox.Checked)
			return settings
		end

		def CheckParameters()
			if not GenerationHelper.IsValidPackageName(self.@packageTxtBox.Text) then
				MessageBoxHelper.DisplayInfo("Package name is invalid,please input the english letters.")
				self.@packageTxtBox.Focus()
				return false
			end
			if self.@templateListBox.SelectedItems == nil or self.@templateListBox.SelectedItems.Count == 0 then
				MessageBoxHelper.DisplayInfo("You should select one template at least.")
				self.@templateListBox.Focus()
				return false
			end
			return true
		end

		class TemplateListBoxItem
			def initialize(name, displayName)
				self.@Name = name
				self.@DisplayName = displayName
			end

			def Name
			end

			def Name=(value)
			end

			def DisplayName
			end

			def DisplayName=(value)
			end
		end
	end
end