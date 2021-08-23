require '../day_05/binary_boarding'

RSpec.describe BinaryBoarding do

  it 'The highest seat ID on a boarding pass' do
    field = ['B','F','F','F','B','B','F','R','R','R']

    expect(BinaryBoarding.binary_space_partitioning(field)).to eq(70)
  end

end