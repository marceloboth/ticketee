class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :assets

  accepts_nested_attributes_for :assets

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

<<<<<<< HEAD
=======
  belongs_to :project
  belongs_to :user

  mount_uploader :asset, AssetUploader
>>>>>>> e93d9cd55d4bf5cbaff47feae4d9a01e58c7933b

end
