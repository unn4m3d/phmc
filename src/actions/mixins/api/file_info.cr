module Api::FileInfo
  protected def public_root
    "#{File.dirname(__FILE__)}/../../../../public"
  end

  protected def digest(path, name = "SHA256")
    d = OpenSSL::Digest.new(name)
    File.open(path) do |f|
      d.update f
    end
    d.final.hexstring
  end

  protected def file_info(path, root)
    {
      name: path.sub(root, ""),
      size: File.size(path).to_u64,
      sha256: digest(path)
    }
  end

  protected def ignore_regex
    /.*\.(json|config|points|world|cfg|txt|dat|properties|ini)$/i
  end

  protected def can_skip?(path, all)
    File.directory?(path) || (!all && path.match ignore_regex)
  end
end
