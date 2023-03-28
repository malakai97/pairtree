module Pairtree
  class Path
    @@leaf_proc = lambda { |id| id }

    def self.set_leaf value = nil, &block
      @@leaf_proc = if value.nil?
        block
      elsif value.is_a?(Proc)
        value
      else
        lambda { |id| value }
      end
    end

    def self.leaf id
      if @@leaf_proc
        Pairtree::Identifier.encode(@@leaf_proc.call(id))
      else
        ""
      end
    end

    def self.id_to_path id
      path = File.join(Pairtree::Identifier.encode(id).scan(/..?/), leaf(id))
      path.sub(%r{#{File::SEPARATOR}+$}o, "")
    end

    def self.path_to_id ppath
      parts = ppath.split(File::SEPARATOR)
      parts.pop if @@leaf_proc && (parts.last.length > Root::SHORTY_LENGTH)
      Pairtree::Identifier.decode(parts.join)
    end

    def self.remove! path
      FileUtils.remove_dir(path, true)
      parts = path.split(File::SEPARATOR)
      parts.pop
      while (parts.length > 0) && (parts.last != "pairtree_root")
        begin
          FileUtils.rmdir(parts.join(File::SEPARATOR))
          parts.pop
        rescue SystemCallError
          break
        end
      end
    end
  end
end
