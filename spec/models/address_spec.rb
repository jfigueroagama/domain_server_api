require 'rails_helper'

RSpec.describe Address, type: :model do
  before(:all) do
    @address1 = create(:address)
  end
  # Validate ip address
  it { should validate_presence_of(:ip_address) }

  it "is valid with valid ip address" do
    expect(@address1).to be_valid
  end
end
