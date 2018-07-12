class Maker < ActiveRecord::Base
    has_many :works
    
    #이름은 반드시 있어야 하고, 두 글자 이상
    #이메일은 반드시 있어야 하고, 세 글자 이상
    #폰넘버는 반드시 있어야 하고, 최소 8글자 이상
    validates :name,
        presence: true, length: {minimum: 2}
        
    validates :phone_number,
        presence: true, length: {minimum: 8}
        
    validates :email,
        presence: true, length: {minimum: 3},
        format: {with: /\A[^@\s]+@[^@\s]+\z/}
end
