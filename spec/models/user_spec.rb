require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:quotes) }
  it { should have_many(:bookmarks) }

  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:provider)}
  it {should validate_presence_of(:unique_id)}
end
