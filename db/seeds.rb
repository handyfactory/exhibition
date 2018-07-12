#csv 파일 조작했던 기억을 더듬어...
require 'csv'

file = File.read('43dp.csv')
makers = CSV.parse(file, headers: true) #header가 있어 그러니 무시해라 header: true

makers.each do |maker|
    Maker.create(
        name: maker[1],
        email: maker[3],
        phone_number: maker[2]
        )
end

User.create(
    email: "admin@admin.com",
    password: "12341234",
    password_confirmation: "12341234",
    is_admin?: true
    )