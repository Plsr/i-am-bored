require 'rails_helper'

RSpec.describe MediaResource, type: :model do
  it 'should save a valid resource' do
    valid_resource = build(:media_resource)
    expect(valid_resource).to be_valid
  end

  it 'should not save a MediaResource without a name' do
    nameless_resource = build(:media_resource, name: nil)
    expect(nameless_resource).to_not be_valid
  end 

  it 'should not save a MediaResource without an url' do
    no_url_resource = build(:media_resource, url: nil)
    expect(no_url_resource).to_not be_valid
  end

  it 'should not save a MediaResource without at least one field' do
    fieldless_resource = build(:media_resource, fields: [])
    expect(fieldless_resource).to_not be_valid
  end 

  it 'should not save a resource with a malformed url' do
    malformed_url_resource = build(:media_resource, url: 'httsp :// google. de')
    expect(malformed_url_resource).to_not be_valid
  end
end
