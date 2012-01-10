module CodeBuilder.WinForm.UI
	class BaseOptionsDialog
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
			self.@cancelButton = System.Windows.Forms.Button.new()
			self.@okButton = System.Windows.Forms.Button.new()
			self.SuspendLayout()
			# 
			# cancelButton
			# 
			self.@cancelButton.Anchor = (((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
			self.@cancelButton.CausesValidation = false
			self.@cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel
			self.@cancelButton.Location = System.Drawing.Point.new(257, 422)
			self.@cancelButton.Name = "cancelButton"
			self.@cancelButton.Size = System.Drawing.Size.new(72, 24)
			self.@cancelButton.TabIndex = 20
			self.@cancelButton.Text = "Cancel"
			# 
			# okButton
			# 
			self.@okButton.Anchor = (((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)))
			self.@okButton.Location = System.Drawing.Point.new(169, 422)
			self.@okButton.Name = "okButton"
			self.@okButton.Size = System.Drawing.Size.new(72, 24)
			self.@okButton.TabIndex = 19
			self.@okButton.Text = "OK"
			self.@okButton.Click { |sender, e| self.@okButton_Click(sender, e) }
			# 
			# BaseOptionsDialog
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@ClientSize = System.Drawing.Size.new(336, 458)
			self.@Controls.Add(self.@cancelButton)
			self.@Controls.Add(self.@okButton)
			self.@FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
			self.@HelpButton = true
			self.@MaximizeBox = false
			self.@MinimizeBox = false
			self.@Name = "BaseOptionsDialog"
			self.@StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
			self.@Text = "Options"
			self.@FormClosed { |sender, e| self.@BaseOptionsDialog_FormClosed(sender, e) }
			self.ResumeLayout(false)
		end
	end
end