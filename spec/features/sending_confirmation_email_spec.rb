feature "setting up an iou" do
  context "when creating iou" do
    scenario "sends an email to the recipient" do
      sign_up
      expect{create_iou}.to change{ActionMailer::Base.deliveries.size}.by 1
      iou = Iou.first()
      invite_email = ActionMailer::Base.deliveries.last
      expect(invite_email.to).to eq ['example@gmail.com']
      expect(invite_email.body).to have_content 'Accept PMNB'
    end
  end

  context "replying to initial email" do
    scenario "recipient clicks through from email" do
      sign_up
      create_iou
      iou = Iou.first()
      visit edit_iou_url(iou)
      click_button "Update Iou"
      iou = Iou.first()
      expect(iou.status).to eq 'pending'
    end
  end
end
