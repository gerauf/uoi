RSpec.describe Iou, type: :model do

  it { is_expected.to belong_to :user}

  it 'won\'t save if no user provided' do
    iou = Iou.create(title:"bluhhh", amount: 10, name: "bluhhh", contact: '071345678')
    expect(iou.save).to eq false
  end

end
