require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to belong_to(:user) }
  it {
    is_expected.to define_enum_for(:status).with_values([:active, :inactive])
  }
end
