module CodeBuilder.WinForm.UI.OptionsPages
	class DataSourceOptionsPage
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
			self.@datasourceLbl = System.Windows.Forms.Label.new()
			self.@topGbx = System.Windows.Forms.GroupBox.new()
			self.@noteTextLbl = System.Windows.Forms.Label.new()
			self.@noteLbl = System.Windows.Forms.Label.new()
			self.@connstrLbl = System.Windows.Forms.Label.new()
			self.@nameLbl = System.Windows.Forms.Label.new()
			self.@exporterLbl = System.Windows.Forms.Label.new()
			self.@nameTxtbox = System.Windows.Forms.TextBox.new()
			self.@connstrTxtbox = System.Windows.Forms.TextBox.new()
			self.@newsaveBtn = System.Windows.Forms.Button.new()
			self.@removeBtn = System.Windows.Forms.Button.new()
			self.@exporterCombox = System.Windows.Forms.ComboBox.new()
			self.@datasourceListbox = System.Windows.Forms.ListBox.new()
			self.SuspendLayout()
			# 
			# datasourceLbl
			# 
			self.@datasourceLbl.Location = System.Drawing.Point.new(9, 5)
			self.@datasourceLbl.Name = "datasourceLbl"
			self.@datasourceLbl.Size = System.Drawing.Size.new(80, 16)
			self.@datasourceLbl.TabIndex = 39
			self.@datasourceLbl.Text = "DataSources"
			# 
			# topGbx
			# 
			self.@topGbx.Anchor = ((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)))
			self.@topGbx.Location = System.Drawing.Point.new(90, 5)
			self.@topGbx.Name = "topGbx"
			self.@topGbx.Size = System.Drawing.Size.new(360, 8)
			self.@topGbx.TabIndex = 38
			self.@topGbx.TabStop = false
			# 
			# noteTextLbl
			# 
			self.@noteTextLbl.Location = System.Drawing.Point.new(246, 191)
			self.@noteTextLbl.Name = "noteTextLbl"
			self.@noteTextLbl.Size = System.Drawing.Size.new(207, 142)
			self.@noteTextLbl.TabIndex = 11
			# 
			# noteLbl
			# 
			self.@noteLbl.Font = System.Drawing.Font.new("Microsoft Sans Serif", 7.8f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((0)))
			self.@noteLbl.Location = System.Drawing.Point.new(190, 191)
			self.@noteLbl.Name = "noteLbl"
			self.@noteLbl.Size = System.Drawing.Size.new(50, 18)
			self.@noteLbl.TabIndex = 10
			self.@noteLbl.Text = "Note:"
			# 
			# connstrLbl
			# 
			self.@connstrLbl.Location = System.Drawing.Point.new(190, 65)
			self.@connstrLbl.Name = "connstrLbl"
			self.@connstrLbl.Size = System.Drawing.Size.new(80, 13)
			self.@connstrLbl.TabIndex = 4
			self.@connstrLbl.Text = "ConnectString:"
			# 
			# nameLbl
			# 
			self.@nameLbl.Location = System.Drawing.Point.new(190, 30)
			self.@nameLbl.Name = "nameLbl"
			self.@nameLbl.Size = System.Drawing.Size.new(60, 13)
			self.@nameLbl.TabIndex = 2
			self.@nameLbl.Text = "Name:"
			# 
			# exporterLbl
			# 
			self.@exporterLbl.Location = System.Drawing.Point.new(190, 100)
			self.@exporterLbl.Name = "exporterLbl"
			self.@exporterLbl.Size = System.Drawing.Size.new(60, 13)
			self.@exporterLbl.TabIndex = 6
			self.@exporterLbl.Text = "Exporter:"
			# 
			# nameTxtbox
			# 
			self.@nameTxtbox.Location = System.Drawing.Point.new(274, 30)
			self.@nameTxtbox.MaxLength = 200
			self.@nameTxtbox.Name = "nameTxtbox"
			self.@nameTxtbox.Size = System.Drawing.Size.new(179, 20)
			self.@nameTxtbox.TabIndex = 3
			# 
			# connstrTxtbox
			# 
			self.@connstrTxtbox.Location = System.Drawing.Point.new(274, 65)
			self.@connstrTxtbox.MaxLength = 500
			self.@connstrTxtbox.Name = "connstrTxtbox"
			self.@connstrTxtbox.Size = System.Drawing.Size.new(179, 20)
			self.@connstrTxtbox.TabIndex = 5
			# 
			# newsaveBtn
			# 
			self.@newsaveBtn.Location = System.Drawing.Point.new(349, 141)
			self.@newsaveBtn.Name = "newsaveBtn"
			self.@newsaveBtn.Size = System.Drawing.Size.new(104, 23)
			self.@newsaveBtn.TabIndex = 9
			self.@newsaveBtn.Text = "New/Save"
			self.@newsaveBtn.UseVisualStyleBackColor = true
			self.@newsaveBtn.Click { |sender, e| self.@newsaveBtn_Click(sender, e) }
			# 
			# removeBtn
			# 
			self.@removeBtn.Location = System.Drawing.Point.new(279, 141)
			self.@removeBtn.Name = "removeBtn"
			self.@removeBtn.Size = System.Drawing.Size.new(64, 23)
			self.@removeBtn.TabIndex = 8
			self.@removeBtn.Text = "Remove"
			self.@removeBtn.UseVisualStyleBackColor = true
			self.@removeBtn.Click { |sender, e| self.@removeBtn_Click(sender, e) }
			# 
			# exporterCombox
			# 
			self.@exporterCombox.FormattingEnabled = true
			self.@exporterCombox.Location = System.Drawing.Point.new(274, 100)
			self.@exporterCombox.Name = "exporterCombox"
			self.@exporterCombox.Size = System.Drawing.Size.new(121, 21)
			self.@exporterCombox.TabIndex = 7
			# 
			# datasourceListbox
			# 
			self.@datasourceListbox.FormattingEnabled = true
			self.@datasourceListbox.Location = System.Drawing.Point.new(10, 30)
			self.@datasourceListbox.Name = "datasourceListbox"
			self.@datasourceListbox.Size = System.Drawing.Size.new(160, 303)
			self.@datasourceListbox.TabIndex = 1
			self.@datasourceListbox.SelectedIndexChanged { |sender, e| self.@datasourceListbox_SelectedIndexChanged(sender, e) }
			# 
			# DataSourceOptionsPage
			# 
			self.@AutoScaleDimensions = System.Drawing.SizeF.new(6f, 13f)
			self.@AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
			self.@Controls.Add(self.@noteTextLbl)
			self.@Controls.Add(self.@noteLbl)
			self.@Controls.Add(self.@connstrLbl)
			self.@Controls.Add(self.@nameLbl)
			self.@Controls.Add(self.@exporterLbl)
			self.@Controls.Add(self.@nameTxtbox)
			self.@Controls.Add(self.@connstrTxtbox)
			self.@Controls.Add(self.@newsaveBtn)
			self.@Controls.Add(self.@removeBtn)
			self.@Controls.Add(self.@exporterCombox)
			self.@Controls.Add(self.@datasourceListbox)
			self.@Controls.Add(self.@datasourceLbl)
			self.@Controls.Add(self.@topGbx)
			self.@Name = "DataSourceOptionsPage"
			self.ResumeLayout(false)
			self.PerformLayout()
		end
	end
end