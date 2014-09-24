class Hashid
  def self.encode(id)
    hashids.encode(id)
  end

  def self.decode(hashid)
    hashids.decode(hashid).first
  end

  def self.hashids
    @hashids ||= Hashids.new(salt, minimum_length)
  end
  private_class_method :hashids

  def self.salt
    Rails.application.secrets.hashid_salt
  end
  private_class_method :salt

  def self.minimum_length
    6
  end
  private_class_method :minimum_length
end
