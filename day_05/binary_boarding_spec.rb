require '../day_05/binary_boarding'

RSpec.describe BinaryBoarding do

  it 'The highest seat ID on a boarding pass' do
    field = [['F','F','F','B','B','B','F','R','R','R'],['B','F','F','F','B','B','F','R','R','R'],['B','B','F','F','B','B','F','R','L','L']]

    puts expect(BinaryBoarding.seat_id(field)).to eq(820)


  end

end