require 'rails_helper'

RSpec.describe "MediaResources", type: :request do
  describe "GET /media_resources" do
    it "displays a single resource" do
      get media_resource_path(create(:media_resource))
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /media_resources" do
    it "redirects to #show after a media resource was created" do
      get new_media_resources_path
      expect(response).to have_http_status(200)

      assert_select "form.new_media_resource" do
        assert_select "input[name=?]", 'media_resource[name]'
        assert_select "input[name=?]", 'media_resource[description]'
        assert_select "input[name=?]", 'media_resource[url]'
        assert_select "input[name=?]", 'media_resource[fields][]'
      end
      
      @media_resource = attributes_for(:media_resource)
      post new_media_resources_path, params: { media_resource: @media_resource}
      assert_redirected_to media_resource_path(assigns(:media_resource))
    end
  end
end
