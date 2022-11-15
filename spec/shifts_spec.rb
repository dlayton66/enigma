require './lib/shifts'

RSpec.describe Shifts do
  let(:shifts) { Shifts.new(nil,nil) }

  it 'exists' do
    expect(shifts).to be_a Shifts
  end

  it 'can take 2 arguments for key and date' do
    shifts1 = Shifts.new("02715","040895")
    expect(shifts1.keys.key).to eq "02715"
    expect(shifts1.offsets.date).to eq "040895"
  end

  it 'passes nil arguments through to Keys and Offsets' do
    shifts2 = Shifts.new(nil,"040895")
    expect(shifts2.keys.key).to be_a String
    expect(shifts2.offsets.date).to eq "040895"

    shifts3 = Shifts.new("02715",nil)
    expect(shifts3.keys.key).to eq "02715"
    expect(shifts3.offsets.date).to be_a String
  end

  describe '#all' do
    it 'returns an array with keys and offsets added together' do
      expect(shifts.all[1]).to eq(shifts.keys.all[1]+shifts.offsets.all[1])
      expect(shifts.all[3]).to eq(shifts.keys.all[3]+shifts.offsets.all[3])
    end
  end

  describe '#raw_shifts' do
    it 'is how many spaces we shift on our 27-character set' do
      expect(shifts.all[2] % 27).to eq shifts.raw_shifts[2]
      expect(shifts.all[3] % 27).to eq shifts.raw_shifts[3]
    end
  end
end