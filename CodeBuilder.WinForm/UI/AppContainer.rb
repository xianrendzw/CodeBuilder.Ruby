require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.ComponentModel.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.WinForm.UI
	class AppContainer < Container
		def initialize()
			@_services = ServiceContainer.new()
			@_services.AddService(IServiceContainer.to_clr_type, @_services)
		end

		def Services
			return @_services
		end

		def GetService(service)
			s = @_services.GetService(service)
			if s == nil then
				s = self.GetService(service)
			end
			return s
		end

		def AppContainer.GetSite(control)
			while control != nil and control.Site == nil
				control = control.Parent
			end
			return control == nil ? nil : control.Site
		end

		def AppContainer.GetContainer(control)
			site = AppContainer.GetSite(control)
			return site == nil ? nil : site.Container
		end

		def AppContainer.GetService(control, service)
			site = AppContainer.GetSite(control)
			return site == nil ? nil : site.GetService(service)
		end

		def AppContainer.GetAppContainer(control)
			return AppContainer.GetContainer(control)
		end
	end
end