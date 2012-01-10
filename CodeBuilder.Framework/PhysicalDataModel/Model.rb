require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.PhysicalDataModel
	# <summary>
	# Represent the Physical Data Model of Database.
	# </summary>
	class Model
		def initialize(tables, views)
			self.@_views = views
		end

		def initialize(tables, views)
			self.@_views = views
		end

		def initialize(tables, views)
			self.@_views = views
		end

		def initialize(tables, views)
			self.@_views = views
		end

		def Tables
			return self.@_tables
		end

		def Tables=(value)
			self.@_tables = value
		end

		def Views
			return self.@_views
		end

		def Views=(value)
			self.@_views = value
		end

		def Database
			return self.@_database
		end

		def Database=(value)
			self.@_database = value
		end

		def DatabaseName
			return self.@_databaseName
		end

		def DatabaseName=(value)
			self.@_databaseName = value
		end

		def Schema
			return self.@_schema
		end

		def Schema=(value)
			self.@_schema = value
		end
	end
end