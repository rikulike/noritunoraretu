class WisdomPost < ApplicationRecord
  has_one_attached :wisdom_post_image
  belongs_to :young_user  
  has_many :wisdom_post_comments, dependent: :destroy
  has_many :rooms, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  
  
  def get_wisdom_post_image(width, height)
    unless wisdom_post_image.attached?
      file_path= Rails.root.join('app/assets/images/no_image.jpg')
      wisdom_post_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
      wisdom_post_image.variant(resize_to_limit: [width,height]).processed
  end
  
  def self.search_for(content,method)
    if method == 'perfect'
      WisdomPost.where(title: content)
    elsif method == 'forward'
      WisdomPost.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      WisdomPost.where('title LIKE ?', '%'+content)
    else
      WisdomPost.where('title LIKE ?', '%'+content+'%')
    end
  end
        
      
      
end
