require "tempbucket/version"
require "fog"
require "secure_random"

class Tempbucket
  def write(file)
    key = key_for(file)
    fogfile = tempbucket.files.create(
      key: key,
      body: file,
      public: false
    )

    File.new(fogfile)
  end

  def read(key)
    if fogfile = tempbucket.files.get(key)
      File.new(fogfile)
    end
  end

  def delete(key)
    tempbucket.files.delete(key)
  end

  class File
    def initialize(fogfile)
      @fogfile = fogfile
    end

    def key
      @fogfile.key
    end

    def read
      @fogfile.body
    end

    def close
      @fogfile.destroy
    end
  end

  private

  def key_for(file)
    uuid = ::SecureRandom.uuid
    filename = ::File.basename file.path
    ::File.join(uuid, filename)
  end

  def tempbucket
    @tempbucket ||= ::Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id:     ENV["TEMPBUCKET_ACCESS_KEY_ID"].to_s,
      aws_secret_access_key: ENV["TEMPBUCKET_SECRET_ACCESS_KEY"].to_s
    ).directories.get(ENV["TEMPBUCKET_BUCKET"])
  end
end
