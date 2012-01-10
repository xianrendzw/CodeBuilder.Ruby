require "mscorlib"

module CodeBuilder.WinForm
	class MainForm
		def initialize()
			# <summary>
			# Required designer variable.
			# </summary>
			@components = nil
		end

		# <summary>
		# Clean up any resources being used.
		# </summary>
		# <param typeName="disposing">true if managed resources should be disposed; otherwise, false.</param>
		def Dispose(disposing)
			if disposing and (@components != nil) then
				@components.Dispose()
			end
			self.Dispose(disposing)
		end

		# <summary>
		# Required method for Designer support - do not modify
		# the contents of this method with the displayName editor.
		# </summary>
		def InitializeComponent()
			self.@components = System.ComponentModel.Container.new()
			resources = System.ComponentModel.ComponentResourceManager.new(MainForm.to_clr_type)
			self.@mainMenuStrip = System.Windows.Forms.MenuStrip.new()
			self.@fileMenu = System.Windows.Forms.ToolStripMenuItem.new()
			self.@fileExportPdmMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@fileExportDataSourceMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@fileSeparator2MenuItem = System.Windows.Forms.ToolStripSeparator.new()
			self.@fileOpenMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@fileSaveMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@fileSeparator1MenuItem = System.Windows.Forms.ToolStripSeparator.new()
			self.@fileExitMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@toolsMenu = System.Windows.Forms.ToolStripMenuItem.new()
			self.@toolsDSConfigMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@toolsTemplatesMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@toolsSeparator1MenuItem = System.Windows.Forms.ToolStripSeparator.new()
			self.@toolsOptionsMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@helpMenu = System.Windows.Forms.ToolStripMenuItem.new()
			self.@helpF1MenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@helpFeedbackMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@helpSeparator1MenuItem = System.Windows.Forms.ToolStripSeparator.new()
			self.@helpAboutMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@mainStatusStrip = System.Windows.Forms.StatusStrip.new()
			self.@statusBarReady = System.Windows.Forms.ToolStripStatusLabel.new()
			self.@statusBarDatabase = System.Windows.Forms.ToolStripStatusLabel.new()
			self.@statusBarLanguage = System.Windows.Forms.ToolStripStatusLabel.new()
			self.@statusBarEncoding = System.Windows.Forms.ToolStripStatusLabel.new()
			self.@openFileDialog = System.Windows.Forms.OpenFileDialog.new()
			self.@splitContainer = System.Windows.Forms.SplitContainer.new()
			self.@treeView = System.Windows.Forms.TreeView.new()
			self.@treeViewContextMenu = System.Windows.Forms.ContextMenuStrip.new(self.@components)
			self.@exportPDMCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@exportDataSourceCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@ctxSeparator2 = System.Windows.Forms.ToolStripSeparator.new()
			self.@clearCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@treeNodeImageList = System.Windows.Forms.ImageList.new(self.@components)
			self.@resultGbx = System.Windows.Forms.GroupBox.new()
			self.@errorFileCountLbl = System.Windows.Forms.Label.new()
			self.@errorFilesLbl = System.Windows.Forms.Label.new()
			self.@genFileCountLbl = System.Windows.Forms.Label.new()
			self.@genFilesLbl = System.Windows.Forms.Label.new()
			self.@completedLbl = System.Windows.Forms.Label.new()
			self.@totalFileCountLbl = System.Windows.Forms.Label.new()
			self.@totalFilesLbl = System.Windows.Forms.Label.new()
			self.@currentGenFileNameLbl = System.Windows.Forms.Label.new()
			self.@currentGenFileLbl = System.Windows.Forms.Label.new()
			self.@genProgressBar = System.Windows.Forms.ProgressBar.new()
			self.@genItemsGbx = System.Windows.Forms.GroupBox.new()
			self.@genSettingsCtxMenuStrip = System.Windows.Forms.ContextMenuStrip.new(self.@components)
			self.@openGenSettingsCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@saveGenSettingCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@genSettingsCtxSeparator1 = System.Windows.Forms.ToolStripSeparator.new()
			self.@generateCtxMenuItem = System.Windows.Forms.ToolStripMenuItem.new()
			self.@templateListBox = System.Windows.Forms.ListBox.new()
			self.@databaseNameLbl = System.Windows.Forms.Label.new()
			self.@databaseLbl = System.Windows.Forms.Label.new()
			self.@templateEngineCombox = System.Windows.Forms.ComboBox.new()
			self.@templateEngineLbl = System.Windows.Forms.Label.new()
			self.@isStandardizeNameChkbox = System.Windows.Forms.CheckBox.new()
			self.@isOmitTablePrefixChkbox = System.Windows.Forms.CheckBox.new()
			self.@codeFileEncodingCombox = System.Windows.Forms.ComboBox.new()
			self.@codeFileEncodingLbl = System.Windows.Forms.Label.new()
			self.@languageCombx = System.Windows.Forms.ComboBox.new()
			self.@languageLbl = System.Windows.Forms.Label.new()
			self.@templateLbl = System.Windows.Forms.Label.new()
			self.@versionTxtBox = System.Windows.Forms.TextBox.new()
			self.@versionLbl = System.Windows.Forms.Label.new()
			self.@authorTxtBox = System.Windows.Forms.TextBox.new()
			self.@authorLbl = System.Windows.Forms.Label.new()
			self.@tablePrefixTxtBox = System.Windows.Forms.TextBox.new()
			self.@tablePrefixLbl = System.Windows.Forms.Label.new()
			self.@packageTxtBox = System.Windows.Forms.TextBox.new()
			self.@packageLabel = System.Windows.Forms.Label.new()
			self.@saveSettingsBtn = System.Windows.Forms.Button.new()
			self.@generateBtn = System.Windows.Forms.Button.new()
			self.@saveFileDialog = System.Windows.Forms.SaveFileDialog.new()
			self.@codeGeneration = CodeBuilder.WinForm.UI.CodeGeneration.new(self.@components)
			self.@mainMenuStrip.SuspendLayout()
			self.@mainStatusStrip.SuspendLayout()
			((self.@splitContainer)).BeginInit()
			self.@splitContainer.Panel1.SuspendLayout()
			self.@splitContainer.Panel2.SuspendLayout()
			self.@splitContainer.SuspendLayout()
			self.@treeViewContextMenu.SuspendLayout()
			self.@resultGbx.SuspendLayout()
			self.@genItemsGbx.SuspendLayout()
			self.@genSettingsCtxMenuStrip.SuspendLayout()
			self.SuspendLayout()
			# 
			# mainMenuStrip
			# 
			self.@mainMenuStrip.Items.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@fileMenu, self.@toolsMenu, self.@helpMenu]))
			self.@mainMenuStrip.Location = System.Drawing.Point.new(0, 0)
			self.@mainMenuStrip.Name = "mainMenuStrip"
			self.@mainMenuStrip.Size = System.Drawing.Size.new(752, 24)
			self.@mainMenuStrip.TabIndex = 1
			self.@mainMenuStrip.Text = "menuStrip"
			# 
			# fileMenu
			# 
			self.@fileMenu.DropDownItems.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@fileExportPdmMenuItem, self.@fileExportDataSourceMenuItem, self.@fileSeparator2MenuItem, self.@fileOpenMenuItem, self.@fileSaveMenuItem, self.@fileSeparator1MenuItem, self.@fileExitMenuItem]))
			self.@fileMenu.Name = "fileMenu"
			self.@fileMenu.Size = System.Drawing.Size.new(35, 20)
			self.@fileMenu.Text = "&File"
			# 
			# fileExportPdmMenuItem
			# 
			self.@fileExportPdmMenuItem.Name = "fileExportPdmMenuItem"
			self.@fileExportPdmMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@fileExportPdmMenuItem.Text = "Export &PowerDesigner PDM Files..."
			self.@fileExportPdmMenuItem.Click { |sender, e| self.@fileExportPdmMenuItem_Click(sender, e) }
			# 
			# fileExportDataSourceMenuItem
			# 
			self.@fileExportDataSourceMenuItem.Name = "fileExportDataSourceMenuItem"
			self.@fileExportDataSourceMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@fileExportDataSourceMenuItem.Text = "&Export From DataSource"
			self.@fileExportDataSourceMenuItem.MouseHover { |sender, e| self.@fileExportDataSourceMenuItem_MouseHover(sender, e) }
			# 
			# fileSeparator2MenuItem
			# 
			self.@fileSeparator2MenuItem.Name = "fileSeparator2MenuItem"
			self.@fileSeparator2MenuItem.Size = System.Drawing.Size.new(238, 6)
			# 
			# fileOpenMenuItem
			# 
			self.@fileOpenMenuItem.Name = "fileOpenMenuItem"
			self.@fileOpenMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@fileOpenMenuItem.Text = "&Open Generation Settings File"
			self.@fileOpenMenuItem.Click { |sender, e| self.@fileOpenMenuItem_Click(sender, e) }
			# 
			# fileSaveMenuItem
			# 
			self.@fileSaveMenuItem.Name = "fileSaveMenuItem"
			self.@fileSaveMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@fileSaveMenuItem.Text = "&Save Generation Setting..."
			self.@fileSaveMenuItem.Click { |sender, e| self.@fileSaveMenuItem_Click(sender, e) }
			# 
			# fileSeparator1MenuItem
			# 
			self.@fileSeparator1MenuItem.Name = "fileSeparator1MenuItem"
			self.@fileSeparator1MenuItem.Size = System.Drawing.Size.new(238, 6)
			# 
			# fileExitMenuItem
			# 
			self.@fileExitMenuItem.Name = "fileExitMenuItem"
			self.@fileExitMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@fileExitMenuItem.Text = "&Exit"
			self.@fileExitMenuItem.Click { |sender, e| self.@fileExitMenuItem_Click(sender, e) }
			# 
			# toolsMenu
			# 
			self.@toolsMenu.DropDownItems.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@toolsDSConfigMenuItem, self.@toolsTemplatesMenuItem, self.@toolsSeparator1MenuItem, self.@toolsOptionsMenuItem]))
			self.@toolsMenu.Name = "toolsMenu"
			self.@toolsMenu.Size = System.Drawing.Size.new(44, 20)
			self.@toolsMenu.Text = "&Tools"
			# 
			# toolsDSConfigMenuItem
			# 
			self.@toolsDSConfigMenuItem.Name = "toolsDSConfigMenuItem"
			self.@toolsDSConfigMenuItem.Size = System.Drawing.Size.new(210, 22)
			self.@toolsDSConfigMenuItem.Text = "&DataSource Configuration..."
			self.@toolsDSConfigMenuItem.Click { |sender, e| self.@toolsDSConfigMenuItem_Click(sender, e) }
			# 
			# toolsTemplatesMenuItem
			# 
			self.@toolsTemplatesMenuItem.Name = "toolsTemplatesMenuItem"
			self.@toolsTemplatesMenuItem.Size = System.Drawing.Size.new(210, 22)
			self.@toolsTemplatesMenuItem.Text = "&Templates..."
			self.@toolsTemplatesMenuItem.Click { |sender, e| self.@toolsTemplatesMenuItem_Click(sender, e) }
			# 
			# toolsSeparator1MenuItem
			# 
			self.@toolsSeparator1MenuItem.Name = "toolsSeparator1MenuItem"
			self.@toolsSeparator1MenuItem.Size = System.Drawing.Size.new(207, 6)
			# 
			# toolsOptionsMenuItem
			# 
			self.@toolsOptionsMenuItem.Name = "toolsOptionsMenuItem"
			self.@toolsOptionsMenuItem.Size = System.Drawing.Size.new(210, 22)
			self.@toolsOptionsMenuItem.Text = "&Options..."
			self.@toolsOptionsMenuItem.Click { |sender, e| self.@toolsOptionsMenuItem_Click(sender, e) }
			# 
			# helpMenu
			# 
			self.@helpMenu.DropDownItems.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@helpF1MenuItem, self.@helpFeedbackMenuItem, self.@helpSeparator1MenuItem, self.@helpAboutMenuItem]))
			self.@helpMenu.Name = "helpMenu"
			self.@helpMenu.Size = System.Drawing.Size.new(40, 20)
			self.@helpMenu.Text = "&Help"
			self.@helpMenu.TextDirection = System.Windows.Forms.ToolStripTextDirection.Horizontal
			# 
			# helpF1MenuItem
			# 
			self.@helpF1MenuItem.Name = "helpF1MenuItem"
			self.@helpF1MenuItem.ShortcutKeys = System.Windows.Forms.Keys.F1
			self.@helpF1MenuItem.Size = System.Drawing.Size.new(186, 22)
			self.@helpF1MenuItem.Text = "CodeBuilder Help..."
			self.@helpF1MenuItem.Click { |sender, e| self.@helpF1MenuItem_Click(sender, e) }
			# 
			# helpFeedbackMenuItem
			# 
			self.@helpFeedbackMenuItem.Name = "helpFeedbackMenuItem"
			self.@helpFeedbackMenuItem.Size = System.Drawing.Size.new(186, 22)
			self.@helpFeedbackMenuItem.Text = "Customer Feedback..."
			self.@helpFeedbackMenuItem.Click { |sender, e| self.@helpFeedbackMenuItem_Click(sender, e) }
			# 
			# helpSeparator1MenuItem
			# 
			self.@helpSeparator1MenuItem.Name = "helpSeparator1MenuItem"
			self.@helpSeparator1MenuItem.Size = System.Drawing.Size.new(183, 6)
			# 
			# helpAboutMenuItem
			# 
			self.@helpAboutMenuItem.Name = "helpAboutMenuItem"
			self.@helpAboutMenuItem.Size = System.Drawing.Size.new(186, 22)
			self.@helpAboutMenuItem.Text = "About CodeBuilder..."
			self.@helpAboutMenuItem.Click { |sender, e| self.@helpAboutMenuItem_Click(sender, e) }
			# 
			# mainStatusStrip
			# 
			self.@mainStatusStrip.Items.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@statusBarReady, self.@statusBarDatabase, self.@statusBarLanguage, self.@statusBarEncoding]))
			self.@mainStatusStrip.Location = System.Drawing.Point.new(0, 441)
			self.@mainStatusStrip.Name = "mainStatusStrip"
			self.@mainStatusStrip.Size = System.Drawing.Size.new(752, 22)
			self.@mainStatusStrip.TabIndex = 1
			# 
			# statusBarReady
			# 
			self.@statusBarReady.AutoSize = false
			self.@statusBarReady.BorderSides = (((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)))
			self.@statusBarReady.Margin = System.Windows.Forms.Padding.new(0, 3, 0, 0)
			self.@statusBarReady.Name = "statusBarReady"
			self.@statusBarReady.Size = System.Drawing.Size.new(437, 19)
			self.@statusBarReady.Spring = true
			self.@statusBarReady.Text = "Ready"
			self.@statusBarReady.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
			# 
			# statusBarDatabase
			# 
			self.@statusBarDatabase.AutoSize = false
			self.@statusBarDatabase.BorderSides = (((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)))
			self.@statusBarDatabase.Margin = System.Windows.Forms.Padding.new(0, 3, 0, 0)
			self.@statusBarDatabase.Name = "statusBarDatabase"
			self.@statusBarDatabase.Size = System.Drawing.Size.new(120, 19)
			# 
			# statusBarLanguage
			# 
			self.@statusBarLanguage.AutoSize = false
			self.@statusBarLanguage.BorderSides = (((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)))
			self.@statusBarLanguage.Margin = System.Windows.Forms.Padding.new(0, 3, 0, 0)
			self.@statusBarLanguage.Name = "statusBarLanguage"
			self.@statusBarLanguage.Size = System.Drawing.Size.new(100, 19)
			# 
			# statusBarEncoding
			# 
			self.@statusBarEncoding.AutoSize = false
			self.@statusBarEncoding.BorderSides = (((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)))
			self.@statusBarEncoding.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text
			self.@statusBarEncoding.Margin = System.Windows.Forms.Padding.new(0, 3, 0, 0)
			self.@statusBarEncoding.Name = "statusBarEncoding"
			self.@statusBarEncoding.Size = System.Drawing.Size.new(80, 19)
			# 
			# splitContainer
			# 
			self.@splitContainer.Dock = System.Windows.Forms.DockStyle.Fill
			self.@splitContainer.Location = System.Drawing.Point.new(0, 24)
			self.@splitContainer.Margin = System.Windows.Forms.Padding.new(2)
			self.@splitContainer.Name = "splitContainer"
			# 
			# splitContainer.Panel1
			# 
			self.@splitContainer.Panel1.Controls.Add(self.@treeView)
			self.@splitContainer.Panel1.Padding = System.Windows.Forms.Padding.new(3)
			self.@splitContainer.Panel1MinSize = 206
			# 
			# splitContainer.Panel2
			# 
			self.@splitContainer.Panel2.Controls.Add(self.@resultGbx)
			self.@splitContainer.Panel2.Controls.Add(self.@genItemsGbx)
			self.@splitContainer.Panel2.Padding = System.Windows.Forms.Padding.new(1)
			self.@splitContainer.Size = System.Drawing.Size.new(752, 417)
			self.@splitContainer.SplitterDistance = 208
			self.@splitContainer.TabIndex = 2
			# 
			# treeView
			# 
			self.@treeView.CheckBoxes = true
			self.@treeView.ContextMenuStrip = self.@treeViewContextMenu
			self.@treeView.Dock = System.Windows.Forms.DockStyle.Fill
			self.@treeView.ImageIndex = 0
			self.@treeView.ImageList = self.@treeNodeImageList
			self.@treeView.Location = System.Drawing.Point.new(3, 3)
			self.@treeView.Name = "treeView"
			self.@treeView.SelectedImageIndex = 0
			self.@treeView.Size = System.Drawing.Size.new(202, 411)
			self.@treeView.TabIndex = 2
			self.@treeView.AfterCheck { |sender, e| self.@treeView_AfterCheck(sender, e) }
			self.@treeView.AfterCollapse { |sender, e| self.@treeView_AfterCollapse(sender, e) }
			self.@treeView.AfterExpand { |sender, e| self.@treeView_AfterExpand(sender, e) }
			self.@treeView.AfterSelect { |sender, e| self.@treeView_AfterSelect(sender, e) }
			# 
			# treeViewContextMenu
			# 
			self.@treeViewContextMenu.Items.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@exportPDMCtxMenuItem, self.@exportDataSourceCtxMenuItem, self.@ctxSeparator2, self.@clearCtxMenuItem]))
			self.@treeViewContextMenu.Name = "treeViewContextMenu"
			self.@treeViewContextMenu.Size = System.Drawing.Size.new(242, 76)
			# 
			# exportPDMCtxMenuItem
			# 
			self.@exportPDMCtxMenuItem.Name = "exportPDMCtxMenuItem"
			self.@exportPDMCtxMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@exportPDMCtxMenuItem.Text = "Export PowerDesigner PDM Files..."
			self.@exportPDMCtxMenuItem.Click { |sender, e| self.@exportPDMCtxMenuItem_Click(sender, e) }
			# 
			# exportDataSourceCtxMenuItem
			# 
			self.@exportDataSourceCtxMenuItem.Name = "exportDataSourceCtxMenuItem"
			self.@exportDataSourceCtxMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@exportDataSourceCtxMenuItem.Text = "Export From DataSource"
			self.@exportDataSourceCtxMenuItem.MouseHover { |sender, e| self.@exportDataSourceCtxMenuItem_MouseHover(sender, e) }
			# 
			# ctxSeparator2
			# 
			self.@ctxSeparator2.Name = "ctxSeparator2"
			self.@ctxSeparator2.Size = System.Drawing.Size.new(238, 6)
			# 
			# clearCtxMenuItem
			# 
			self.@clearCtxMenuItem.Enabled = false
			self.@clearCtxMenuItem.Name = "clearCtxMenuItem"
			self.@clearCtxMenuItem.Size = System.Drawing.Size.new(241, 22)
			self.@clearCtxMenuItem.Text = "Clear"
			self.@clearCtxMenuItem.Click { |sender, e| self.@clearCtxMenuItem_Click(sender, e) }
			# 
			# treeNodeImageList
			# 
			self.@treeNodeImageList.ImageStream = ((resources.GetObject("treeNodeImageList.ImageStream")))
			self.@treeNodeImageList.TransparentColor = System.Drawing.Color.Transparent
			self.@treeNodeImageList.Images.SetKeyName(0, "folderClosed.gif")
			self.@treeNodeImageList.Images.SetKeyName(1, "folderOpen.gif")
			self.@treeNodeImageList.Images.SetKeyName(2, "leaf.gif")
			# 
			# resultGbx
			# 
			self.@resultGbx.Anchor = (((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@resultGbx.Controls.Add(self.@errorFileCountLbl)
			self.@resultGbx.Controls.Add(self.@errorFilesLbl)
			self.@resultGbx.Controls.Add(self.@genFileCountLbl)
			self.@resultGbx.Controls.Add(self.@genFilesLbl)
			self.@resultGbx.Controls.Add(self.@completedLbl)
			self.@resultGbx.Controls.Add(self.@totalFileCountLbl)
			self.@resultGbx.Controls.Add(self.@totalFilesLbl)
			self.@resultGbx.Controls.Add(self.@currentGenFileNameLbl)
			self.@resultGbx.Controls.Add(self.@currentGenFileLbl)
			self.@resultGbx.Controls.Add(self.@genProgressBar)
			self.@resultGbx.Location = System.Drawing.Point.new(1, 275)
			self.@resultGbx.Name = "resultGbx"
			self.@resultGbx.Size = System.Drawing.Size.new(538, 139)
			self.@resultGbx.TabIndex = 0
			self.@resultGbx.TabStop = false
			self.@resultGbx.Text = "Results"
			# 
			# errorFileCountLbl
			# 
			self.@errorFileCountLbl.Location = System.Drawing.Point.new(399, 60)
			self.@errorFileCountLbl.Name = "errorFileCountLbl"
			self.@errorFileCountLbl.Size = System.Drawing.Size.new(50, 13)
			self.@errorFileCountLbl.TabIndex = 9
			# 
			# errorFilesLbl
			# 
			self.@errorFilesLbl.Location = System.Drawing.Point.new(329, 60)
			self.@errorFilesLbl.Name = "errorFilesLbl"
			self.@errorFilesLbl.Size = System.Drawing.Size.new(60, 13)
			self.@errorFilesLbl.TabIndex = 8
			self.@errorFilesLbl.Text = "Error files:"
			# 
			# genFileCountLbl
			# 
			self.@genFileCountLbl.Location = System.Drawing.Point.new(260, 60)
			self.@genFileCountLbl.Name = "genFileCountLbl"
			self.@genFileCountLbl.Size = System.Drawing.Size.new(50, 13)
			self.@genFileCountLbl.TabIndex = 7
			# 
			# genFilesLbl
			# 
			self.@genFilesLbl.Location = System.Drawing.Point.new(161, 60)
			self.@genFilesLbl.Name = "genFilesLbl"
			self.@genFilesLbl.Size = System.Drawing.Size.new(90, 13)
			self.@genFilesLbl.TabIndex = 6
			self.@genFilesLbl.Text = "Generated files:"
			# 
			# completedLbl
			# 
			self.@completedLbl.Anchor = (((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)))
			self.@completedLbl.Location = System.Drawing.Point.new(469, 60)
			self.@completedLbl.Name = "completedLbl"
			self.@completedLbl.Size = System.Drawing.Size.new(60, 13)
			self.@completedLbl.TabIndex = 5
			self.@completedLbl.Text = "Completed!"
			self.@completedLbl.Visible = false
			# 
			# totalFileCountLbl
			# 
			self.@totalFileCountLbl.Location = System.Drawing.Point.new(98, 60)
			self.@totalFileCountLbl.Name = "totalFileCountLbl"
			self.@totalFileCountLbl.Size = System.Drawing.Size.new(50, 13)
			self.@totalFileCountLbl.TabIndex = 4
			# 
			# totalFilesLbl
			# 
			self.@totalFilesLbl.Location = System.Drawing.Point.new(10, 60)
			self.@totalFilesLbl.Name = "totalFilesLbl"
			self.@totalFilesLbl.Size = System.Drawing.Size.new(80, 13)
			self.@totalFilesLbl.TabIndex = 3
			self.@totalFilesLbl.Text = "Total files:"
			# 
			# currentGenFileNameLbl
			# 
			self.@currentGenFileNameLbl.Location = System.Drawing.Point.new(129, 85)
			self.@currentGenFileNameLbl.Name = "currentGenFileNameLbl"
			self.@currentGenFileNameLbl.Size = System.Drawing.Size.new(398, 37)
			self.@currentGenFileNameLbl.TabIndex = 2
			# 
			# currentGenFileLbl
			# 
			self.@currentGenFileLbl.Location = System.Drawing.Point.new(10, 85)
			self.@currentGenFileLbl.Name = "currentGenFileLbl"
			self.@currentGenFileLbl.Size = System.Drawing.Size.new(113, 13)
			self.@currentGenFileLbl.TabIndex = 1
			self.@currentGenFileLbl.Text = "Current generating file:"
			# 
			# genProgressBar
			# 
			self.@genProgressBar.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@genProgressBar.Location = System.Drawing.Point.new(10, 26)
			self.@genProgressBar.Name = "genProgressBar"
			self.@genProgressBar.Size = System.Drawing.Size.new(519, 23)
			self.@genProgressBar.TabIndex = 0
			# 
			# genItemsGbx
			# 
			self.@genItemsGbx.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@genItemsGbx.ContextMenuStrip = self.@genSettingsCtxMenuStrip
			self.@genItemsGbx.Controls.Add(self.@templateListBox)
			self.@genItemsGbx.Controls.Add(self.@databaseNameLbl)
			self.@genItemsGbx.Controls.Add(self.@databaseLbl)
			self.@genItemsGbx.Controls.Add(self.@templateEngineCombox)
			self.@genItemsGbx.Controls.Add(self.@templateEngineLbl)
			self.@genItemsGbx.Controls.Add(self.@isStandardizeNameChkbox)
			self.@genItemsGbx.Controls.Add(self.@isOmitTablePrefixChkbox)
			self.@genItemsGbx.Controls.Add(self.@codeFileEncodingCombox)
			self.@genItemsGbx.Controls.Add(self.@codeFileEncodingLbl)
			self.@genItemsGbx.Controls.Add(self.@languageCombx)
			self.@genItemsGbx.Controls.Add(self.@languageLbl)
			self.@genItemsGbx.Controls.Add(self.@templateLbl)
			self.@genItemsGbx.Controls.Add(self.@versionTxtBox)
			self.@genItemsGbx.Controls.Add(self.@versionLbl)
			self.@genItemsGbx.Controls.Add(self.@authorTxtBox)
			self.@genItemsGbx.Controls.Add(self.@authorLbl)
			self.@genItemsGbx.Controls.Add(self.@tablePrefixTxtBox)
			self.@genItemsGbx.Controls.Add(self.@tablePrefixLbl)
			self.@genItemsGbx.Controls.Add(self.@packageTxtBox)
			self.@genItemsGbx.Controls.Add(self.@packageLabel)
			self.@genItemsGbx.Controls.Add(self.@saveSettingsBtn)
			self.@genItemsGbx.Controls.Add(self.@generateBtn)
			self.@genItemsGbx.Location = System.Drawing.Point.new(1, 3)
			self.@genItemsGbx.Name = "genItemsGbx"
			self.@genItemsGbx.Size = System.Drawing.Size.new(538, 268)
			self.@genItemsGbx.TabIndex = 3
			self.@genItemsGbx.TabStop = false
			self.@genItemsGbx.Text = "Generation Settings"
			# 
			# genSettingsCtxMenuStrip
			# 
			self.@genSettingsCtxMenuStrip.Items.AddRange(Array[System::Windows::Forms::ToolStripItem].new([self.@openGenSettingsCtxMenuItem, self.@saveGenSettingCtxMenuItem, self.@genSettingsCtxSeparator1, self.@generateCtxMenuItem]))
			self.@genSettingsCtxMenuStrip.Name = "genSettingsCtxMenuStrip"
			self.@genSettingsCtxMenuStrip.Size = System.Drawing.Size.new(230, 76)
			# 
			# openGenSettingsCtxMenuItem
			# 
			self.@openGenSettingsCtxMenuItem.Name = "openGenSettingsCtxMenuItem"
			self.@openGenSettingsCtxMenuItem.Size = System.Drawing.Size.new(229, 22)
			self.@openGenSettingsCtxMenuItem.Text = "Open Generation Settings File..."
			self.@openGenSettingsCtxMenuItem.Click { |sender, e| self.@openGenSettingsCtxMenuItem_Click(sender, e) }
			# 
			# saveGenSettingCtxMenuItem
			# 
			self.@saveGenSettingCtxMenuItem.Name = "saveGenSettingCtxMenuItem"
			self.@saveGenSettingCtxMenuItem.Size = System.Drawing.Size.new(229, 22)
			self.@saveGenSettingCtxMenuItem.Text = "Save Generation Setting..."
			self.@saveGenSettingCtxMenuItem.Click { |sender, e| self.@saveGenSettingCtxMenuItem_Click(sender, e) }
			# 
			# genSettingsCtxSeparator1
			# 
			self.@genSettingsCtxSeparator1.Name = "genSettingsCtxSeparator1"
			self.@genSettingsCtxSeparator1.Size = System.Drawing.Size.new(226, 6)
			# 
			# generateCtxMenuItem
			# 
			self.@generateCtxMenuItem.Name = "generateCtxMenuItem"
			self.@generateCtxMenuItem.Size = System.Drawing.Size.new(229, 22)
			self.@generateCtxMenuItem.Text = "Generate"
			self.@generateCtxMenuItem.Click { |sender, e| self.@generateCtxMenuItem_Click(sender, e) }
			# 
			# templateListBox
			# 
			self.@templateListBox.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@templateListBox.FormattingEnabled = true
			self.@templateListBox.Location = System.Drawing.Point.new(357, 122)
			self.@templateListBox.Name = "templateListBox"
			self.@templateListBox.SelectionMode = System.Windows.Forms.SelectionMode.MultiSimple
			self.@templateListBox.Size = System.Drawing.Size.new(150, 95)
			self.@templateListBox.TabIndex = 19
			# 
			# databaseNameLbl
			# 
			self.@databaseNameLbl.Location = System.Drawing.Point.new(86, 26)
			self.@databaseNameLbl.Name = "databaseNameLbl"
			self.@databaseNameLbl.Size = System.Drawing.Size.new(150, 13)
			self.@databaseNameLbl.TabIndex = 5
			# 
			# databaseLbl
			# 
			self.@databaseLbl.Location = System.Drawing.Point.new(10, 26)
			self.@databaseLbl.Name = "databaseLbl"
			self.@databaseLbl.Size = System.Drawing.Size.new(70, 13)
			self.@databaseLbl.TabIndex = 4
			self.@databaseLbl.Text = "Database:"
			# 
			# templateEngineCombox
			# 
			self.@templateEngineCombox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
			self.@templateEngineCombox.FormattingEnabled = true
			self.@templateEngineCombox.Location = System.Drawing.Point.new(120, 122)
			self.@templateEngineCombox.Name = "templateEngineCombox"
			self.@templateEngineCombox.Size = System.Drawing.Size.new(116, 21)
			self.@templateEngineCombox.TabIndex = 17
			self.@templateEngineCombox.SelectedIndexChanged { |sender, e| self.@templateEngineCombox_SelectedIndexChanged(sender, e) }
			# 
			# templateEngineLbl
			# 
			self.@templateEngineLbl.Location = System.Drawing.Point.new(10, 131)
			self.@templateEngineLbl.Name = "templateEngineLbl"
			self.@templateEngineLbl.Size = System.Drawing.Size.new(100, 13)
			self.@templateEngineLbl.TabIndex = 16
			self.@templateEngineLbl.Text = "Template Engine:"
			# 
			# isStandardizeNameChkbox
			# 
			self.@isStandardizeNameChkbox.Location = System.Drawing.Point.new(10, 234)
			self.@isStandardizeNameChkbox.Name = "isStandardizeNameChkbox"
			self.@isStandardizeNameChkbox.Size = System.Drawing.Size.new(210, 17)
			self.@isStandardizeNameChkbox.TabIndex = 23
			self.@isStandardizeNameChkbox.Text = "Is Standardize Table And Field Name"
			self.@isStandardizeNameChkbox.UseVisualStyleBackColor = true
			# 
			# isOmitTablePrefixChkbox
			# 
			self.@isOmitTablePrefixChkbox.Location = System.Drawing.Point.new(10, 200)
			self.@isOmitTablePrefixChkbox.Name = "isOmitTablePrefixChkbox"
			self.@isOmitTablePrefixChkbox.Size = System.Drawing.Size.new(130, 17)
			self.@isOmitTablePrefixChkbox.TabIndex = 22
			self.@isOmitTablePrefixChkbox.Text = "Is Omit Table Prefix"
			self.@isOmitTablePrefixChkbox.UseVisualStyleBackColor = true
			# 
			# codeFileEncodingCombox
			# 
			self.@codeFileEncodingCombox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
			self.@codeFileEncodingCombox.FormattingEnabled = true
			self.@codeFileEncodingCombox.Location = System.Drawing.Point.new(120, 158)
			self.@codeFileEncodingCombox.Name = "codeFileEncodingCombox"
			self.@codeFileEncodingCombox.Size = System.Drawing.Size.new(116, 21)
			self.@codeFileEncodingCombox.TabIndex = 21
			self.@codeFileEncodingCombox.SelectedIndexChanged { |sender, e| self.@codeFileEncodingCombox_SelectedIndexChanged(sender, e) }
			# 
			# codeFileEncodingLbl
			# 
			self.@codeFileEncodingLbl.Location = System.Drawing.Point.new(10, 166)
			self.@codeFileEncodingLbl.Name = "codeFileEncodingLbl"
			self.@codeFileEncodingLbl.Size = System.Drawing.Size.new(110, 13)
			self.@codeFileEncodingLbl.TabIndex = 20
			self.@codeFileEncodingLbl.Text = "Encoding:"
			# 
			# languageCombx
			# 
			self.@languageCombx.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@languageCombx.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
			self.@languageCombx.FormattingEnabled = true
			self.@languageCombx.Location = System.Drawing.Point.new(357, 19)
			self.@languageCombx.Name = "languageCombx"
			self.@languageCombx.Size = System.Drawing.Size.new(150, 21)
			self.@languageCombx.TabIndex = 7
			self.@languageCombx.SelectedIndexChanged { |sender, e| self.@languageCombx_SelectedIndexChanged(sender, e) }
			# 
			# languageLbl
			# 
			self.@languageLbl.Location = System.Drawing.Point.new(270, 26)
			self.@languageLbl.Name = "languageLbl"
			self.@languageLbl.Size = System.Drawing.Size.new(70, 13)
			self.@languageLbl.TabIndex = 6
			self.@languageLbl.Text = "Language:"
			# 
			# templateLbl
			# 
			self.@templateLbl.Location = System.Drawing.Point.new(270, 131)
			self.@templateLbl.Name = "templateLbl"
			self.@templateLbl.Size = System.Drawing.Size.new(70, 13)
			self.@templateLbl.TabIndex = 18
			self.@templateLbl.Text = "Template:"
			# 
			# versionTxtBox
			# 
			self.@versionTxtBox.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@versionTxtBox.ImeMode = System.Windows.Forms.ImeMode.On
			self.@versionTxtBox.Location = System.Drawing.Point.new(357, 89)
			self.@versionTxtBox.MaxLength = 100
			self.@versionTxtBox.Name = "versionTxtBox"
			self.@versionTxtBox.Size = System.Drawing.Size.new(150, 20)
			self.@versionTxtBox.TabIndex = 15
			# 
			# versionLbl
			# 
			self.@versionLbl.Location = System.Drawing.Point.new(270, 96)
			self.@versionLbl.Name = "versionLbl"
			self.@versionLbl.Size = System.Drawing.Size.new(70, 13)
			self.@versionLbl.TabIndex = 14
			self.@versionLbl.Text = "Version:"
			# 
			# authorTxtBox
			# 
			self.@authorTxtBox.ImeMode = System.Windows.Forms.ImeMode.On
			self.@authorTxtBox.Location = System.Drawing.Point.new(86, 89)
			self.@authorTxtBox.MaxLength = 100
			self.@authorTxtBox.Name = "authorTxtBox"
			self.@authorTxtBox.Size = System.Drawing.Size.new(150, 20)
			self.@authorTxtBox.TabIndex = 13
			# 
			# authorLbl
			# 
			self.@authorLbl.Location = System.Drawing.Point.new(10, 96)
			self.@authorLbl.Name = "authorLbl"
			self.@authorLbl.Size = System.Drawing.Size.new(70, 13)
			self.@authorLbl.TabIndex = 12
			self.@authorLbl.Text = "Author:"
			# 
			# tablePrefixTxtBox
			# 
			self.@tablePrefixTxtBox.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@tablePrefixTxtBox.ImeMode = System.Windows.Forms.ImeMode.On
			self.@tablePrefixTxtBox.Location = System.Drawing.Point.new(357, 55)
			self.@tablePrefixTxtBox.MaxLength = 50
			self.@tablePrefixTxtBox.Name = "tablePrefixTxtBox"
			self.@tablePrefixTxtBox.Size = System.Drawing.Size.new(150, 20)
			self.@tablePrefixTxtBox.TabIndex = 11
			# 
			# tablePrefixLbl
			# 
			self.@tablePrefixLbl.Location = System.Drawing.Point.new(270, 62)
			self.@tablePrefixLbl.Name = "tablePrefixLbl"
			self.@tablePrefixLbl.Size = System.Drawing.Size.new(70, 13)
			self.@tablePrefixLbl.TabIndex = 10
			self.@tablePrefixLbl.Text = "Table Prefix:"
			# 
			# packageTxtBox
			# 
			self.@packageTxtBox.Font = System.Drawing.Font.new("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((134)))
			self.@packageTxtBox.ImeMode = System.Windows.Forms.ImeMode.On
			self.@packageTxtBox.Location = System.Drawing.Point.new(86, 54)
			self.@packageTxtBox.MaxLength = 200
			self.@packageTxtBox.Name = "packageTxtBox"
			self.@packageTxtBox.Size = System.Drawing.Size.new(150, 20)
			self.@packageTxtBox.TabIndex = 9
			# 
			# packageLabel
			# 
			self.@packageLabel.Location = System.Drawing.Point.new(10, 61)
			self.@packageLabel.Name = "packageLabel"
			self.@packageLabel.Size = System.Drawing.Size.new(70, 13)
			self.@packageLabel.TabIndex = 8
			self.@packageLabel.Text = "Package:"
			# 
			# saveSettingsBtn
			# 
			self.@saveSettingsBtn.Anchor = (((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
			self.@saveSettingsBtn.Location = System.Drawing.Point.new(353, 234)
			self.@saveSettingsBtn.Name = "saveSettingsBtn"
			self.@saveSettingsBtn.Size = System.Drawing.Size.new(94, 23)
			self.@saveSettingsBtn.TabIndex = 24
			self.@saveSettingsBtn.Text = "Save Settings"
			self.@saveSettingsBtn.UseVisualStyleBackColor = true
			self.@saveSettingsBtn.Click { |sender, e| self.@saveSettingsBtn_Click(sender, e) }
			# 
			# generateBtn
			# 
			self.@generateBtn.Anchor = (((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
			self.@generateBtn.Location = System.Drawing.Point.new(454, 234)
			self.@generateBtn.Name = "generateBtn"
			self.@generateBtn.Size = System.Drawing.Size.new(75, 23)
			self.@generateBtn.TabIndex = 25
			self.@generateBtn.Text = "Generate"
			self.@generateBtn.UseVisualStyleBackColor = true
			self.@generateBtn.Click { |sender, e| self.@generateBtn_Click(sender, e) }
			# 
			# codeGeneration
			# 
			self.@codeGeneration.ProgressChanged { |args| self.@codeGeneration_ProgressChanged(args) }
			self.@codeGeneration.Completed { |sender, args| self.@codeGeneration_Completed(sender, args) }
			# 
			# MainForm
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@ClientSize = System.Drawing.Size.new(752, 463)
			self.@Controls.Add(self.@splitContainer)
			self.@Controls.Add(self.@mainStatusStrip)
			self.@Controls.Add(self.@mainMenuStrip)
			self.@Icon = ((resources.GetObject("$this.Icon")))
			self.@MainMenuStrip = self.@mainMenuStrip
			self.@MinimumSize = System.Drawing.Size.new(760, 490)
			self.@Name = "MainForm"
			self.@StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
			self.@Text = "CodeBuilder"
			self.@mainMenuStrip.ResumeLayout(false)
			self.@mainMenuStrip.PerformLayout()
			self.@mainStatusStrip.ResumeLayout(false)
			self.@mainStatusStrip.PerformLayout()
			self.@splitContainer.Panel1.ResumeLayout(false)
			self.@splitContainer.Panel2.ResumeLayout(false)
			((self.@splitContainer)).EndInit()
			self.@splitContainer.ResumeLayout(false)
			self.@treeViewContextMenu.ResumeLayout(false)
			self.@resultGbx.ResumeLayout(false)
			self.@genItemsGbx.ResumeLayout(false)
			self.@genItemsGbx.PerformLayout()
			self.@genSettingsCtxMenuStrip.ResumeLayout(false)
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end