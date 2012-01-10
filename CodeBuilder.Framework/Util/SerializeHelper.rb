require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.IO, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Xml.Serialization, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Runtime.Serialization, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Runtime.Serialization.Json, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module CodeBuilder.Util
	class SerializeHelper
		def SerializeHelper.XmlSerialize(obj, fileName)
			SerializeHelper.XmlSerialize(obj, fileName, Encoding.UTF8)
		end

		def SerializeHelper.XmlSerialize(obj, fileName, encoding)
			xmlns = XmlSerializerNamespaces.new()
			xmlns.Add(String.Empty, String.Empty)
			serializer = XmlSerializer.new(T.to_clr_type)
			writer = StreamWriter.new(fileName, false, encoding)
			serializer.Serialize(writer, obj, xmlns)
			writer.Close()
		end

		def SerializeHelper.XmlSerialize(obj)
			return SerializeHelper.XmlSerialize(obj, Encoding.UTF8)
		end

		def SerializeHelper.XmlSerialize(obj, encoding)
			xmlns = XmlSerializerNamespaces.new()
			xmlns.Add(String.Empty, String.Empty)
			serializer = XmlSerializer.new(T.to_clr_type)
			stream = MemoryStream.new()
			serializer.Serialize(stream, obj, xmlns)
			stream.Position = 0
			sr = StreamReader.new(stream, encoding)
			resultStr = sr.ReadToEnd()
			sr.Close()
			stream.Close()
			return resultStr
		end

		def SerializeHelper.XmlDeserialize(fileName)
			return SerializeHelper.XmlDeserialize(fileName, Encoding.UTF8)
		end

		def SerializeHelper.XmlDeserialize(fileName, encoding)
			serializer = XmlSerializer.new(T.to_clr_type)
			reader = StreamReader.new(fileName, encoding)
			obj = serializer.Deserialize(reader)
			reader.Close()
			return obj
		end

		def SerializeHelper.XmlTextDeserialize(xmlText)
			return SerializeHelper.XmlTextDeserialize(xmlText, Encoding.UTF8)
		end

		def SerializeHelper.XmlTextDeserialize(xmlText, encoding)
			serializer = XmlSerializer.new(T.to_clr_type)
			ms = MemoryStream.new(encoding.GetBytes(xmlText.ToCharArray()))
			obj = serializer.Deserialize(ms)
			ms.Close()
			return obj
		end

		def SerializeHelper.XmlDataContractSerialize(obj)
			return SerializeHelper.XmlDataContractSerialize(obj, Encoding.UTF8)
		end

		def SerializeHelper.XmlDataContractSerialize(obj, encoding)
			serializer = DataContractSerializer.new(T.to_clr_type)
			stream = MemoryStream.new()
			serializer.WriteObject(stream, obj)
			stream.Position = 0
			sr = StreamReader.new(stream, encoding)
			resultStr = sr.ReadToEnd()
			sr.Close()
			stream.Close()
			return resultStr
		end

		def SerializeHelper.XmlDataContractDeserialize(xmlText)
			return SerializeHelper.XmlDataContractDeserialize(xmlText, Encoding.UTF8)
		end

		def SerializeHelper.XmlDataContractDeserialize(xmlText, encoding)
			serializer = DataContractSerializer.new(T.to_clr_type)
			ms = MemoryStream.new(encoding.GetBytes(xmlText.ToCharArray()))
			obj = serializer.ReadObject(ms)
			ms.Close()
			return obj
		end

		def SerializeHelper.JsonSerialize(obj)
			serializer = DataContractJsonSerializer.new(T.to_clr_type)
			stream = MemoryStream.new()
			serializer.WriteObject(stream, obj)
			stream.Position = 0
			sr = StreamReader.new(stream)
			resultStr = sr.ReadToEnd()
			sr.Close()
			stream.Close()
			return resultStr
		end

		def SerializeHelper.JsonDeserialize(json)
			serializer = DataContractJsonSerializer.new(T.to_clr_type)
			ms = MemoryStream.new(System.Text.Encoding.UTF8.GetBytes(json.ToCharArray()))
			obj = serializer.ReadObject(ms)
			ms.Close()
			return obj
		end
	end
end