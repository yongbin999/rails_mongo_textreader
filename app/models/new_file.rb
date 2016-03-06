class NewFile
  include Mongoid::Document
  field :fileid, type: Integer
  field :line, type: Integer
  field :content, type: String
end
