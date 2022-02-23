RSpec.describe 'GET /api/articles/:id' do
  # ARRANGE
  let!(:article) { create(:article, title: 'Article 1', body: 'My text') }
  let!(:another_article) { create(:article, title: 'Article 2') }
  # ACT
  before do
    get "/api/articles/#{article.id}"
  end

  subject { response }
  # ASSERT
  it { is_expected.to have_http_status 200 }

  it 'is expected to include article title' do
    expect(response_json['article']['title']).to eq 'Article 1'
  end

  it 'is expected to include article body' do
    expect(response_json['article']['body']).to eq 'My text'
  end

  it 'is expected to include the right article title' do
    expect(response_json['article']['title']).not_to eq 'Article 2'
  end
end
