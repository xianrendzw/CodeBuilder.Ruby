require "mscorlib"

module CodeBuilder.WinForm.UI
	class TreeOptionsDialog
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
			resources = System.ComponentModel.ComponentResourceManager.new(TreeOptionsDialog.to_clr_type)
			self.@buttomLineGbx = System.Windows.Forms.GroupBox.new()
			self.@pagePanel = System.Windows.Forms.Panel.new()
			self.@optionTreeView = System.Windows.Forms.TreeView.new()
			self.@treeNodeImageList = System.Windows.Forms.ImageList.new(self.@components)
			self.SuspendLayout()
			# 
			# cancelButton
			# 
			self.@cancelButton.Location = System.Drawing.Point.new(592, 392)
			# 
			# okButton
			# 
			self.@okButton.Location = System.Drawing.Point.new(504, 392)
			# 
			# buttomLineGbx
			# 
			self.@buttomLineGbx.Location = System.Drawing.Point.new(208, 360)
			self.@buttomLineGbx.Name = "buttomLineGbx"
			self.@buttomLineGbx.Size = System.Drawing.Size.new(456, 8)
			self.@buttomLineGbx.TabIndex = 24
			self.@buttomLineGbx.TabStop = false
			# 
			# pagePanel
			# 
			self.@pagePanel.Location = System.Drawing.Point.new(208, 16)
			self.@pagePanel.Name = "pagePanel"
			self.@pagePanel.Size = System.Drawing.Size.new(456, 336)
			self.@pagePanel.TabIndex = 23
			# 
			# optionTreeView
			# 
			self.@optionTreeView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
			self.@optionTreeView.HideSelection = false
			self.@optionTreeView.Location = System.Drawing.Point.new(16, 16)
			self.@optionTreeView.Name = "optionTreeView"
			self.@optionTreeView.PathSeparator = "."
			self.@optionTreeView.Size = System.Drawing.Size.new(176, 350)
			self.@optionTreeView.TabIndex = 22
			self.@optionTreeView.AfterCollapse { |sender, e| self.@optionTreeView_AfterCollapse(sender, e) }
			self.@optionTreeView.AfterExpand { |sender, e| self.@optionTreeView_AfterExpand(sender, e) }
			self.@optionTreeView.AfterSelect { |sender, e| self.@optionTreeView_AfterSelect(sender, e) }
			# 
			# treeNodeImageList
			# 
			self.@treeNodeImageList.ImageStream = ((resources.GetObject("treeNodeImageList.ImageStream")))
			self.@treeNodeImageList.TransparentColor = System.Drawing.Color.Transparent
			self.@treeNodeImageList.Images.SetKeyName(0, "folderClosed.gif")
			self.@treeNodeImageList.Images.SetKeyName(1, "folderOpen.gif")
			self.@treeNodeImageList.Images.SetKeyName(2, "leaf.gif")
			# 
			# TreeOptionsDialog
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@ClientSize = System.Drawing.Size.new(682, 426)
			self.@Controls.Add(self.@buttomLineGbx)
			self.@Controls.Add(self.@pagePanel)
			self.@Controls.Add(self.@optionTreeView)
			self.@Name = "TreeOptionsDialog"
			self.@ShowInTaskbar = false
			self.@Load { |sender, e| self.@TreeOptionsDialog_Load(sender, e) }
			self.@Controls.SetChildIndex(self.@okButton, 0)
			self.@Controls.SetChildIndex(self.@cancelButton, 0)
			self.@Controls.SetChildIndex(self.@optionTreeView, 0)
			self.@Controls.SetChildIndex(self.@pagePanel, 0)
			self.@Controls.SetChildIndex(self.@buttomLineGbx, 0)
			self.ResumeLayout(false)
		end
	end
end