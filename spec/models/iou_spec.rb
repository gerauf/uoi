RSpec.describe Iou, type: :model do

  let(:iou) {Iou.create(title:"lunch", amount: 10, name: "Alice", contact: '07123456789')}

  it { is_expected.to belong_to :user}

  it 'won\'t save if no user provided' do
    expect(iou.save).to eq false
    expect{iou.save}.not_to change(Iou, :count)
  end

  it 'is initialised with a default status code: created' do
    expect(iou.status).to eq 'created'
    expect{iou.save}.not_to change(Iou, :count)
  end

end
