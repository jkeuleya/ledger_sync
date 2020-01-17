# frozen_string_literal: true

require_relative 'account'
require_relative 'bill_line_item'
require_relative 'vendor'

module LedgerSync
  class Bill < LedgerSync::Resource
    attribute :currency, type: Type::String
    attribute :memo, type: Type::String
    attribute :transaction_date, type: Type::Date
    attribute :due_date, type: Type::Date
    attribute :reference_number, type: Type::String

    references_one :vendor, to: Vendor
    references_one :account, to: Account

    references_many :line_items, to: BillLineItem

    def name
      "Bill: #{transaction_date}"
    end
  end
end
