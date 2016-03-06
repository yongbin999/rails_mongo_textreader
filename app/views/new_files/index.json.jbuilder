json.array!(@new_files) do |new_file|
  json.extract! new_file, :id, :fileid, :line
  json.url new_file_url(new_file, format: :json)
end
