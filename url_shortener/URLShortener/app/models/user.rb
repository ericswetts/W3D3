# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  
  has_many :shortened_urls,
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: :shortened_url
  
end
