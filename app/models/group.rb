class Group < ApplicationRecord
  has_one_attached :group_image
  has_many :group_young_users, dependent: :destroy
  has_many :young_users, through: :group_young_users, source: :young_user

  def get_group_image(width, height)
    unless group_image.attached?
      file_path= Rails.root.join('app/assets/images/no_image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    group_image.variant(resize_to_limit: [width,height]).processed
  end

  def is_owned_by?(young_user)
    owner_id == young_user.id
  end

  def includes_young_user?(young_user)
    group_young_users.exists?(young_user_id: young_user.id)
  end
end
