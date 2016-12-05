class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :commenter, class_name: User

  validates_presence_of :text

end
