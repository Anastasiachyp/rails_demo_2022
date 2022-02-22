RSpec.describe Api::PingsController do
  it 'is expected to return a pong message' do
    get '/api/pings'
    expect(response_json['message']).to eq 'pong'
  end
end