require 'rails_helper'

RSpec.describe "Post controller", :type => :request do
  describe "GET #index" do
    it "returns http success" do
      get "/posts/index"
      expect(response).to have_http_status(:success)
    end
    it "renders the :index template"
  end

  describe "GET #edit" do
    it "returns http success" do
      get "/posts/edit"
      expect(response).to have_http_status(:success)
    end
    it "renders the :edit template"
  end

  describe "GET #new" do
    it "returns http success" do
      get "/posts/new"
      expect(response).to have_http_status(:success)
    end
    it "renders the :new template"
  end

  describe "POST #create" do
    describe "正常系" do
      it "is redirected to #index"
    end

    describe "異常系" do
      it "renders the :new template"
    end
  end

  describe "PATCH #update" do
    describe "正常系" do
      it "is redirected to #index"
    end

    describe "異常系" do
      it "renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "is redirected to #index"
  end
end
