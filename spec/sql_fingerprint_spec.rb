# frozen_string_literal: true

RSpec.describe SqlFingerprint do
  describe '.calculate' do
    subject { described_class.calculate(query) }

    let(:fingerprint) { 'dd1d44f7cffa757aad5152a27b811d6735ef6661' }

    context 'when id equals 1' do
      let(:query) { 'SELECT * FROM test WHERE id=1' }
      it { is_expected.to eq(fingerprint) }
    end

    context 'when id equals 2' do
      let(:query) { 'SELECT * FROM test WHERE id=2' }
      it { is_expected.to eq(fingerprint) }
    end

    context 'with quotes' do
      let(:query) { 'SELECT * FROM test WHERE id="1"' }
      it { is_expected.to eq(fingerprint) }
    end

    context 'with comment' do
      let(:query) { 'SELECT * FROM test WHERE id=1 /* comment */' }
      it { is_expected.to eq(fingerprint) }
    end

    context 'with newlines and spaces' do
      let(:query) { "SELECT * \n\n  FROM test WHERE id=1" }
      it { is_expected.to eq(fingerprint) }
    end
  end
end
