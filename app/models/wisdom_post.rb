class WisdomPost < ApplicationRecord
  belongs_to :young_user  
  has_many :wisdom_post_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  
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
