require 'rails_helper'

RSpec.describe 'GET /users/:id', type: :request do
  let(:description) { 'ユーザ情報表示' }
  let!(:user) { create(:user, role: create(:role_admin)) }
  let!(:id) { user.id }

  context 'with valid id' do
    it 'ユーザの情報が取得できる', autodoc: true do
      is_expected.to eq 200
      expect(JSON.parse(response.body)).to eq('id'       => user.id,
                                              'name'     => user.name,
                                              'email'    => user.email,
                                              'password' => user.password
                                           )
    end
  end
end
# RSpec.describe 'Users', type: :request do
#   describe 'GET users/1' do
#     # 簡単のためこのようにしていますが、データ投入にはFixturesやFactoryGirlを使ってください
#     let!(:user) { create(:user, role: create(:role_admin)) }
#     let!(:id) { user.id }
#     it 'ユーザの情報が取得できる' do
#     p  Role.all
#     p  User.all
#       get "/users/#{id}"
#
#       expect(response).to have_http_status(:ok)
#       # expect(response.body).to be_json_as(
#       #                            id: id,
#       #                            name: 'otyoppu',
#       #                            mail: 'otyoppu@example.com',
#       #                            password: 'xxxxxxxxxx'
#       #                          )
#     end
#   end
# end
