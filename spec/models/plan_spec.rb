require 'spec_helper'

describe Plan do
  it 'requires a unique name' do
    expect(build( :plan, name:      nil)).to_not     be_valid
    expect(create(:plan, name: 'Plan A')).to         be_valid
    expect(build( :plan, name: 'Plan A')).to_not     be_valid
    expect(create(:plan, name: 'Plan B')).to         be_valid
  end

  it 'requires a numeric price greater than or equal to 0.00' do
    expect(build(:plan, price:   nil)).to_not     be_valid
    expect(build(:plan, price: -1.00)).to_not     be_valid
    expect(build(:plan, price:  0.00)).to         be_valid
    expect(build(:plan, price:  1.00)).to         be_valid
  end
end
