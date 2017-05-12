require 'spec_helper'

describe Emaa do
  it { expect(Emaa).to respond_to(:config) }
  it { expect(Emaa).to respond_to(:env) }
end
