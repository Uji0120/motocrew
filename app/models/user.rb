class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :post, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :chat, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :likes, dependent: :destroy
  
  has_many :rooms, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  
  def active_for_authentication?
    super && (is_delete == false)
  end
    
  # has_many :user_rooms
  # has_many :chats
  
  # def get_user_image(width, height)
    # unless user_image.attached?
      # file_path = Rails.root.join('app/assets/images')
      # user_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'no_image/jpeg')
    # end
    # user_image.variant(resize_to_limit: [width, height]).processed
  # end
  
  
  
end
