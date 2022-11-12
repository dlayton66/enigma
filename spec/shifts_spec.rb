require './lib/shifts'

RSpec.describe Shifts do
  let(:shifts) { Shifts.new }

  it 'exists' do
    expect(shifts).to be_a Shifts
  end

  it 'can take 1 argument for master_key' do
    shifts_one_arg = Shifts.new("02715")

    expect(shifts_one_arg.keys.master_key).to eq "02715"
  end

  it 'can take 2 arguments for master_key and date' do
    shifts_two_arg = Shifts.new("02715","040895")

    expect(shifts_two_arg.keys.master_key).to eq "02715"
    expect(shifts_two_arg.offsets.master_offset).to eq "1025"
  end

  describe '#calculate_shifts' do
    it 'returns an array with keys and offsets added together' do
      expect(shifts.digits[1]).to eq(shifts.keys.digits[1]+shifts.offsets.digits[1])
      expect(shifts.digits[3]).to eq(shifts.keys.digits[3]+shifts.offsets.digits[3])
    end
  end
end