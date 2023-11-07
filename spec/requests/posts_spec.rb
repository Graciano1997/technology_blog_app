describe "GET user 's posts /" do
  it "should return a successfull response" do
  get '/users/2/posts'
  expect(response).to be_successful
  end

  it "should return a successfull response" do
  get '/users/2/posts/1000'
  expect(response).to be_successful
  end
end