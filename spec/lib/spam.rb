describe Spam do

let(:created_item) {double :item, status: "created", contact: "someIdiot@gmail.com"}
let(:pending_item) {double :item, status: "pending", contact: "someIdiot@gmail.com"}
let(:paid_item) {double :item, status: "paid", contact: "someIdiot@gmail.com"}

  describe ".automator" do
    context 'when item status is created' do
      Spam.automator(created_item)

    end

    context 'when status is paid' do


    end

    context 'when status is pending' do


    end
  end
end
