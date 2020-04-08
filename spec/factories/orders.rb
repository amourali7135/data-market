FactoryBot.define do
  factory :order do
    state { "MyString" }
    teddy_sku { "MyString" }
    amount { "" }
    checkout_session_id { "MyString" }
    user { nil }
    teddy { nil }
  end
end
