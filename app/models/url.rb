class Url < ActiveRecord::Base

  belongs_to :user

  validates_format_of :original, :with => URI::regexp

  def self.gen_hash
    SecureRandom.urlsafe_base64(6)
  end
end
