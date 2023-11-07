describe "Render User's GET Routes " do
  it "Should renders a successful response" do
    get '/'
    expect(response).to be_successful
  end

  it "Should renders a successful response" do
    get users_url
    expect(response).to be_successful
  end

   it "Should render a successful response for a given user's id " do
     get users_url(20)
     expect(response).to be_successful
   end
end