class Payment < ActiveRecord::Base
    belongs_to :user

    validates :type, inclusion: { in: %w(banktransfer creditcard) }
    with_options if: :paid_with_card? do |cc|
      validates :cardprovider, presence: true
      validates :cardprovider, inclusion: { in: %w(visa mastercard maestro) }
    end

private
    def paid_with_card?
      self.type == 'creditcard'
    end
end
