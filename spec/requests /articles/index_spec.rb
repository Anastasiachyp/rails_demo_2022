RSpec.describe 'GET /api/articles', type: :request do
  before do
    get '/api/articles'
  end

  subject { response }

  it 'is expected to respond with status code 200' do
    expect(subject.status).to eq 200
  end
end
