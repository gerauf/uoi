feature 'profile' do
  context 'page has several pending uois' do
    before do
      Iou.create title: "Pizza party", amount: 20, name: "Noah", contact: "07123456789"
      Iou.create title: "Cocktails!", amount: 50, name: "Ferg", contact: "07987654321"
      Iou.create title: "Cables", amount: 200, name: "Lucy", contact: "07223344556"
    end

    scenario "UOIs show on profile page as pending" do
      within "#pending_uois" do
        list = find('ul').all('li').collect(&:text)
        expect(list.count).to eq 3
      end
    end
  end
end
