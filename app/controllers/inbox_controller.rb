class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  # To completely ignore unhandled events (not even logging), uncomment this line
  # ignore_unhandled_events!

  # If you want unhandled events to raise a hard exception, uncomment this line
  # unhandled_events_raise_exceptions!

  # To enable authentication, uncomment this line and set your API key.
  # It is recommended you pull your API keys from environment settings,
  # or use some other means to avoid committing the API keys in your source code.
  # authenticate_with_mandrill_keys! 'YOUR_MANDRILL_WEBHOOK_KEY'

  def registration_instructions(repairman)
    @repairman = repairman
    mail(to: @repairman.email, subject: 'Welcome to our platform! Complete your registration')
  end

  def handle_inbound(event_payload)
    head(:ok)
  end

  private

  def repairman_params
    params.require(:repairman).permit(:first_name, :second_name, :age, :location, :password, :password_confirmation, :terms)
  end
  
end
