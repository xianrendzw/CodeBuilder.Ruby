require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Configuration
	class TemplateEngineElementCollection < ConfigurationElementCollection
		def Item
			return self.BaseGet(name)
		end

		def Item=(value)
			if self.BaseGet(name) != nil then
				index = self.BaseIndexOf(self.BaseGet(name))
				self.BaseRemoveAt(index)
				self.BaseAdd(index, value)
				return 
			end
			self.BaseAdd(value)
		end

		def Item
			return self.BaseGet(index)
		end

		def Item=(value)
			if self.BaseGet(index) != nil then
				self.BaseRemoveAt(index)
			end
			self.BaseAdd(index, value)
		end

		def Add(element)
			self[element.Name] = element
		end

		def Remove(key)
			if self.BaseGet(key) != nil then
				self.BaseRemove(key)
			end
		end

		def CreateNewElement()
			return TemplateEngineElement.new()
		end

		def GetElementKey(element)
			return (element).Name
		end
	end
end