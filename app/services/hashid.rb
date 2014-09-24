class Hashid
  def self.encode(id)
    Hashids.new(Rails.application.secrets.hashid_salt, 6).encode(id)
  end

  def self.decode(hashid)
    Hashids.new(Rails.application.secrets.hashid_salt, 6).decode(hashid).first
  end
end
