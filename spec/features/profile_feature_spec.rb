feature 'profile' do
  before do
    sign_up
  end

  context 'page shows pending uois' do
    scenario 'UOIs show on profile page as pending' do
      create_iou
      within 'div#pending-uois' do
        list = find('ul').all('li').collect(&:text)
        expect(list.count).to eq 1
      end
    end
  end

  context 'no ious' do
    scenario 'show message when no ious' do
      within 'div#pending-uois' do
        expect(page).to have_content('NO ONE OWE$ YOU MONEY')
      end
    end
  end

end
