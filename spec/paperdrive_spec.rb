# frozen_string_literal: true

RSpec.describe Paperdrive do
  it 'has a version number' do
    expect(Paperdrive::VERSION).not_to be nil
  end

  it '1+1 = ?' do
    expect(1 + 1).to eq(2)
  end
end
