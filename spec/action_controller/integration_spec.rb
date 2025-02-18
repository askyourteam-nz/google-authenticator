require 'spec_helper'

describe GoogleAuthenticatorRails::ActionController::Integration do
  describe '::included' do
    it 'should add the before filter' do
      MockController.should_receive(:prepend_before_filter).with(:activate_google_authenticator_rails)
      MockController.send(:include, GoogleAuthenticatorRails::ActionController::Integration)
    end
  end

  describe '::activate_google_authenticator_rails' do
    let(:controller) { MockController.new }

    before  do
      MockController.send(:include, GoogleAuthenticatorRails::ActionController::Integration)
      controller.send(:activate_google_authenticator_rails)
    end

    specify { GoogleAuthenticatorRails::Session::Base.controller.should be_a  GoogleAuthenticatorRails::ActionController::RailsAdapter }
  end
end
