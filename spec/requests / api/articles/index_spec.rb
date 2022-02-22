RSpec.describe 'GET /api/articles', type: :request do
  # ARRANGE
  let!(:articles) { create_list(:articles, 5) }

  before do
    # ACT
    get '/api/articles'
  end

  subject { response }

  # ASSERT
  it 'is expected to respond with status code 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to return a collection of 5 articles' do
    expect(response_json['articles'].size).to eq 5
  end
end
