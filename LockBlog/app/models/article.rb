class Article < ActiveRecord::Base
	 default_scope -> { order(created_at: :desc) }
    validates :title, presence: true,
    length: { minimum: 5 }
    validates :text, presence: true,
    length: { minimum: 5 }

    has_many :comments


    mount_uploader :image, ImageUploader

end
