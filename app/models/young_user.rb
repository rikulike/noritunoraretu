class YoungUser < ApplicationRecord
  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wisdom_posts, dependent: :destroy
  has_many :wisdom_post_comments, dependent: :destroy
  has_many :group_young_users, dependent: :destroy
  has_many :noritu_favorites, dependent: :destroy
  has_many :rooms, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true

  GUEST_YOUNG_USER_EMAIL= "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_YOUNG_USER_EMAIL) do |young_user|
      young_user.password= SecureRandom.urlsafe_base64
      young_user.name= "guestuser"
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      YoungUser.where(name: content)
    elsif method == 'forward'
      YoungUser.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      YoungUser.where('name LIKE ?', '%' + content)
    else
      YoungUser.where('name LIKE ?', '%' + content + '%')
    end
  end
end

