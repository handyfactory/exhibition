class Work < ActiveRecord::Base
    mount_uploader(:image, ImageUploader)
    validates_presence_of :image #carrierwave를 통해 검증
    
    belongs_to :maker
    
    #유효성 검증을 할거야
    validates :title,
        presence: true #얘도 메쏘드야
    
    validates :desc,
        presence: true, length: {minimum: 3}
        
    # validates :image,
    #     presence: true
end
