RSpec.describe IouMailer do

  subject(:mailer) {IouMailer}

  it {is_expected.to respond_to(:send_spam).with(1).arguments}


  describe '.send_spam' do
    let(:iou){ double :iou, contact: "ferg@email.com", amount: 2000}

    it 'sets spam email for delivery' do
      expect{subject.send_spam(iou)}.to change{ActionMailer::Base.deliveries.size}.by 1
    end
  end

end
