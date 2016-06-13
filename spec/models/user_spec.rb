require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'admin user' do
    it '管理者が登録できる。' do
      role_admin = create(:role_admin)
      admin      = User.new(
        name:     'Admin',
        email:    'admin@example.com',
        password: 'PASSWORD',
        role:     role_admin
      )
      expect(admin).to be_valid
      admin.save

      user = User.all
      expect(user.size).to eq(1)
      expect(user[0].name).to eq('Admin')
      expect(user[0].email).to eq('admin@example.com')
      expect(user[0].password).to eq('PASSWORD')
      expect(user[0].role.name).to eq('admin')
    end
    it '管理者が複数登録できる。' do
      role_admin = create(:role_admin)
      create(:admin, role: role_admin, name: '管理者１')
      create(:admin, role: role_admin, name: '管理者２', email: 'admin2@example.com')
      create(:admin, role: role_admin, name: '管理者３', email: 'admin3@example.com')

      users = User.all
      expect(users.size).to eq(3)
      expect(users[0].name).to eq('管理者１')
      expect(users[1].name).to eq('管理者２')
      expect(users[2].name).to eq('管理者３')

      expect(users[0].role.name).to eq('admin')
      expect(users[1].role.name).to eq('admin')
      expect(users[2].role.name).to eq('admin')
    end
  end

  describe 'general user' do
    it '一般ユーザが登録できる。' do
      create(:user, role: create(:role_user))

      users = User.all
      expect(users.size).to eq(1)
      expect(users[0].name).to eq('User-1')
      expect(users[0].role.name).to eq('general_user')
    end

    it '一般ユーザーが複数登録できる。' do
      user_role = create(:role_user)
      create(:user, role: user_role)
      create(:user, role: user_role)
      create(:admin, role: create(:role_admin))
      create(:user, role: user_role)

      users = User.all
      expect(users.size).to eq(4)
      expect(users[0].name).to eq('User-2')
      expect(users[1].name).to eq('User-3')
      expect(users[3].name).to eq('User-4')
    end
  end

  context 'バリデート: ' do
    let(:role_user) do
      create(:role_user)
    end
    it '権限は必須である。' do
      user = build(:user, role: nil)
      expect(user).not_to be_valid
      expect(user.errors[:role]).to eq([I18n.t('errors.messages.blank')])
    end

    it 'nameは必須である。' do
      user = build(:user, name: nil, role: role_user)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.blank')])
    end
    it 'emailは必須である。' do
      user = build(:user, email: nil, role: role_user)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to eq([I18n.t('errors.messages.blank')])
    end
    it 'passwordは必須である。' do
      user = build(:user, password: nil, role: role_user)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to eq([I18n.t('errors.messages.blank')])
    end

    it "nameは#{User.validators_on(:name)[0].options[:minimum]}以上である。" do
      user = build(:user, name: 'a' * 2, role: role_user)
      expect(user).to be_valid
      expect(user.name.length).to be >= (User.validators_on(:name)[0].options[:minimum].to_i)
      expect(user.errors[:name]).to eq([])

      user = build(:user, name: 'a', role: role_user)
      expect(user).not_to be_valid
      expect(user.name.length).not_to be >= (User.validators_on(:name)[0].options[:minimum].to_i)
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.too_short', count: User.validators_on(:name)[0].options[:minimum])])
    end

    it "nameは#{User.validators_on(:name)[0].options[:maximum]}以下である。" do
      user = build(:user, name: 'a' * 64, role: role_user)
      expect(user).to be_valid
      expect(user.name.length).to be <= (User.validators_on(:name)[0].options[:maximum].to_i)
      expect(user.errors[:name]).to eq([])

      user = build(:user, name: 'a' * 65, role: role_user)
      expect(user).not_to be_valid
      expect(user.name.length).not_to be <= (User.validators_on(:name)[0].options[:maximum].to_i)
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.too_long', count: User.validators_on(:name)[0].options[:maximum])])
    end

    it 'nameは一意である。' do
      me = create(:user, name: 'My name is only one.', email: 'right@me.ex', role: role_user)
      expect(me).to be_valid
      user = build(:user, name: 'My name is only one.', email: 'bad@not.me', role: role_user)

      expect(user).not_to be_valid
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.taken')])
    end

    it "nameの書式は#{User.validators_on(:name)[1].options[:with]}である。" do
      user = build(:user, name: 'a<', role: role_user)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.invalid')])

      user = build(:user, name: 'a>', role: role_user)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to eq([I18n.t('errors.messages.invalid')])
    end
  end
end
