RSpec.describe 'POST /api/articles' do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  subject { response }

  describe 'with valid params' do
    before do
      post '/api/articles', params: {
        article: { title: 'News about coding', body: 'Lorem ipsum...' }
      }, headers: credentials
    end
    it { is_expected.to have_http_status 201 }
  end
  describe 'without valid params' do
    before do
      post '/api/articles', params: {
        article: { title: 'News about coding', body: 'Lorem ipsum...' }
      }, headers: nil
    end
    it { is_expected.to have_http_status 401 }
  end
end
