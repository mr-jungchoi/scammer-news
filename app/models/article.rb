class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: User

  validates_presence_of :title
end
