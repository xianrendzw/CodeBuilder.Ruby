require "mscorlib"

			require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI.OptionsPages
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	require "Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class DataSourceOptionsPage < BaseOptionsPage
		def initialize(key)
			@logger = InternalTrace.GetLogger(DataSourceOptionsPage.to_clr_type)
			@listBoxItems = Dictionary[System::String, DataSourceItem].new(10)
			self.InitializeComponent()
		end

		def initialize(key)
			@logger = InternalTrace.GetLogger(DataSourceOptionsPage.to_clr_type)
			@listBoxItems = Dictionary[System::String, DataSourceItem].new(10)
			self.InitializeComponent()
		end

		def LoadSettings()
			self.@isLoaded = true
			self.ListExporterItems()
			self.ListDataSourceItems()
		end

		def ApplySettings()
			begin
				self.SaveChanged()
				self.@listBoxItems.Clear()
				ConfigManager.RefreshDataSources()
				ConfigManager.Save()
			rescue Exception => ex
				raise ApplicationException.new("Save DataSource Items Failure", ex)
			ensure
			end
		end

		def datasourceListbox_SelectedIndexChanged(sender, e)
			if self.@datasourceListbox.SelectedItem == nil then
				return 
			end
			self.SelectedListBoxItem(self.@datasourceListbox.SelectedItem.ToString())
		end

		def removeBtn_Click(sender, e)
			selectedItem = self.@datasourceListbox.SelectedItem
			if selectedItem == nil then
				return 
			end
			name = selectedItem.ToString().Trim().ToLower()
			self.@listBoxItems[name].Status = DataSourceItemStatus.Deleted
			begin
				self.@datasourceListbox.Items.RemoveAt(self.@datasourceListbox.SelectedIndex)
			rescue Exception => ex
				@logger.Error("Remove datasource item failure!", ex)
				MessageBoxHelper.DisplayFailure("Remove datasource item failure!")
			ensure
			end
		end

		def newsaveBtn_Click(sender, e)
			name = self.@nameTxtbox.Text.Trim()
			connString = self.@connstrTxtbox.Text.Trim()
			exporter = self.@exporterCombox.Text
			if name.Trim().Length == 0 or connString.Trim().Length == 0 then
				MessageBoxHelper.Display("name or connectionstring cann't set empty")
				return 
			end
			if self.@listBoxItems.ContainsKey(name.ToLower()) then
				self.@listBoxItems[name.ToLower()].Name = name
				self.@listBoxItems[name.ToLower()].ConnectionString = connString
				self.@listBoxItems[name.ToLower()].Exporter = exporter
				if self.@listBoxItems[name.ToLower()].Status != DataSourceItemStatus.New then
					self.@listBoxItems[name.ToLower()].Status = DataSourceItemStatus.Edit
				end
				return 
			end
			self.@listBoxItems.Add(name.ToLower(), DataSourceItem.new(name, connString, exporter, DataSourceItemStatus.New))
			self.@datasourceListbox.Items.Add(name)
		end

		def ListExporterItems()
			self.@exporterCombox.Items.Clear()
			enumerator = ConfigManager.SettingsSection.Exporters.GetEnumerator()
			while enumerator.MoveNext()
				exporter = enumerator.Current
				self.@exporterCombox.Items.Add(exporter.Name)
			end
			self.@exporterCombox.Text = self.@exporterCombox.Items[0].ToString()
		end

		def ListDataSourceItems()
			self.@datasourceListbox.Items.Clear()
			self.@listBoxItems.Clear()
			enumerator = ConfigManager.DataSourceSection.DataSources.GetEnumerator()
			while enumerator.MoveNext()
				dataSource = enumerator.Current
				self.@datasourceListbox.Items.Add(dataSource.Name)
				name = dataSource.Name.Trim().ToLower()
				if not @listBoxItems.ContainsKey(name) then
					@listBoxItems.Add(name, DataSourceItem.new(dataSource.Name, dataSource.ConnectionString, dataSource.Exporter))
				end
			end
		end

		def SelectedListBoxItem(selectedItem)
			name = selectedItem.Trim().ToLower()
			if not @listBoxItems.ContainsKey(name) then
				return 
			end
			self.@nameTxtbox.Text = @listBoxItems[name].Name
			self.@connstrTxtbox.Text = @listBoxItems[name].ConnectionString
			self.@exporterCombox.Text = @listBoxItems[name].Exporter
		end

		def SaveChanged()
			enumerator = self.@listBoxItems.GetEnumerator()
			while enumerator.MoveNext()
				item = enumerator.Current
				if item.Value.Status == DataSourceItemStatus.None then
					next
				end
				if item.Value.Status == DataSourceItemStatus.Deleted then
					ConfigManager.DataSourceSection.DataSources.Remove(item.Value.Name)
					next
				end
				if item.Value.Status == DataSourceItemStatus.New then
					element = DataSourceElement.new()
					element.Name = item.Value.Name
					element.ConnectionString = item.Value.ConnectionString
					element.Exporter = item.Value.Exporter
					ConfigManager.DataSourceSection.DataSources.Add(element)
					next
				end
				if item.Value.Status == DataSourceItemStatus.Edit then
					ConfigManager.DataSourceSection.DataSources[item.Value.Name].Name = item.Value.Name
					ConfigManager.DataSourceSection.DataSources[item.Value.Name].ConnectionString = item.Value.ConnectionString
					ConfigManager.DataSourceSection.DataSources[item.Value.Name].Exporter = item.Value.Exporter
					next
				end
			end
		end

		class DataSourceItem
			def initialize(name, connectionString, exporter, status)
				self.@Name = name
				self.@ConnectionString = connectionString
				self.@Status = status
				self.@Exporter = exporter
			end

			def initialize(name, connectionString, exporter, status)
				self.@Name = name
				self.@ConnectionString = connectionString
				self.@Status = status
				self.@Exporter = exporter
			end

			def initialize(name, connectionString, exporter, status)
				self.@Name = name
				self.@ConnectionString = connectionString
				self.@Status = status
				self.@Exporter = exporter
			end

			def Name
			end

			def Name=(value)
			end

			def ConnectionString
			end

			def ConnectionString=(value)
			end

			def Exporter
			end

			def Exporter=(value)
			end

			def Status
			end

			def Status=(value)
			end
		end
		class DataSourceItemStatus
			def initialize()
			end
		end
	end
end