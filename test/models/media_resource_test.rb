require 'test_helper'

class MediaResourceTest < ActiveSupport::TestCase
  test 'should not save a MediaResource without a name' do
    media_resource = MediaResource.new
    media_resource.description = 'This is the description'
    media_resource.url = 'http://google.de'
    media_resource.fields = ['programming', 'testing']
    media_resource.unconsumed = true
    assert_not media_resource.save, "Saved a MediaResource without a name"
  end

  test 'should not save a MediaResource without an url' do
    media_resource = MediaResource.new
    media_resource.name = 'My Resource'
    media_resource.description = 'This is the description'
    media_resource.fields = ['programming', 'testing']
    media_resource.unconsumed = true
    assert_not media_resource.save, "Saved a MediaResource without an url"
  end

  test 'should not save a MediaResource without at least one field' do
    media_resource = MediaResource.new
    media_resource.name = 'My Resource'
    media_resource.description = 'This is the description'
    media_resource.url = 'http://google.de'
    media_resource.unconsumed = true
    assert_not media_resource.save, "Saved a MediaResource without any fields"
  end

  test 'should not save a MediaResource with an invalid url' do
    media_resource = MediaResource.new
    media_resource.name = 'My Resource'
    media_resource.description = 'This is the description'
    media_resource.url = 'httsp :// google. de'
    media_resource.fields = ['programming', 'testing']
    media_resource.unconsumed = true
    assert_not media_resource.save, "Saved a MediaResource with an invalid url"
  end
end
