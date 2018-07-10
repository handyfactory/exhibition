class Work < ActiveRecord::Base
    mount_uploader(:image, ImageUploader)
    
    belongs_to :maker
end
