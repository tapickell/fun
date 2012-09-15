require_relative '../../lib/shuffled_string'

describe ShuffledString do
  subject { described_class.new shuffled_string }

  let(:str1) { 'asdf' }
  let(:str2) { 'awer' }
  let(:shuffled_string) { 'asadwefr' }

  it 'can detect if the string has been shuffled by a given set of strings' do
    subject.shuffled_from?(str1, str2).should be_true
    subject.shuffled_from?(str1, 'qwir').should be_false
    subject.shuffled_from?(str1, 'awera').should be_false
    subject.shuffled_from?(str1, 'aw', 'er').should be_true
    subject.shuffled_from?(str1, 'aw', 'aer').should be_false
  end
end
