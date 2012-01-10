module CodeBuilder.WinForm.UI
	class BaseOptionsPage
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
			self.SuspendLayout()
			# 
			# BaseOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Name = "BaseOptionsPage"
			self.@Size = System.Drawing.Size.new(456, 336)
			self.ResumeLayout(false)
		end
	end
end