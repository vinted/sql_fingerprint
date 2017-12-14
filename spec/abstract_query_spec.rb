# frozen_string_literal: true

RSpec.describe SqlFingerprint::AbstractQuery, '.build' do
  subject { described_class.build(query) }

  let(:expected_query) { 'select * from test where id=?' }

  context 'when id equals 1' do
    let(:query) { 'SELECT * FROM test WHERE id=1' }
    it { is_expected.to eq(expected_query) }
  end

  context 'when id equals 2' do
    let(:query) { 'SELECT * FROM test WHERE id=2' }
    it { is_expected.to eq(expected_query) }
  end

  context 'with quotes' do
    let(:query) { 'SELECT * FROM test WHERE id="1"' }
    it { is_expected.to eq(expected_query) }
  end

  context 'with comment' do
    let(:query) { 'SELECT * FROM test WHERE id=1 /* comment */' }
    it { is_expected.to eq(expected_query) }
  end

  context 'with newlines and spaces' do
    let(:query) { "SELECT * \n\n  FROM test WHERE id=1" }
    it { is_expected.to eq(expected_query) }
  end

  context 'with offset' do
    let(:query) { 'SELECT * FROM test WHERE id=1 LIMIT 10 OFFSET 5' }
    it { is_expected.to eq('select * from test where id=? limit ?') }
  end

  context 'with short offset syntax' do
    let(:query) { 'SELECT * FROM test WHERE id=1 LIMIT 10, 5' }
    it { is_expected.to eq('select * from test where id=? limit ?') }
  end
end
