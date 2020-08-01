require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do
    it { should validate_presence_of(:title) }

  end

  describe "Assosiations" do
    it { should belong_to(:category) }
  end

end
