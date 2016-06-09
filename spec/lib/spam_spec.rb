require './lib/spam'

describe Spam do

subject(:spam) {Spam}
let(:item) {double :item, status: "pending", contact: "someIdiot@gmail.com"}

let(:mailer) {double :mailer}

  describe ".scheduler" do
    before do
      allow(mailer).to receive(:send_spam)
      allow(item).to receive(:status=)
    end

    it 'sends the item ' do
      time = Time.new
      expect(mailer).to receive(:send_spam).with(item)
      spam.send_and_reschedule(item, mailer, time, 3000)
    end

    it 'calls delay on itself' do
      time = Time.new
      expect(spam).to respond_to(:delay).with(1).argument
      spam.send_and_reschedule(item, mailer, time, 3000)
    end

    it 'calls itself with the same item action and delay' do
      time = Time.new
      expect(spam).to receive(:send_and_reschedule).once
      spam.send_and_reschedule(item, time, 3000, mailer)
    end
  end
end
