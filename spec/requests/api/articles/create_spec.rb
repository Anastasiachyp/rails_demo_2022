RSpec.describe 'POST /api/articles' do
  before do
    post '/api/articles', params: {
      article: { title: 'News about coding', body: 'Lorem ipsum...' }
    }
  end

  subject { response }

  it { is_expected.to have_http_status 201 }

  it 'is expected to create an instance of an Article' do
    expect(Article.last).not_to be nil
  end
  it 'is expected to have a title' do
    expect(Article.last.title).to eq 'News about coding'
  end
  it 'is expected to have a body' do
    expect(Article.last.body).to eq 'Lorem ipsum...'
  end
end
