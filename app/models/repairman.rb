require 'securerandom'
require 'faker'


class Repairman < ApplicationRecord

    attr_accessor :unique_token, :random_password
    before_create :generate_token, :generate_password
    validates :terms, allow_nil: false, acceptance: { message: 'must be accepted' }

    private

    def generate_token
      self.unique_token = SecureRandom.hex(16)
    end
  
    def generate_password
      self.random_password = Faker::Internet.password
    end

end
