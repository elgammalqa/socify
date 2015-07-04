class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content

  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }

  mount_uploader :attachment, AvatarUploader
end
