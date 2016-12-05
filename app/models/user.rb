class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, foreign_key: :commenter_id
  has_many :articles, foreign_key: :author_id

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

end
