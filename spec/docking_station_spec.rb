require 'docking_station'

describe DockingStation do

  let(:station) { described_class.new }
  let(:bike) { Bike.new }
  let(:capacity) { described_class::DEFAULT_CAPACITY }

  # before :each do
  # end

  it { is_expected.to respond_to(:bikes) }

  describe '#release_bike' do

    it { is_expected.to respond_to(:release_bike) }

    it 'throws an error when no bikes available' do
      expect { station.release_bike }.to raise_error("No bikes available")
    end

    it 'returns a bike' do
      station.dock(bike)
      bike = station.release_bike
      expect(bike).to be_working
    end

  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      station.dock(bike)
      expect(station.bikes).to include(bike)
    end

    it 'has default capacity of 20' do
      expect(described_class::DEFAULT_CAPACITY).to eq(20)
    end

    it 'throws an error when capacity exceeded' do
      capacity.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error("Full capacity!")
    end
  end

end
