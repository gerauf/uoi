RSpec.describe IouMailer do

  subject(:mailer) {IouMailer}

  it {is_expected.to respond_to(:send_spam).with(1).arguments}


  describe '.send_spam' do
    let(:iou){ double :iou, contact: "ferg@email.com", amount: 2000}

    it 'sets spam email for delivery' do
      user = User.create(username: 'Ferg', email: 'ferg@gmail.com', password: '12345678')
      iou = Iou.create(title: 'vsd', amount: '100', name: 'max', contact: 'some@email.com', user_id: user.id)
      expect{subject.send_spam(iou)}.to change{ActionMailer::Base.deliveries.size}.by 1
    end
  end

end
