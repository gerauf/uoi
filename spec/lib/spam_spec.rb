require './lib/spam'

describe Spam do

subject(:spam) {Spam}
let(:pending_item) {double :pending_item, status: "pending", contact: "someIdiot@gmail.com"}
let(:paid_item) {double :paid_item, status: "paid", contact: "someIdiot@gmail.com"}

let(:mailer) {double :mailer}

  describe ".scheduler" do
    context 'when status is not paid' do
      before do
        allow(mailer).to receive(:send)
        allow(pending_item).to receive(:status=)
      end

      it 'sets the item status to pending' do
        time = Time.new
        expect(pending_item).to receive(:status=).with("pending")
        spam.send_and_reschedule(pending_item, mailer, time, 3000)
      end

      it 'sends the item ' do
        time = Time.new
        expect(mailer).to receive(:send).with(pending_item)
        spam.send_and_reschedule(pending_item, mailer, time, 3000)
      end

      it 'calls delay on itself' do
        time = Time.new
        expect(spam).to respond_to(:delay).with(1).argument
        spam.send_and_reschedule(pending_item, mailer, time, 3000)
      end

      it 'calls itself with the same item action and delay' do
        time = Time.new
        expect(spam).to receive(:send_and_reschedule).once
        spam.send_and_reschedule(pending_item, time, 3000, mailer)
      end
    end

    context 'when status is paid' do

      it 'does not change the the status' do
        time = Time.new
        expect(paid_item).not_to receive(:status=).with("pending")
        spam.send_and_reschedule(paid_item, time, 3000, mailer)
      end

    end

  end
end
