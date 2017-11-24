require 'spec_helper'

describe Sqsender do
  it { expect(Sqsender).to respond_to(:config) }
  it { expect(Sqsender).to respond_to(:env) }
end
