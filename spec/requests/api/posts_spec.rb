require "rails_helper"

describe "Api::Posts", type: :request do
  describe "GET 'index'" do
    let(:posts) { create_list(:post, 5)}

    it 'gives a success JSON response' do
      get api_v1_posts_path 
      expect(response).to be_success
    end

    it 'renders the JSON stories' do
      get api_v1_posts_path 
      expect(response).to match_json_schema(:song_schema)
    end
  end
end