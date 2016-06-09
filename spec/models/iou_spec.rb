RSpec.describe Iou, type: :model do
  let(:user) {User.create(username: 'Ferg', email: 'ferg@gmail.com', password: '12345678')}

  let(:no_user) {Iou.create(title:"lunch", amount: 10, name: "Alice", contact: 'alice@wonderland.com')}
  let(:non_email) {Iou.create(title:"lunch", amount: 10, name: "Alice", contact: '071234455', user_id: user.id)}
  let(:iou) {Iou.create(title:"lunch", amount: 10, name: "Alice", contact: 'alice@wonderland.com', user_id: user.id)}


  it {is_expected.to belong_to :user}

  context 'creating Ious' do
    it 'won\'t save if no user provided' do
      expect(no_user.save).to eq false
      expect{no_user.save}.not_to change(Iou, :count)
    end

    it 'requires the contact to be an email' do
      expect{non_email.save}.not_to change(Iou, :count)
    end

    it 'is initialised with a default status code: created' do
      expect{iou.save}.to change(Iou, :count).by 1
      expect(iou.status).to eq 'created'
    end
  end


  describe "send_and_reschedule" do

    it 'sends initial email' do
      expect{iou.send_and_reschedule(IouMailer)}.to change{ActionMailer::Base.deliveries.size}.by 1
    end

    it 'calls send_and reschedule again using a delayed job' do
      iou.send_and_reschedule(IouMailer)
      expect(Delayed::Job.count).to eq(1)
    end

    context "when status equals paid" do
      let(:paid_iou) {Iou.create(title:"lunch", amount: 10, name: "Alice", contact: 'alice@wonderland.com', user_id: user.id, status: "paid")}
      it 'doesn\'t send an email' do
        expect{paid_iou.send_and_reschedule(IouMailer)}.not_to change{ActionMailer::Base.deliveries.size}
      end

      it 'doesn\'t call itself again' do
        paid_iou.send_and_reschedule(IouMailer)
        expect(Delayed::Job.count).to eq(0)
      end
    end
  end


  describe "update_status" do
    before do
      iou.update_status
    end

    it 'changes created to pending' do
      expect(iou.status).to eq 'pending'
    end

    it 'changes pending to paid' do
      iou.update_status
      expect(iou.status).to eq 'paid'
    end
  end
end
