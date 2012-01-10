require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class TreeOptionsDialog < BaseOptionsDialog
		def initialize()
			self.InitializeComponent()
		end

		def TreeOptionsDialog.Display(owner, initialPageName, pages)
			@initialPage = initialPageName
			dialog = TreeOptionsDialog.new()
			owner.Site.Container.Add(dialog)
			dialog.Font = owner.Font
			dialog.OptionsPages.AddRange(pages)
			dialog.ShowDialog()
		end

		def optionTreeView_AfterSelect(sender, e)
			key = e.Node.FullPath
			page = OptionsPages[key]
			if page != nil and page != @current then
				pagePanel.Controls.Clear()
				pagePanel.Controls.Add(page)
				page.Dock = DockStyle.Fill
				@current = page
				return 
			end
		end

		def optionTreeView_AfterExpand(sender, e)
			e.Node.ImageIndex = e.Node.SelectedImageIndex = 1
		end

		def optionTreeView_AfterCollapse(sender, e)
			e.Node.ImageIndex = e.Node.SelectedImageIndex = 0
		end

		def TreeOptionsDialog_Load(sender, e)
			enumerator = OptionsPages.GetEnumerator()
			while enumerator.MoveNext()
				page = enumerator.Current
				self.AddBranchToTree(optionTreeView.Nodes, page.Key)
			end
			if optionTreeView.VisibleCount >= optionTreeView.GetNodeCount(true) then
				optionTreeView.ExpandAll()
			end
			self.SelectInitialPage()
			optionTreeView.Select()
		end

		def SelectInitialPage()
			if @initialPage != nil then
				self.SelectPage(@initialPage)
			elsif optionTreeView.Nodes.Count > 0 then
				self.SelectFirstPage(optionTreeView.Nodes)
			end
		end

		def SelectPage(pageName)
			node = self.FindNode(optionTreeView.Nodes, pageName)
			if node != nil then
				optionTreeView.SelectedNode = node
			else
				self.SelectFirstPage(optionTreeView.Nodes)
			end
		end

		def FindNode(nodes, key)
			dot = key.IndexOf('.')
			tail = nil
			if dot >= 0 then
				tail = key.Substring(dot + 1)
				key = key.Substring(0, dot)
			end
			enumerator = nodes.GetEnumerator()
			while enumerator.MoveNext()
				node = enumerator.Current
				if node.Text == key then
					return tail == nil ? node : self.FindNode(node.Nodes, tail)
				end
			end
			return nil
		end

		def SelectFirstPage(nodes)
			if nodes[0].Nodes.Count == 0 then
				optionTreeView.SelectedNode = nodes[0]
			else
				nodes[0].Expand()
				self.SelectFirstPage(nodes[0].Nodes)
			end
		end

		def AddBranchToTree(nodes, key)
			dot = key.IndexOf('.')
			if dot < 0 then
				nodes.Add(TreeNode.new(key, 2, 2))
				return 
			end
			name = key.Substring(0, dot)
			key = key.Substring(dot + 1)
			node = self.FindOrAddNode(nodes, name)
			if key != nil then
				self.AddBranchToTree(node.Nodes, key)
			end
		end

		def FindOrAddNode(nodes, name)
			enumerator = nodes.GetEnumerator()
			while enumerator.MoveNext()
				node = enumerator.Current
				if node.Text == name then
					return node
				end
			end
			newNode = TreeNode.new(name, 0, 0)
			nodes.Add(newNode)
			return newNode
		end
	end
end