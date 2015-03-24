require 'set'

module Bullet
  class NotificationCollector
    attr_reader :collection

    def initialize
      reset
    end

    def reset
      @collection = Set.new
    end

    def add(value)
      ActiveSupport::Notifications.instrument('bullet', detection: value) do
        @collection << value
      end
    end

    def notifications_present?
      !@collection.empty?
    end
  end
end

