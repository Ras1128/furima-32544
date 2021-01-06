FactoryBot.define do
  factory :product do

    name              {"かか"}
    description       {"かかか"}
    price             {400}
    category_id       {2}
    item_condition_id {2}
    postage_id        {2}
    shipping_area_id  {2}
    shipping_day_id   {2}
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
