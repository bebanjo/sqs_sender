require 'spec_helper'

describe Emaa::Config do
  describe 'options' do
    subject(:options) { described_class.instance.options }

    it { is_expected.to be_kind_of Hash }
  end
end
