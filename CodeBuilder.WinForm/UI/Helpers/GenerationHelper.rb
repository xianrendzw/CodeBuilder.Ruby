require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text.RegularExpressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class GenerationHelper
		def GenerationHelper.IsValidPackageName(packageName)
			if System::String.IsNullOrEmpty(packageName) or packageName.Trim().Length == 0 then
				return false
			end
			return Regex.IsMatch(packageName, "[a-zA-Z]+")
		end

		def GenerationHelper.GetGenerationObjects(treeView)
			generationObjects = Dictionary[System::String, List].new()
			enumerator = treeView.Nodes.GetEnumerator()
			while enumerator.MoveNext()
				parentNode = enumerator.Current
				generationObjects.Add(parentNode.Index.ToString(), GenerationHelper.GetCheckedTags(parentNode.Nodes))
			end
			return generationObjects
		end

		def GenerationHelper.GetCheckedTags(nodes)
			tags = List[System::String].new()
			enumerator = nodes.GetEnumerator()
			while enumerator.MoveNext()
				node = enumerator.Current
				if node.Checked and node.Tag != nil then
					tags.Add(node.Tag.ToString())
				end
				GenerationHelper.GetCheckedTags(node.Nodes, tags)
			end
			return tags
		end

		def GenerationHelper.GetCheckedTags(nodes, tags)
			enumerator = nodes.GetEnumerator()
			while enumerator.MoveNext()
				node = enumerator.Current
				if node.Checked and node.Tag != nil then
					tags.Add(node.Tag.ToString())
				end
				GenerationHelper.GetCheckedTags(node.Nodes, tags)
			end
		end
	end
end