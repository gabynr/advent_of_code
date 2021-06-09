require '../day_02/password_philosophy'

RSpec.describe PasswordPhilosophy do

  it 'how many are password valid there' do
    policy_password = [[['1-3','a'], 'abcde'], [['1-3','b'], 'cdefg'], [['2-9','c'], 'ccccccccc']]
    expect(PasswordPhilosophy.count_valid_password(policy_password)).to eq(2)
  end

  it 'fails Gaby first implementation' do
    policy_password = [[['1-5','a'], 'abcde'], [['1-5','a'], 'aabcde'], [['1-5','a'], 'aaabcde'], [['1-5','a'], 'aaaabcde'], [['1-5','a'], 'aaaaabcde']]
    expect(PasswordPhilosophy.count_valid_password(policy_password)).to eq(5)
  end
end
