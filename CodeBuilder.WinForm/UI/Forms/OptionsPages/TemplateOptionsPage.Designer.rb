module CodeBuilder.WinForm.UI.OptionsPages
	class TemplateOptionsPage
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
			self.@templatesLbl = System.Windows.Forms.Label.new()
			self.@topGbx = System.Windows.Forms.GroupBox.new()
			self.@templateListbox = System.Windows.Forms.ListBox.new()
			self.@engineCombox = System.Windows.Forms.ComboBox.new()
			self.@languageCombox = System.Windows.Forms.ComboBox.new()
			self.@removeBtn = System.Windows.Forms.Button.new()
			self.@newsaveBtn = System.Windows.Forms.Button.new()
			self.@fileNameTextbox = System.Windows.Forms.TextBox.new()
			self.@displayNameTxtbox = System.Windows.Forms.TextBox.new()
			self.@languageLbl = System.Windows.Forms.Label.new()
			self.@engineLbl = System.Windows.Forms.Label.new()
			self.@nameLbl = System.Windows.Forms.Label.new()
			self.@fileNameLbl = System.Windows.Forms.Label.new()
			self.@editBtn = System.Windows.Forms.Button.new()
			self.@openFileDialogBtn = System.Windows.Forms.Button.new()
			self.@noteTextLbl = System.Windows.Forms.Label.new()
			self.@noteLbl = System.Windows.Forms.Label.new()
			self.@openFileDialog = System.Windows.Forms.OpenFileDialog.new()
			self.@getItFromOnlineBtn = System.Windows.Forms.Button.new()
			self.@prefixTxtBox = System.Windows.Forms.TextBox.new()
			self.@prefixLbl = System.Windows.Forms.Label.new()
			self.@suffixLbl = System.Windows.Forms.Label.new()
			self.@suffixTxtBox = System.Windows.Forms.TextBox.new()
			self.SuspendLayout()
			# 
			# templatesLbl
			# 
			self.@templatesLbl.Location = System.Drawing.Point.new(9, 5)
			self.@templatesLbl.Name = "templatesLbl"
			self.@templatesLbl.Size = System.Drawing.Size.new(60, 16)
			self.@templatesLbl.TabIndex = 31
			self.@templatesLbl.Text = "Templates"
			# 
			# topGbx
			# 
			self.@topGbx.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@topGbx.Location = System.Drawing.Point.new(80, 5)
			self.@topGbx.Name = "topGbx"
			self.@topGbx.Size = System.Drawing.Size.new(370, 8)
			self.@topGbx.TabIndex = 30
			self.@topGbx.TabStop = false
			# 
			# templateListbox
			# 
			self.@templateListbox.FormattingEnabled = true
			self.@templateListbox.Location = System.Drawing.Point.new(10, 30)
			self.@templateListbox.Name = "templateListbox"
			self.@templateListbox.Size = System.Drawing.Size.new(160, 303)
			self.@templateListbox.TabIndex = 1
			self.@templateListbox.SelectedIndexChanged { |sender, e| self.@templateListbox_SelectedIndexChanged(sender, e) }
			# 
			# engineCombox
			# 
			self.@engineCombox.FormattingEnabled = true
			self.@engineCombox.Location = System.Drawing.Point.new(262, 60)
			self.@engineCombox.Name = "engineCombox"
			self.@engineCombox.Size = System.Drawing.Size.new(121, 21)
			self.@engineCombox.TabIndex = 5
			# 
			# languageCombox
			# 
			self.@languageCombox.FormattingEnabled = true
			self.@languageCombox.Location = System.Drawing.Point.new(262, 30)
			self.@languageCombox.Name = "languageCombox"
			self.@languageCombox.Size = System.Drawing.Size.new(121, 21)
			self.@languageCombox.TabIndex = 3
			# 
			# removeBtn
			# 
			self.@removeBtn.Location = System.Drawing.Point.new(291, 210)
			self.@removeBtn.Name = "removeBtn"
			self.@removeBtn.Size = System.Drawing.Size.new(64, 23)
			self.@removeBtn.TabIndex = 16
			self.@removeBtn.Text = "Remove"
			self.@removeBtn.UseVisualStyleBackColor = true
			self.@removeBtn.Click { |sender, e| self.@removeBtn_Click(sender, e) }
			# 
			# newsaveBtn
			# 
			self.@newsaveBtn.Location = System.Drawing.Point.new(361, 210)
			self.@newsaveBtn.Name = "newsaveBtn"
			self.@newsaveBtn.Size = System.Drawing.Size.new(93, 23)
			self.@newsaveBtn.TabIndex = 17
			self.@newsaveBtn.Text = "New/Save"
			self.@newsaveBtn.UseVisualStyleBackColor = true
			self.@newsaveBtn.Click { |sender, e| self.@newsaveBtn_Click(sender, e) }
			# 
			# fileNameTextbox
			# 
			self.@fileNameTextbox.Location = System.Drawing.Point.new(262, 120)
			self.@fileNameTextbox.Name = "fileNameTextbox"
			self.@fileNameTextbox.Size = System.Drawing.Size.new(164, 20)
			self.@fileNameTextbox.TabIndex = 9
			# 
			# displayNameTxtbox
			# 
			self.@displayNameTxtbox.Location = System.Drawing.Point.new(262, 90)
			self.@displayNameTxtbox.MaxLength = 200
			self.@displayNameTxtbox.Name = "displayNameTxtbox"
			self.@displayNameTxtbox.Size = System.Drawing.Size.new(121, 20)
			self.@displayNameTxtbox.TabIndex = 7
			# 
			# languageLbl
			# 
			self.@languageLbl.Location = System.Drawing.Point.new(178, 30)
			self.@languageLbl.Name = "languageLbl"
			self.@languageLbl.Size = System.Drawing.Size.new(80, 13)
			self.@languageLbl.TabIndex = 2
			self.@languageLbl.Text = "Language:"
			# 
			# engineLbl
			# 
			self.@engineLbl.Location = System.Drawing.Point.new(178, 60)
			self.@engineLbl.Name = "engineLbl"
			self.@engineLbl.Size = System.Drawing.Size.new(80, 13)
			self.@engineLbl.TabIndex = 4
			self.@engineLbl.Text = "Engine:"
			# 
			# nameLbl
			# 
			self.@nameLbl.Location = System.Drawing.Point.new(178, 90)
			self.@nameLbl.Name = "nameLbl"
			self.@nameLbl.Size = System.Drawing.Size.new(80, 13)
			self.@nameLbl.TabIndex = 6
			self.@nameLbl.Text = "DisplayName:"
			# 
			# fileNameLbl
			# 
			self.@fileNameLbl.Location = System.Drawing.Point.new(178, 120)
			self.@fileNameLbl.Name = "fileNameLbl"
			self.@fileNameLbl.Size = System.Drawing.Size.new(80, 13)
			self.@fileNameLbl.TabIndex = 8
			self.@fileNameLbl.Text = "File:"
			# 
			# editBtn
			# 
			self.@editBtn.Location = System.Drawing.Point.new(228, 210)
			self.@editBtn.Name = "editBtn"
			self.@editBtn.Size = System.Drawing.Size.new(57, 23)
			self.@editBtn.TabIndex = 15
			self.@editBtn.Text = "Edit"
			self.@editBtn.UseVisualStyleBackColor = true
			self.@editBtn.Click { |sender, e| self.@editBtn_Click(sender, e) }
			# 
			# openFileDialogBtn
			# 
			self.@openFileDialogBtn.Location = System.Drawing.Point.new(430, 118)
			self.@openFileDialogBtn.Name = "openFileDialogBtn"
			self.@openFileDialogBtn.Size = System.Drawing.Size.new(24, 23)
			self.@openFileDialogBtn.TabIndex = 10
			self.@openFileDialogBtn.Text = "..."
			self.@openFileDialogBtn.UseVisualStyleBackColor = true
			self.@openFileDialogBtn.Click { |sender, e| self.@openFileDialogBtn_Click(sender, e) }
			# 
			# noteTextLbl
			# 
			self.@noteTextLbl.Location = System.Drawing.Point.new(246, 276)
			self.@noteTextLbl.Name = "noteTextLbl"
			self.@noteTextLbl.Size = System.Drawing.Size.new(210, 60)
			self.@noteTextLbl.TabIndex = 20
			# 
			# noteLbl
			# 
			self.@noteLbl.Font = System.Drawing.Font.new("Microsoft Sans Serif", 7.8f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@noteLbl.Location = System.Drawing.Point.new(190, 275)
			self.@noteLbl.Name = "noteLbl"
			self.@noteLbl.Size = System.Drawing.Size.new(50, 18)
			self.@noteLbl.TabIndex = 19
			self.@noteLbl.Text = "Note:"
			# 
			# openFileDialog
			# 
			self.@openFileDialog.Filter = "Template Text File (*.txt)|*.txt"
			self.@openFileDialog.Title = "Select Template Text File"
			# 
			# getItFromOnlineBtn
			# 
			self.@getItFromOnlineBtn.Location = System.Drawing.Point.new(228, 244)
			self.@getItFromOnlineBtn.Name = "getItFromOnlineBtn"
			self.@getItFromOnlineBtn.Size = System.Drawing.Size.new(226, 23)
			self.@getItFromOnlineBtn.TabIndex = 18
			self.@getItFromOnlineBtn.Text = "Get it from online"
			self.@getItFromOnlineBtn.UseVisualStyleBackColor = true
			self.@getItFromOnlineBtn.Click { |sender, e| self.@getItFromOnlineBtn_Click(sender, e) }
			# 
			# prefixTxtBox
			# 
			self.@prefixTxtBox.Location = System.Drawing.Point.new(262, 150)
			self.@prefixTxtBox.MaxLength = 200
			self.@prefixTxtBox.Name = "prefixTxtBox"
			self.@prefixTxtBox.Size = System.Drawing.Size.new(121, 20)
			self.@prefixTxtBox.TabIndex = 12
			# 
			# prefixLbl
			# 
			self.@prefixLbl.Location = System.Drawing.Point.new(178, 150)
			self.@prefixLbl.Name = "prefixLbl"
			self.@prefixLbl.Size = System.Drawing.Size.new(80, 13)
			self.@prefixLbl.TabIndex = 11
			self.@prefixLbl.Text = "Prefix:"
			# 
			# suffixLbl
			# 
			self.@suffixLbl.Location = System.Drawing.Point.new(178, 180)
			self.@suffixLbl.Name = "suffixLbl"
			self.@suffixLbl.Size = System.Drawing.Size.new(80, 13)
			self.@suffixLbl.TabIndex = 13
			self.@suffixLbl.Text = "Suffix:"
			# 
			# suffixTxtBox
			# 
			self.@suffixTxtBox.Location = System.Drawing.Point.new(262, 180)
			self.@suffixTxtBox.MaxLength = 200
			self.@suffixTxtBox.Name = "suffixTxtBox"
			self.@suffixTxtBox.Size = System.Drawing.Size.new(121, 20)
			self.@suffixTxtBox.TabIndex = 14
			# 
			# TemplateOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Controls.Add(self.@suffixLbl)
			self.@Controls.Add(self.@suffixTxtBox)
			self.@Controls.Add(self.@prefixLbl)
			self.@Controls.Add(self.@prefixTxtBox)
			self.@Controls.Add(self.@getItFromOnlineBtn)
			self.@Controls.Add(self.@noteTextLbl)
			self.@Controls.Add(self.@noteLbl)
			self.@Controls.Add(self.@openFileDialogBtn)
			self.@Controls.Add(self.@editBtn)
			self.@Controls.Add(self.@fileNameLbl)
			self.@Controls.Add(self.@nameLbl)
			self.@Controls.Add(self.@engineLbl)
			self.@Controls.Add(self.@languageLbl)
			self.@Controls.Add(self.@displayNameTxtbox)
			self.@Controls.Add(self.@fileNameTextbox)
			self.@Controls.Add(self.@newsaveBtn)
			self.@Controls.Add(self.@removeBtn)
			self.@Controls.Add(self.@languageCombox)
			self.@Controls.Add(self.@engineCombox)
			self.@Controls.Add(self.@templateListbox)
			self.@Controls.Add(self.@templatesLbl)
			self.@Controls.Add(self.@topGbx)
			self.@Name = "TemplateOptionsPage"
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end