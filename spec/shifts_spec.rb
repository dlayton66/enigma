require './lib/shifts'

RSpec.describe Shifts do
  let(:shifts) { Shifts.new(nil,nil) }

  it 'exists' do
    expect(shifts).to be_a Shifts
  end

  it 'can take 2 arguments for seed and date_seed' do
    shifts1 = Shifts.new("02715","040895")
    expect(shifts1.seed).to eq "02715"
    expect(shifts1.date_seed).to eq "040895"

    shifts2 = Shifts.new(nil,"040895")
    expect(shifts2.seed).to be nil
    expect(shifts2.date_seed).to eq "040895"

    shifts3 = Shifts.new("02715",nil)
    expect(shifts3.seed).to eq "02715"
    expect(shifts3.date_seed).to be nil

  end

  describe '#raw_shifts' do
    it 'returns an array with keys and offsets added together' do
      expect(shifts.raw_shifts[1]).to eq(shifts.keys.digits[1]+shifts.offsets.digits[1])
      expect(shifts.raw_shifts[3]).to eq(shifts.keys.digits[3]+shifts.offsets.digits[3])
    end
  end

  describe '#digits' do
    it 'is how many spaces we shift on our 27-character set' do
      expect(shifts.raw_shifts[2] % 27).to eq shifts.digits[2]
      expect(shifts.raw_shifts[3] % 27).to eq shifts.digits[3]
    end
  end
end