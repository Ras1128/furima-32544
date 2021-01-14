FactoryBot.define do
  factory :order_address do
    post_code         {"123-4567"}
    shipping_area_id  {3}
    city              {"かかか"}
    address           {"価格345-76"}
    building_name     {"母"}
    phone_number      {"1234567890"}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
