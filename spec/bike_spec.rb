require 'bike'

describe Bike do

  describe '#working' do

    it { is_expected.to respond_to :working? }

    it 'returns true if bike is working' do
      # expect(subject.working?).to be_true
      expect(subject).to be_working
    end
  end
end
