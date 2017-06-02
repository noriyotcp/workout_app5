require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  xdescribe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
