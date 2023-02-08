require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/static/index"
      expect(response).to have_http_status(:success)
    end
  end
  require 'rails_helper'

  RSpec.describe 'Static content', type: :system do
    it 'shows the static text' do
      visit static_index_path
      expect(page).to have_content('Hello world')
    end
  end
end
