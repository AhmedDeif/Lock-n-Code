class User < ActiveRecord::Base
	mount_uploader :profilePicture, ImageUploader
	validates :email , :password, :fisrt_name, :last_name, presence: true
    def self.authenticate(email,password)
        user = find_by_email(email)
        if user && user.password == password
            user
         else
            nil
        end
    end

    def self.unique_email(email)
    	user = find_by_email(email)
    	if user
    		user
    	else
    		nil
    	end
    end

end
