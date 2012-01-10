module CodeBuilder.WinForm.UI.OptionsPages
	class CodeGeneralOptionsPage
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
			self.@ouputPathTxtbox = System.Windows.Forms.TextBox.new()
			self.@ouputPathLbl = System.Windows.Forms.Label.new()
			self.@label2 = System.Windows.Forms.Label.new()
			self.@label1 = System.Windows.Forms.Label.new()
			self.@generationLbl = System.Windows.Forms.Label.new()
			self.@groupBox3 = System.Windows.Forms.GroupBox.new()
			self.@ouputPathBtn = System.Windows.Forms.Button.new()
			self.@folderBrowserDialog = System.Windows.Forms.FolderBrowserDialog.new()
			self.@templatePathBtn = System.Windows.Forms.Button.new()
			self.@templatePathTxtbox = System.Windows.Forms.TextBox.new()
			self.@templatePathLbl = System.Windows.Forms.Label.new()
			self.SuspendLayout()
			# 
			# ouputPathTxtbox
			# 
			self.@ouputPathTxtbox.Location = System.Drawing.Point.new(105, 43)
			self.@ouputPathTxtbox.Name = "ouputPathTxtbox"
			self.@ouputPathTxtbox.Size = System.Drawing.Size.new(311, 20)
			self.@ouputPathTxtbox.TabIndex = 2
			# 
			# ouputPathLbl
			# 
			self.@ouputPathLbl.Location = System.Drawing.Point.new(19, 46)
			self.@ouputPathLbl.Name = "ouputPathLbl"
			self.@ouputPathLbl.Size = System.Drawing.Size.new(80, 13)
			self.@ouputPathLbl.TabIndex = 1
			self.@ouputPathLbl.Text = "Output path:"
			# 
			# label2
			# 
			self.@label2.Location = System.Drawing.Point.new(102, 127)
			self.@label2.Name = "label2"
			self.@label2.Size = System.Drawing.Size.new(345, 76)
			self.@label2.TabIndex = 8
			self.@label2.Text = "Generationed code files will be save to Output Path directory .\r\nCode template fi" + "les will be write to/read from Template Path directory."
			# 
			# label1
			# 
			self.@label1.Font = System.Drawing.Font.new("Microsoft Sans Serif", 7.8f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@label1.Location = System.Drawing.Point.new(22, 127)
			self.@label1.Name = "label1"
			self.@label1.Size = System.Drawing.Size.new(77, 40)
			self.@label1.TabIndex = 7
			self.@label1.Text = "Note:"
			# 
			# generationLbl
			# 
			self.@generationLbl.Location = System.Drawing.Point.new(9, 5)
			self.@generationLbl.Name = "generationLbl"
			self.@generationLbl.Size = System.Drawing.Size.new(60, 16)
			self.@generationLbl.TabIndex = 37
			self.@generationLbl.Text = "General"
			# 
			# groupBox3
			# 
			self.@groupBox3.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@groupBox3.Location = System.Drawing.Point.new(80, 5)
			self.@groupBox3.Name = "groupBox3"
			self.@groupBox3.Size = System.Drawing.Size.new(370, 8)
			self.@groupBox3.TabIndex = 36
			self.@groupBox3.TabStop = false
			# 
			# ouputPathBtn
			# 
			self.@ouputPathBtn.Font = System.Drawing.Font.new("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@ouputPathBtn.Location = System.Drawing.Point.new(422, 40)
			self.@ouputPathBtn.Name = "ouputPathBtn"
			self.@ouputPathBtn.Size = System.Drawing.Size.new(25, 23)
			self.@ouputPathBtn.TabIndex = 3
			self.@ouputPathBtn.Text = "..."
			self.@ouputPathBtn.TextAlign = System.Drawing.ContentAlignment.TopCenter
			self.@ouputPathBtn.UseVisualStyleBackColor = true
			self.@ouputPathBtn.Click { |sender, e| self.@ouputPathBtn_Click(sender, e) }
			# 
			# templatePathBtn
			# 
			self.@templatePathBtn.Font = System.Drawing.Font.new("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@templatePathBtn.Location = System.Drawing.Point.new(422, 79)
			self.@templatePathBtn.Name = "templatePathBtn"
			self.@templatePathBtn.Size = System.Drawing.Size.new(25, 23)
			self.@templatePathBtn.TabIndex = 6
			self.@templatePathBtn.Text = "..."
			self.@templatePathBtn.TextAlign = System.Drawing.ContentAlignment.TopCenter
			self.@templatePathBtn.UseVisualStyleBackColor = true
			self.@templatePathBtn.Click { |sender, e| self.@templatePathBtn_Click(sender, e) }
			# 
			# templatePathTxtbox
			# 
			self.@templatePathTxtbox.Location = System.Drawing.Point.new(105, 82)
			self.@templatePathTxtbox.Name = "templatePathTxtbox"
			self.@templatePathTxtbox.Size = System.Drawing.Size.new(311, 20)
			self.@templatePathTxtbox.TabIndex = 5
			# 
			# templatePathLbl
			# 
			self.@templatePathLbl.Location = System.Drawing.Point.new(19, 85)
			self.@templatePathLbl.Name = "templatePathLbl"
			self.@templatePathLbl.Size = System.Drawing.Size.new(80, 13)
			self.@templatePathLbl.TabIndex = 4
			self.@templatePathLbl.Text = "Template path:"
			# 
			# CodeGeneralOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Controls.Add(self.@templatePathBtn)
			self.@Controls.Add(self.@templatePathTxtbox)
			self.@Controls.Add(self.@templatePathLbl)
			self.@Controls.Add(self.@ouputPathBtn)
			self.@Controls.Add(self.@ouputPathTxtbox)
			self.@Controls.Add(self.@ouputPathLbl)
			self.@Controls.Add(self.@label2)
			self.@Controls.Add(self.@label1)
			self.@Controls.Add(self.@generationLbl)
			self.@Controls.Add(self.@groupBox3)
			self.@Name = "CodeGeneralOptionsPage"
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end