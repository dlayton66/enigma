require './lib/shifts'

RSpec.describe Shifts do
  let(:shifts) { Shifts.new }

  it 'exists' do
    expect(shifts).to be_a Shifts
  end  

  describe '#calculate_shifts' do
    it 'returns an array with keys and offsets added together' do
      expect(shifts.digits[1]).to eq(shifts.keys.digits[1]+shifts.offsets.digits[1])
      expect(shifts.digits[3]).to eq(shifts.keys.digits[3]+shifts.offsets.digits[3])
    end
  end
end