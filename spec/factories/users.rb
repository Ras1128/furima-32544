FactoryBot.define do

  factory :user do
    nickname                    { "ras" }
    email                       {Faker::Internet.free_email}
    password                    {"aaaa11"}
    password_confirmation       {password}
    first_name                  {"瞭"}
    family_name                 {"村岡"}
    first_name_kana             {"リョウ"}
    family_name_kana            {"ムラオカ"}           
    birth_day                   {"1995-11-28"}
  end
end