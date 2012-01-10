module CodeBuilder.WinForm.UI.OptionsPages
	class RecentFilesOptionsPage
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
			self.@checkFilesExistCheckBox = System.Windows.Forms.CheckBox.new()
			self.@filesInMenuLbl = System.Windows.Forms.Label.new()
			self.@recentFilesCountTextBox = System.Windows.Forms.TextBox.new()
			self.@listLbl = System.Windows.Forms.Label.new()
			self.@topGbox = System.Windows.Forms.GroupBox.new()
			self.@recentFilesLbl = System.Windows.Forms.Label.new()
			self.SuspendLayout()
			# 
			# checkFilesExistCheckBox
			# 
			self.@checkFilesExistCheckBox.AutoSize = true
			self.@checkFilesExistCheckBox.Location = System.Drawing.Point.new(27, 72)
			self.@checkFilesExistCheckBox.Name = "checkFilesExistCheckBox"
			self.@checkFilesExistCheckBox.Size = System.Drawing.Size.new(185, 17)
			self.@checkFilesExistCheckBox.TabIndex = 4
			self.@checkFilesExistCheckBox.Text = "Check that files exist before listing"
			self.@checkFilesExistCheckBox.UseVisualStyleBackColor = true
			# 
			# filesInMenuLbl
			# 
			self.@filesInMenuLbl.Location = System.Drawing.Point.new(147, 33)
			self.@filesInMenuLbl.Name = "filesInMenuLbl"
			self.@filesInMenuLbl.Size = System.Drawing.Size.new(96, 24)
			self.@filesInMenuLbl.TabIndex = 3
			self.@filesInMenuLbl.Text = "files in menu"
			# 
			# recentFilesCountTextBox
			# 
			self.@recentFilesCountTextBox.Location = System.Drawing.Point.new(91, 33)
			self.@recentFilesCountTextBox.MaxLength = 50
			self.@recentFilesCountTextBox.Name = "recentFilesCountTextBox"
			self.@recentFilesCountTextBox.Size = System.Drawing.Size.new(40, 20)
			self.@recentFilesCountTextBox.TabIndex = 2
			self.@recentFilesCountTextBox.Text = "3"
			# 
			# listLbl
			# 
			self.@listLbl.Location = System.Drawing.Point.new(27, 33)
			self.@listLbl.Name = "listLbl"
			self.@listLbl.Size = System.Drawing.Size.new(55, 16)
			self.@listLbl.TabIndex = 1
			self.@listLbl.Text = "List"
			# 
			# topGbox
			# 
			self.@topGbox.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@topGbox.Location = System.Drawing.Point.new(80, 5)
			self.@topGbox.Name = "topGbox"
			self.@topGbox.Size = System.Drawing.Size.new(370, 8)
			self.@topGbox.TabIndex = 35
			self.@topGbox.TabStop = false
			# 
			# recentFilesLbl
			# 
			self.@recentFilesLbl.Location = System.Drawing.Point.new(9, 5)
			self.@recentFilesLbl.Name = "recentFilesLbl"
			self.@recentFilesLbl.Size = System.Drawing.Size.new(70, 16)
			self.@recentFilesLbl.TabIndex = 36
			self.@recentFilesLbl.Text = "Recent Files"
			# 
			# RecentFilesOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Controls.Add(self.@checkFilesExistCheckBox)
			self.@Controls.Add(self.@filesInMenuLbl)
			self.@Controls.Add(self.@recentFilesCountTextBox)
			self.@Controls.Add(self.@listLbl)
			self.@Controls.Add(self.@topGbox)
			self.@Controls.Add(self.@recentFilesLbl)
			self.@Name = "RecentFilesOptionsPage"
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end