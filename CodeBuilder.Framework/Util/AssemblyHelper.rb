require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Reflection, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class AssemblyHelper
		def AssemblyHelper.GetAssemblyPath(type)
			return AssemblyHelper.GetAssemblyPath(type.Assembly)
		end

		def AssemblyHelper.GetAssemblyPath(assembly)
			path = assembly.CodeBase
			uri = Uri.new(path)
			# If it wasn't loaded locally, use the Location
			if not uri.IsFile then
				return assembly.Location
			end
			if uri.IsUnc then
				return path.Substring(Uri.UriSchemeFile.Length + 1)
			end
			return uri.LocalPath
		end

		def AssemblyHelper.GetDirectoryName(assembly)
			return System.IO.Path.GetDirectoryName(AssemblyHelper.GetAssemblyPath(assembly))
		end
	end
end