class User < ActiveRecord::Base
	mount_uploader :profilePicture, ImageUploader
    def self.authenticate(email,password)
        user = find_by_email(email)
        if user && user.password == password
            user
         else
            nil
        end
    end
end
