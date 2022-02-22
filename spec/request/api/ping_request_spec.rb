RSpec.describe 'GET /api/pings', type: :request do
  it 'is expected to return a pong message' do
    get '/api/pings'
    expect(response_json['message']).to eq 'pong'
  end
end