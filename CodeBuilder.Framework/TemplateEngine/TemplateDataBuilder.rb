require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TemplateEngine
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "PhysicalDataModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "TypeMapping, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class TemplateDataBuilder
		def TemplateDataBuilder.Build(models, generationObjects, settings)
			templateDatas = List[TemplateData].new()
			enumerator = generationObjects.GetEnumerator()
			while enumerator.MoveNext()
				genObject = enumerator.Current
				enumerator = genObject.Value.GetEnumerator()
				while enumerator.MoveNext()
					objId = enumerator.Current
					modelObject = TemplateDataBuilder.GetModelObject(models[genObject.Key], objId)
					if modelObject == nil then
						next
					end
					enumerator = settings.TemplatesNames.GetEnumerator()
					while enumerator.MoveNext()
						templateName = enumerator.Current
						templateData = TemplateDataBuilder.Build(modelObject, settings, templateName, models[genObject.Key].Database, genObject.Key)
						if templateData != nil then
							templateDatas.Add(templateData)
						end
					end
				end
			end
			return templateDatas
		end

		def TemplateDataBuilder.Build(modelObject, settings, templateName, database, modelId)
			if settings == nil then
				return nil
			end
			if modelObject then
				table = modelObject
				return TemplateDataBuilder.CreateTemplateData(table, settings, templateName, database, modelId)
			end
			if modelObject then
				view = modelObject
				return TemplateDataBuilder.CreateTemplateData(view, settings, templateName, database, modelId)
			end
			return nil
		end

		def TemplateDataBuilder.GetModelObject(model, objId)
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

		def TemplateDataBuilder.CreateTemplateData(modelObject, settings, templateName, database, modelId)
			templateData = TemplateData.new()
			templateData.Database = database
			templateData.TemplateName = templateName
			templateData.Author = settings.Author
			templateData.Version = settings.Version
			templateData.Language = settings.Language
			templateData.Package = settings.Package
			templateData.TablePrefix = settings.TablePrefix
			templateData.TemplateEngine = settings.TemplateEngine
			templateData.Encoding = settings.Encoding
			templateData.IsOmitTablePrefix = settings.IsOmitTablePrefix
			templateData.IsStandardizeName = settings.IsStandardizeName
			templateData.Prefix = ConfigManager.TemplateSection.Templates[templateName].Prefix
			templateData.Suffix = ConfigManager.TemplateSection.Templates[templateName].Suffix
			templateData.Name = TemplateDataBuilder.GetTemplateDataName(settings.IsOmitTablePrefix, settings.IsStandardizeName, settings.TablePrefix, modelObject.Name)
			templateData.TemplateFileName = Path.Combine(ConfigManager.TemplatePath, ConfigManager.TemplateSection.Templates[templateName].FileName)
			fileName = System::String.Format("{0}{1}{2}", templateData.Prefix, templateData.Name, templateData.Suffix)
			templateData.CodeFileName = System::String.Format("{0}{1}", PathHelper.GetCodeFileName(ConfigManager.GenerationCodeOuputPath, ConfigManager.SettingsSection.Languages[settings.Language].Alias, ConfigManager.SettingsSection.TemplateEngines[settings.TemplateEngine].Name, ConfigManager.TemplateSection.Templates[templateName].DisplayName, settings.Package, modelId, fileName), ConfigManager.SettingsSection.Languages[settings.Language].Extension)
			modelObject.Name = templateData.Name
			templateData.ModelObject = TemplateDataBuilder.GetStandardizedModelObject(modelObject, database, settings)
			return templateData
		end

		def TemplateDataBuilder.GetTemplateDataName(isOmitPrefix, isStandardName, tablePrefix, name)
			if isOmitPrefix then
				name = name.TrimStart(tablePrefix.ToCharArray())
			end
			if isStandardName then
				name = name.StandardizeName()
			end
			return name
		end

		def TemplateDataBuilder.GetStandardizedModelObject(modelObject, database, settings)
			isStandardizeName = settings.IsStandardizeName
			isDynamicLanguage = ConfigManager.SettingsSection.Languages[settings.Language].IsDynamic
			languageAlias = ConfigManager.SettingsSection.Languages[settings.Language].Alias
			if not isStandardizeName and isDynamicLanguage then
				return modelObject
			end
			typeMapper = nil
			if not isDynamicLanguage then
				typeMapper = TypeMapperFactory.Creator()
			end
			typeMappingDatabase = ConfigManager.SettingsSection.Databases[database].TypeMapping
			enumerator = modelObject.Columns.Values.GetEnumerator()
			while enumerator.MoveNext()
				column = enumerator.Current
				if isStandardizeName then
					column.Name = column.Name.StandardizeName()
				end
				if typeMapper != nil then
					langType = typeMapper.GetLanguageType(typeMappingDatabase, languageAlias, column.DataType)
					if langType == nil then
						next
					end
					column.LanguageType = langType.TypeName
					column.LanguageDefaultValue = System::String.IsNullOrEmpty(column.DefaultValue) ? langType.DefaultValue : column.DefaultValue
				end
			end
			return modelObject
		end
	end
end