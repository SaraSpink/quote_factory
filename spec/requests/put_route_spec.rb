describe "post a quote with exceptions", :type => :request do

  before do
    put '/quotes/:id', params: { :author => nil, :content => 'test_content' }
  end

  it 'returns exception' do
    expect(response).to have_http_status(:not_found)
  end
end
