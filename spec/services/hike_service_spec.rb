
require 'rails_helper'
require 'pry'

RSpec.describe HikeService do
  it "returns all hikes information" do
    
    search = HikeService.get_hikes
    expect(search).to be_a Hash
  end
end