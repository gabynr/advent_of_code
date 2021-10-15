require '../day_06/custom_customs'

RSpec.describe CustomCustoms do

  it "sum the group is 11" do
    array = [['a','b','c'],['a','b','c'],['a','b','a','c'],['a','a','a','a'],['b']]
    expect(CustomCustoms.sum_count(array)).to eq (11)
  end

end