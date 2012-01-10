require "mscorlib"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class ModelManager
		def ModelManager.Add(key, model)
			if @models.ContainsKey(key) then
				@models[key] = model
			else
				@models.Add(key, model)
			end
		end

		def ModelManager.Clear()
			@models.Clear()
		end

		def ModelManager.Remove(key)
			if @models.ContainsKey(key) then
				return @models.Remove(key)
			end
			return true
		end

		def Models
			return @models
		end

		def ModelManager.GetDatabase(key)
			if @models.ContainsKey(key) then
				return @models[key].Database
			end
			return System::String.Empty
		end

		def ModelManager.GetModelObject(model, objId)
			if model == nil then
				return nil
			end
			if model.Tables != nil and model.Tables.ContainsKey(objId) then
				return model.Tables[objId]
			end
			if model.Views != nil and model.Views.ContainsKey(objId) then
				return model.Views[objId]
			end
			return nil
		end

		def ModelManager.Clone()
			return @models.Select(x).ToDictionary(y.Key, z.Value)
		end

		def initialize()
			@models = Dictionary[System::String, Model].new(5)
		end
	end
end