require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "pairtree"

describe "Pairtree" do
  before(:all) do
    @base_path = File.join(File.dirname(__FILE__), "../test_data/working")
  end

  it "should raise an error if a non-existent is specified without :create" do
    expect { Pairtree.at(@base_path) }.to raise_error(Pairtree::PathError)
  end

  describe "new pairtree" do
    after(:all) do
      FileUtils.rm_rf(@base_path)
    end

    it "should create a new pairtree" do
      prefix = "my_prefix:"
      pt = Pairtree.at(@base_path, prefix: prefix, create: true)
      expect(pt.prefix).to eql(prefix)
      expect(File.read(File.join(@base_path, "pairtree_prefix"))).to eql(prefix)
      expect(pt.root).to eql(File.join(@base_path, "pairtree_root"))
      expect(pt.pairtree_version).to eql(Pairtree::SPEC_VERSION)
    end
  end

  describe "existing pairtree" do
    before(:all) do
      Dir.chdir(File.join(File.dirname(__FILE__), "../test_data")) do
        FileUtils.cp_r("fixtures/pairtree_root_spec", "./working")
      end
    end

    after(:all) do
      FileUtils.rm_rf(@base_path)
    end

    it "should raise an error if a regular file is specified as a root" do
      expect { Pairtree.at(File.join(@base_path, "pairtree_prefix"), create: true) }.to raise_error(Pairtree::PathError)
    end

    it "should read the prefix if none is specified" do
      expect(Pairtree.at(@base_path).prefix).to eql(File.read(File.join(@base_path, "pairtree_prefix")))
    end

    it "should not complain if the given prefix matches the saved prefix" do
      expect(Pairtree.at(@base_path, prefix: "pfx:").prefix).to eql(File.read(File.join(@base_path, "pairtree_prefix")))
    end

    it "should raise an error if the given prefix does not match the saved prefix" do
      expect { Pairtree.at(@base_path, prefix: "wrong-prefix:") }.to raise_error(Pairtree::IdentifierError)
    end

    it "should not complain if the given version matches the saved version" do
      expect(Pairtree.at(@base_path, version: Pairtree::SPEC_VERSION).pairtree_version).to eql(Pairtree::SPEC_VERSION)
      expect(Pairtree.at(@base_path, version: Pairtree::SPEC_VERSION, create: true).pairtree_version).to eql(Pairtree::SPEC_VERSION)
    end

    it "should raise an error if the given version does not match the saved version" do
      expect { Pairtree.at(@base_path, version: 0.2) }.to raise_error(Pairtree::VersionMismatch)
      expect { Pairtree.at(@base_path, version: 0.2, create: true) }.to raise_error(Pairtree::VersionMismatch)
    end
  end
end
