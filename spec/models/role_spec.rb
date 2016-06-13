require 'rails_helper'

RSpec.describe Role, type: :model do
  context '権限' do
    it '管理者権限がある。' do
      role_admin = create(:role_admin)
      role       = Role.all
      expect(role.size).to eq(1)
      expect(role[0].name).to eq('admin')
      expect(role[0].display_name).to eq('管理者')
      expect(role[0]).to eq(role_admin)
    end
    it '一般ユーザー権限がある。' do
      role_user = create(:role_user)
      role      = Role.all

      expect(role.size).to eq(1)
      expect(role[0].name).to eq('general_user')
      expect(role[0].display_name).to eq('一般ユーザー')
      expect(role[0]).to eq(role_user)
    end

    it '各権限は、データベースに１つずつしか作られない。' do
      role_admin = create(:role_admin)
      role_user  = create(:role_user)
      role       = Role.all

      expect(role.size).to eq(2)

      create(:role_admin)
      create(:role_user)
      role.reload

      expect(role.size).to eq(2)
      expect(role[0]).to eq(role_admin)
      expect(role[1]).to eq(role_user)
      expect(role[2]).to eq(nil)
    end
  end
end
