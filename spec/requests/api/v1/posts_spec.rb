require 'rails_helper'

describe Api::V1::PostsController, :type => :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET 'index'" do
    before :each do
      @posts = create_list :post, 5
    end

    it 'should list posts' do
      get '/api/v1/posts/list', format: :json
      expect(json.length).to eql(5)
    end
  end

  describe "GET 'show'" do
    before :each do
      @post = create :post
    end

    it 'should find a single post' do
      get "/api/v1/posts/find/#{@post.id}"
      expect(json['title']).to eq(@post.title)
    end
  end

  describe "POST 'create'" do
    it 'should create a post' do
      post '/api/v1/posts/create', post: {title: "Title here"}
      expect(json['title']).to eq("Title here")
    end
  end

  describe "PUT 'update'" do
    before :each do
      @post = create :post, title: "Rails"
    end

    it "should update post" do
      put "/api/v1/posts/update/#{@post.id}", post: {title: "ROR"}
      expect(json['title']).to eq("ROR")
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      @post = create :post
    end

    it "should delete post" do
      delete "/api/v1/posts/delete/#{@post.id}" 
      expect(Post.where(id: @post.id)).to be_empty
    end
  end

end
