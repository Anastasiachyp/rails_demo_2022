RSpec.describe 'POST /api/articles' do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }

  subject { response }

  describe 'with valid params' do
    before do
      post '/api/articles', params: {
        article: {
          title: 'News about coding',
          body: 'Lorem ipsum...',
          image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA0oAAAJHCAYAAACu'
        }
      }, headers: credentials

      @article = Article.last
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to attach an image to the new article' do
      expect(@article.image.attached?).to eq true
    end

    it 'is expected to attach an image to the new article' do
      expect(@article.image).to be_attached
    end
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
