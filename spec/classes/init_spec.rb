require 'spec_helper'
describe 'pm_chrony' do
  context 'with default values for all parameters' do
    it { should contain_class('pm_chrony') }
  end
end
