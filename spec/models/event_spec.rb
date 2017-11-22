require 'rails_helper'

describe Event, type: :model do
  subject do
    described_class.new(name: name, start_date: start_date, end_date: end_date)
  end

  let(:name)       { nil }
  let(:start_date) { nil }
  let(:end_date)   { nil }

  describe 'validations' do
    let(:blank_name_message)       { "Name can't be blank" }
    let(:blank_start_date_message) { "Start date can't be blank" }

    context 'name and start_date missing' do
      let(:expected_errors_value) do
        [blank_name_message, blank_start_date_message]
      end

      it 'is not a valid Event instance', :aggregate_failures do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to match_array(expected_errors_value)
      end
    end

    context 'name missing' do
      let(:start_date) { Date.current }

      it 'is not a valid Event instance', :aggregate_failures do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to match_array([blank_name_message])
      end
    end

    context 'start_date missing' do
      let(:name) { 'my new event' }

      it 'is not a valid Event instance', :aggregate_failures do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to match_array([blank_start_date_message])
      end
    end

    context 'start_date after end_date' do
      let(:name)       { 'some name' }
      let(:end_date)   { Date.current }
      let(:start_date) { end_date + 1.day }
      let(:wrong_date_order_message) do
        'end_date should be equal or greater then start_date'
      end

      it 'is not a valid Event instance', :aggregate_failures do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to match_array([wrong_date_order_message])
      end
    end

    context 'name and start_date present' do
      let(:name) { 'my new event' }
      let(:start_date) { Date.current }

      it { expect(subject.valid?).to eq(true) }
    end
  end
end
