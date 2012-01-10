require "mscorlib"

module CodeBuilder.WinForm.UI
	class AboutBox
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
			resources = System.ComponentModel.ComponentResourceManager.new(AboutBox.to_clr_type)
			self.@dotNetVersionLabel = System.Windows.Forms.Label.new()
			self.@clrTypeLabel = System.Windows.Forms.Label.new()
			self.@copyright = System.Windows.Forms.Label.new()
			self.@label7 = System.Windows.Forms.Label.new()
			self.@label6 = System.Windows.Forms.Label.new()
			self.@label5 = System.Windows.Forms.Label.new()
			self.@label4 = System.Windows.Forms.Label.new()
			self.@infoLinkLabel = System.Windows.Forms.LinkLabel.new()
			self.@label3 = System.Windows.Forms.Label.new()
			self.@label2 = System.Windows.Forms.Label.new()
			self.@versionLabel = System.Windows.Forms.Label.new()
			self.@label1 = System.Windows.Forms.Label.new()
			self.@OkButton = System.Windows.Forms.Button.new()
			self.SuspendLayout()
			# 
			# dotNetVersionLabel
			# 
			self.@dotNetVersionLabel.Location = System.Drawing.Point.new(157, 264)
			self.@dotNetVersionLabel.Name = "dotNetVersionLabel"
			self.@dotNetVersionLabel.Size = System.Drawing.Size.new(284, 23)
			self.@dotNetVersionLabel.TabIndex = 25
			# 
			# clrTypeLabel
			# 
			self.@clrTypeLabel.Location = System.Drawing.Point.new(24, 264)
			self.@clrTypeLabel.Name = "clrTypeLabel"
			self.@clrTypeLabel.Size = System.Drawing.Size.new(102, 15)
			self.@clrTypeLabel.TabIndex = 24
			self.@clrTypeLabel.Text = "CLR Version:"
			# 
			# copyright
			# 
			self.@copyright.Location = System.Drawing.Point.new(157, 12)
			self.@copyright.Name = "copyright"
			self.@copyright.Size = System.Drawing.Size.new(297, 84)
			self.@copyright.TabIndex = 23
			self.@copyright.Text = "Copyright (C) 2009-2012 Tom Deng\r\nAll Rights Reserved."
			# 
			# label7
			# 
			self.@label7.Location = System.Drawing.Point.new(24, 12)
			self.@label7.Name = "label7"
			self.@label7.Size = System.Drawing.Size.new(102, 28)
			self.@label7.TabIndex = 22
			self.@label7.Text = "Copyright:"
			# 
			# label6
			# 
			self.@label6.Location = System.Drawing.Point.new(157, 192)
			self.@label6.Name = "label6"
			self.@label6.Size = System.Drawing.Size.new(215, 29)
			self.@label6.TabIndex = 21
			self.@label6.Text = "Emil Song,Richard Li"
			# 
			# label5
			# 
			self.@label5.Location = System.Drawing.Point.new(24, 192)
			self.@label5.Name = "label5"
			self.@label5.Size = System.Drawing.Size.new(102, 29)
			self.@label5.TabIndex = 20
			self.@label5.Text = "Thanks to:"
			# 
			# label4
			# 
			self.@label4.Location = System.Drawing.Point.new(24, 104)
			self.@label4.Name = "label4"
			self.@label4.Size = System.Drawing.Size.new(102, 16)
			self.@label4.TabIndex = 19
			self.@label4.Text = "Information:"
			# 
			# infoLinkLabel
			# 
			self.@infoLinkLabel.LinkArea = System.Windows.Forms.LinkArea.new(0, 48)
			self.@infoLinkLabel.Location = System.Drawing.Point.new(157, 104)
			self.@infoLinkLabel.Name = "infoLinkLabel"
			self.@infoLinkLabel.Size = System.Drawing.Size.new(266, 16)
			self.@infoLinkLabel.TabIndex = 18
			self.@infoLinkLabel.TabStop = true
			self.@infoLinkLabel.Text = "http://www.dengzhiwei.com/category/codebuilder\r\n"
			self.@infoLinkLabel.LinkClicked { |sender, e| self.@infoLinkLabel_LinkClicked(sender, e) }
			# 
			# label3
			# 
			self.@label3.Location = System.Drawing.Point.new(157, 136)
			self.@label3.Name = "label3"
			self.@label3.Size = System.Drawing.Size.new(287, 48)
			self.@label3.TabIndex = 17
			self.@label3.Text = "Tom Deng,Peter Chen,Gallop Chen,Taven Li,Chanle Chen"
			# 
			# label2
			# 
			self.@label2.Location = System.Drawing.Point.new(24, 136)
			self.@label2.Name = "label2"
			self.@label2.Size = System.Drawing.Size.new(102, 29)
			self.@label2.TabIndex = 16
			self.@label2.Text = "Developers:"
			# 
			# versionLabel
			# 
			self.@versionLabel.Location = System.Drawing.Point.new(157, 232)
			self.@versionLabel.Name = "versionLabel"
			self.@versionLabel.Size = System.Drawing.Size.new(156, 23)
			self.@versionLabel.TabIndex = 15
			self.@versionLabel.Text = "1.0.11.1210"
			# 
			# label1
			# 
			self.@label1.Location = System.Drawing.Point.new(24, 232)
			self.@label1.Name = "label1"
			self.@label1.Size = System.Drawing.Size.new(102, 15)
			self.@label1.TabIndex = 14
			self.@label1.Text = "Version:"
			# 
			# OkButton
			# 
			self.@OkButton.DialogResult = System.Windows.Forms.DialogResult.Cancel
			self.@OkButton.Location = System.Drawing.Point.new(361, 296)
			self.@OkButton.Name = "OkButton"
			self.@OkButton.Size = System.Drawing.Size.new(96, 29)
			self.@OkButton.TabIndex = 13
			self.@OkButton.Text = "OK"
			self.@OkButton.Click { |sender, e| self.@OkButton_Click(sender, e) }
			# 
			# AboutBox
			# 
			self.@AcceptButton = self.@OkButton
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@CancelButton = self.@OkButton
			self.@ClientSize = System.Drawing.Size.new(480, 336)
			self.@Controls.Add(self.@dotNetVersionLabel)
			self.@Controls.Add(self.@clrTypeLabel)
			self.@Controls.Add(self.@copyright)
			self.@Controls.Add(self.@label7)
			self.@Controls.Add(self.@label6)
			self.@Controls.Add(self.@label5)
			self.@Controls.Add(self.@label4)
			self.@Controls.Add(self.@infoLinkLabel)
			self.@Controls.Add(self.@label3)
			self.@Controls.Add(self.@label2)
			self.@Controls.Add(self.@versionLabel)
			self.@Controls.Add(self.@label1)
			self.@Controls.Add(self.@OkButton)
			self.@FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
			self.@Icon = ((resources.GetObject("$this.Icon")))
			self.@MaximizeBox = false
			self.@MinimizeBox = false
			self.@Name = "AboutBox"
			self.@ShowInTaskbar = false
			self.@StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
			self.@Text = "About CodeBuilder"
			self.ResumeLayout(false)
		end
	end
end