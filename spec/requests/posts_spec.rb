describe "GET user 's posts /" do
  it 'should return a successfull response' do
    get '/users/2/posts'
    expect(response).to be_successful
  end

  it 'should match a given user posts' do
    get '/users/2/posts'
    expect(response.body).to include("Your User's 2 Posts")
  end

  it 'should return a 200 response status' do
    get '/users/2/posts'
    expect(response.status).to eq(200)
  end

  it 'should return a 200 response status' do
    get '/users/2/posts/GracianoManuelHenrique/1997'
    expect(response.status).not_to eq(200)
  end

  it 'should render the index template' do
    get '/users/2/posts/'
    expect(response).to render_template('posts/index')
  end

  it 'should return a successfull response' do
    get '/users/2/posts/1000'
    expect(response).to be_successful
  end

  it 'should render the show template' do
    get '/users/2/posts/1000'
    expect(response).to render_template('posts/show')
  end

  it 'should not contain <<<Microsoft>>' do
    get '/users/2/posts/1000'
    expect(response.body).not_to include('Hello Microsoft 👋 !, How is Bill Gate now ? ')
  end
end
