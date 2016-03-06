class NewFile
  include Mongoid::Document
  field :fileid, type: Integer
  field :line, type: Hash
  
  index "line" => 1

  validates :fileid, :line, :presence => true
end
