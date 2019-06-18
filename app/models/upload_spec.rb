require 'rails_helper'

RSpec.describe Upload, :type => :model do
  it "is valid with valid attributes" do
    expect(Upload.new).to be_valid
  end

  it "is not valid without a title"
  it "is not valid without a description"
  it "is not valid without a start_date"
  it "is not valid without a end_date"
end