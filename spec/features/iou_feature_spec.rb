feature 'uois' do
  context 'when signed in' do

    before do
      sign_up
    end

    context 'creating ious' do
      scenario 'use a form to make new ious' do
        expect{create_iou}.to change(Iou, :count).by 1
      end

      scenario 'all fields are required' do
        visit new_iou_path
        expect{click_button 'Create Iou'}.not_to change(Iou, :count)
        expect(page).to have_content 'Title can\'t be blank'
        expect(page).to have_content 'Amount can\'t be blank'
        expect(page).to have_content 'Name can\'t be blank'
        expect(page).to have_content 'Contact can\'t be blank'
      end

      scenario 'amount must be larger than 0' do
        expect{ create_iou amount: 0 }.not_to change(Iou, :count)
        expect(page).to have_content 'must be greater than 0'
      end

    end

    scenario 'Ious can be accepted' do
      create_iou
      click_link 'Accept'
      iou = Iou.first
      expect(iou.status).to eq 'pending'
    end

    scenario 'Ious can be marked as paid' do
      create_iou
      click_link 'Accept'
      click_link 'Pay Now'
      iou = Iou.first
      expect(iou.status).to eq 'paid'
    end

    scenario 'Ious can be deleted' do
      create_iou
      expect{click_link "Delete"}.to change(Iou, :count).by -1
    end

  end

  context 'when not signed in' do
    scenario 'redirects to sign in page' do
      visit new_iou_path
      expect(page).not_to have_content "Title"
      expect(page).to have_content "Password"
    end
  end
end
