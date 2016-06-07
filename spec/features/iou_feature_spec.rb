feature 'uois' do
  context 'creating ious' do
    scenario 'use a form to make new ious' do
      visit new_iou_path
      fill_in :Title, with: "Paint Ball"
      fill_in :Amount, with: 20
      fill_in :Name, with: "Joey"
      fill_in :Contact, with: "07123456789"
      expect{click_button 'Create Iou'}.to change(Iou, :count).by 1
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
      visit new_iou_path
      fill_in :Title, with: "Burger king"
      fill_in :Amount, with: 0
      fill_in :Name, with: "Joey"
      fill_in :Contact, with: "07123456789"
      expect{click_button 'Create Iou'}.not_to change(Iou, :count)
      expect(page).to have_content 'must be greater than 0'
    end

    # scenario 'users must be signed in to create ious' do
    #
    # end
  end
end
