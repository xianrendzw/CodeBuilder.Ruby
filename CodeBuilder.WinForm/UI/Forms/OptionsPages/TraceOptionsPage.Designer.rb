module CodeBuilder.WinForm.UI.OptionsPages
	class TraceOptionsPage
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
			self.@noteTextLbl = System.Windows.Forms.Label.new()
			self.@noteLbl = System.Windows.Forms.Label.new()
			self.@logDirectoryLabel = System.Windows.Forms.Label.new()
			self.@logDirectoryLbl = System.Windows.Forms.Label.new()
			self.@traceLevelCombox = System.Windows.Forms.ComboBox.new()
			self.@tracLevelLbl = System.Windows.Forms.Label.new()
			self.@internalTraceLbl = System.Windows.Forms.Label.new()
			self.@topGbx = System.Windows.Forms.GroupBox.new()
			self.SuspendLayout()
			# 
			# noteTextLbl
			# 
			self.@noteTextLbl.Location = System.Drawing.Point.new(102, 130)
			self.@noteTextLbl.Name = "noteTextLbl"
			self.@noteTextLbl.Size = System.Drawing.Size.new(329, 40)
			self.@noteTextLbl.TabIndex = 6
			self.@noteTextLbl.Text = "Changes in the Trace Level will affect the current session. After changing the le" + "vel, you should not shut down and restart the Gui."
			# 
			# noteLbl
			# 
			self.@noteLbl.AutoSize = true
			self.@noteLbl.Font = System.Drawing.Font.new("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@noteLbl.Location = System.Drawing.Point.new(47, 130)
			self.@noteLbl.Name = "noteLbl"
			self.@noteLbl.Size = System.Drawing.Size.new(38, 13)
			self.@noteLbl.TabIndex = 5
			self.@noteLbl.Text = "Note:"
			# 
			# logDirectoryLabel
			# 
			self.@logDirectoryLabel.Location = System.Drawing.Point.new(105, 87)
			self.@logDirectoryLabel.Name = "logDirectoryLabel"
			self.@logDirectoryLabel.Size = System.Drawing.Size.new(300, 13)
			self.@logDirectoryLabel.TabIndex = 4
			# 
			# logDirectoryLbl
			# 
			self.@logDirectoryLbl.Font = System.Drawing.Font.new("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@logDirectoryLbl.Location = System.Drawing.Point.new(19, 87)
			self.@logDirectoryLbl.Name = "logDirectoryLbl"
			self.@logDirectoryLbl.Size = System.Drawing.Size.new(75, 13)
			self.@logDirectoryLbl.TabIndex = 3
			self.@logDirectoryLbl.Text = "Log Directory:"
			# 
			# traceLevelCombox
			# 
			self.@traceLevelCombox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
			self.@traceLevelCombox.FormattingEnabled = true
			self.@traceLevelCombox.Items.AddRange(Array[System::Object].new(["Default", "Off", "Error", "Warning", "Info", "Verbose"]))
			self.@traceLevelCombox.Location = System.Drawing.Point.new(105, 43)
			self.@traceLevelCombox.Name = "traceLevelCombox"
			self.@traceLevelCombox.Size = System.Drawing.Size.new(62, 21)
			self.@traceLevelCombox.TabIndex = 2
			# 
			# tracLevelLbl
			# 
			self.@tracLevelLbl.Location = System.Drawing.Point.new(19, 46)
			self.@tracLevelLbl.Name = "tracLevelLbl"
			self.@tracLevelLbl.Size = System.Drawing.Size.new(75, 13)
			self.@tracLevelLbl.TabIndex = 1
			self.@tracLevelLbl.Text = "Trace Level:"
			# 
			# internalTraceLbl
			# 
			self.@internalTraceLbl.Location = System.Drawing.Point.new(9, 5)
			self.@internalTraceLbl.Name = "internalTraceLbl"
			self.@internalTraceLbl.Size = System.Drawing.Size.new(80, 16)
			self.@internalTraceLbl.TabIndex = 23
			self.@internalTraceLbl.Text = "Internal Trace"
			# 
			# topGbx
			# 
			self.@topGbx.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@topGbx.Location = System.Drawing.Point.new(90, 5)
			self.@topGbx.Name = "topGbx"
			self.@topGbx.Size = System.Drawing.Size.new(360, 8)
			self.@topGbx.TabIndex = 22
			self.@topGbx.TabStop = false
			# 
			# TraceOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Controls.Add(self.@noteTextLbl)
			self.@Controls.Add(self.@noteLbl)
			self.@Controls.Add(self.@logDirectoryLabel)
			self.@Controls.Add(self.@logDirectoryLbl)
			self.@Controls.Add(self.@traceLevelCombox)
			self.@Controls.Add(self.@tracLevelLbl)
			self.@Controls.Add(self.@internalTraceLbl)
			self.@Controls.Add(self.@topGbx)
			self.@Name = "TraceOptionsPage"
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end