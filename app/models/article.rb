class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :author, class_name: User

  validates_presence_of :title

end
