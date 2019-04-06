require 'rails_helper'

RSpec.describe "Post controller", :type => :request do
  describe "GET #index" do
    before do
      FactoryBot.create :post_1
      FactoryBot.create :post_2
    end

    it "returns http success" do
      get "/posts/index"
      expect(response.status).to eq 200
      #expect(response).to have_http_status(:success)
    end

    it "ポストの名前が表示されていること" do
      get "/posts/index"
      expect(response.body).to include "This is first post."
      expect(response.body).to include "2nd Post"
    end
  end

  describe "GET #edit" do
    let(:post_1) { FactoryBot.create :post_1 }
    it "returns http success" do
      # パスの直接指定はSyntax Errorとなるため、名前付きヘルパーを使用
      get posts_edit_url post_1
      expect(response.status).to eq 200
    end
    it "ポストの名前が表示されていること" do
      get posts_edit_url post_1
      expect(response.body).to include "This is first post."
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get "/posts/new"
      expect(response.status).to eq 200
    end
    # フォームからPostを作成するテストはfeature specとする
  end

  describe "POST #create" do
    describe "正常系" do
      it "returns http success" do
        post posts_create_url, params: { post: FactoryBot.attributes_for(:post) }
        expect(response.status).to eq 302
      end
      it "ポストが登録されること" do
        expect do
          post posts_create_url, params: { post: FactoryBot.attributes_for(:post) }
        end.to change(Post, :count).by(1)
      end
      it "is redirected to #index" do
        post posts_create_url, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to Post.last # どのページを期待？
      end
    end

    describe "異常系" do
      it "returns http success" do
        post posts_create_url, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        expect(response.status).to eq 302
      end
      it "ポストが登録されないこと" do
        expect do
          post posts_create_url, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        end.to_not change(Post, :count) # change().by(0)でもいい？
      end
      it "renders the :new template" do
        post posts_create_url, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        expect(response).to redirect_to :new # この書き方でいい？
      end
      it "エラーが表示されること" do
        post posts_create_url, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        expect(response.body).to include '名前は255文字以内で入力してください。'
      end
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
