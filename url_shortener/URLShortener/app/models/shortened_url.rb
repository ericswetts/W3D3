# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ActiveRecord::Base
  extend SecureRandom
  
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  
  
  belongs_to :user, 
    foreign_key: :user_id,
    primary_key: :id, 
    class_name: :User
  
  def self.random_code
    SecureRandom::urlsafe_base64
  end
  
end
