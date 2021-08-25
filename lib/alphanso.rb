# frozen_string_literal: true

require_relative "alphanso/version"
require "date"

module Alphanso
  class Error < StandardError; end
  
  # Responsible for calculating deletion date based on plan
  class RetentionPolicy
    DAYS = {
      daily: 42,    # 42 days
      monthly: 365, # 12 months
      yearly: 2555  # 7 yrs
    }.freeze

    PLANS = {
      Standard: %i[daily],
      Gold: %i[daily monthly],
      Platinum: %i[daily monthly yearly]
    }.freeze

    class << self
      # @param plan type: String|Symbol values: ('Standard', 'Gold', 'Platinum')
      # @param created_on type: Date
      #
      # @out deleted_at type: Date
      def deletion_date(plan, created_on)
        raise "invalid plan should be one of #{PLANS.keys}" unless PLANS.key?(plan.to_sym)

        deleted_at = add_days(created_on, DAYS[:daily])

        PLANS[plan.to_sym].each do |frequency|
          case frequency
          when :daily
            deleted_at = add_days(created_on, DAYS[frequency])
          when :monthly
            deleted_at = add_days(created_on, DAYS[frequency]) if end_of_month?(created_on)
          when :yearly
            deleted_at = add_days(created_on, DAYS[frequency]) if end_of_year?(created_on)
          end
        end

        deleted_at
      end

      private

      def add_days(date, days)
        date.next_day(days)
      end

      def end_of_month?(created_on)
        created_on.month != created_on.next_day.month
      end

      def end_of_year?(created_on)
        created_on.year != created_on.next_day.year
      end

    end
  end
end
