require "rails_helper"

describe "Api::Posts", type: :request do
  describe "GET 'index'" do
    let(:posts) { create_list(:post, 5)}

    it 'gives a success JSON response' do
      get api_v1_posts_path, format: :json 
      expect(response).to be_success
    end

    it 'renders the JSON stories' do
      get api_v1_posts_path, format: :json

      expect(response.status).to eq(200) 
      expect(response).to match_response_schema("posts")
    end
  end

  describe "GET 'show'" do
    let(:post) { create(:post) }

    it 'gives a success JSON response' do
      get api_v1_post_path(post.id)
      expect(response).to be_success
    end

    it 'renders the JSON story' do
      
    end
  end
end
