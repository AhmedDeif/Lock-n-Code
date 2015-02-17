class Article < ActiveRecord::Base
    validates :title, presence: true,
    length: { minimum: 5 }
    validates :text, presence: true,
    length: { minimum: 5 }
    has_many :comments
    mount_uploader :image, ImageUploader
end
