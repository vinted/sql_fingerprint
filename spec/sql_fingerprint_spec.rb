# frozen_string_literal: true

RSpec.describe SqlFingerprint do
  describe '.calculate' do
    subject { described_class.calculate(query) }

    let(:query) { 'SELECT * FROM test WHERE id=1' }
    let(:fingerprint) { 'dd1d44f7cffa757aad5152a27b811d6735ef6661' }

    it { is_expected.to eq(fingerprint) }
  end
end
