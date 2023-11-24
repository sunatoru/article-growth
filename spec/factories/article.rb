FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    # 画像のファイルパスを指定してアタッチ
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'niji.jpeg') # 画像ファイルのパスを指定
      )
    end
    association :user
  end
end
