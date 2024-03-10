require 'securerandom'
require 'mandrill-rails'

class AdminController < ApplicationController
  def register_repairman
    puts params.inspect
    @repairman = Repairman.new(repairman_params)
    @repairman.generate_token
    @repairman.generate_password

    mandrill = Mandrill::API.new 'YOUR_MANDRILL_API_KEY'
    admin_email = "admin@miga.dk"
    link = "https://makeitgoodagain.dk/restet_password?token=#{@repairman.unique_token}&email=#{@repairman.email}"

    message = {
      from_email: admin_email,
      to: [{ email: @repairman.email }],
      subject: 'Password Reset Link',
      html: "Click the following link to reset your password: #{link}"
    }



    if @repairman.save
      mandrill.messages.send message
      RepairmanMailer.registration_instructions(@repairman).deliver_now
      redirect_to root_path, notice: 'Repairman registration successful. Check your email for instructions.'
    else
      render :register_repairman
    end
  end

  private

  def repairman_params
    params.require(:repairman).permit(:first_name, :second_name, :email, :location, :password, :password_confirmation, :terms)
  end
end
