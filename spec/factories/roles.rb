FactoryGirl.define do
  factory :role_admin, class: Role do |r|
    r.name 'admin'
    r.display_name '管理者'
    r.initialize_with { Role.find_or_create_by(name: name) }
  end

  factory :role_user, class: Role do |r|
    r.name 'general_user'
    r.display_name '一般ユーザー'
    r.initialize_with { Role.find_or_create_by(name: name) }
  end
end
