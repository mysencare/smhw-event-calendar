require 'rails_helper'

describe DatesOrderValidator do
  let(:dummy_class) { Struct.new(:start_date, :end_date, :errors) }
  let(:record)      { dummy_class.new(start_date, end_date, base: []) }
  let(:start_date)  { Date.current }

  let(:dates_order_errors) { record.errors[:base] }

  context 'valid record' do
    let(:end_date) { start_date }

    before { subject.validate(record) }

    it { expect(dates_order_errors).to be_blank }
  end

  context 'valid record' do
    let(:end_date) { start_date - 2.days }
    let(:error_message) do
      'end_date should be equal or greater then start_date'
    end
    before { subject.validate(record) }

    it { expect(dates_order_errors).to match_array([error_message]) }
  end
end
