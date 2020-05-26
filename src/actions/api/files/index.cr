#require "./mixins/file_info"
require "jbuilder"

class Api::Files::Index < ApiAction
  include Api::FileInfo
  param client : String
  param all : Bool

  get "/api/files" do
    puts "Client : #{client}, \npublic root: #{File.expand_path public_root}"
    client_root = File.expand_path "#{public_root}/clients/#{client}"
    puts "Client root: #{client_root} (#{File.exists? client_root})"
    if client.empty? || !File.exists?(client_root)
      json({error: "Wrong client id", error_type: "client"})
    else


      files = [] of NamedTuple(name: String, size: UInt64, sha256: String)

      Dir.cd(client_root) do
        Dir.glob("**/*") do |file|
          path = File.expand_path file
          unless can_skip?(path, all) || File.directory? path
            #puts "Adding #{path}"
            files << file_info(path, client_root)
          end
        end
      end

      json(Jbuilder.new do |json|
        json.ignore ignore_regex.to_s
        json.dir "clients/#{client}"
        json.array! "files", files do |j, item|
          j.name item[:name]
          j.size item[:size]
          j.sha256 item[:sha256]
        end
      end.to_h)
    end
  end
end
