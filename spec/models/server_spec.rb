require 'rails_helper'

RSpec.describe Server, type: :model do
  before(:all) do
    @server1 = create(:server)
  end
  # Validation tests
  it { should validate_presence_of(:server_name) }
end
