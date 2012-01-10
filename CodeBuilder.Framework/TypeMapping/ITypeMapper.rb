require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.TypeMapping
	require "Util, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	class ITypeMapper
		# <summary>
		# 
		# </summary>
		# <param typeName="database"></param>
		# <param typeName="value"></param>
		# <param typeName="dbDataTypeName"></param>
		# <returns></returns>
		def GetLanguageType(database, language, dbDataTypeName)
		end
	end
end