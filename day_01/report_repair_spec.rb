require '../day_01/report_repair'

RSpec.describe ReportRepair do
  it 'product finds the product of the two entries that sum 2020' do
    expense_report = [1721, 979, 366, 299, 675, 1456]
    expect(ReportRepair.product(expense_report)).to eq(514579)
  end

  it 'product finds the product of two different entries that sum 2020' do
    expense_report = [900, 1120, 1010]
    expect(ReportRepair.product(expense_report)).to eq(1_008_000)
  end

  it 'product finds the product of the three entries that sum to 2020' do
    expense_report = [1721, 979, 366, 299, 675, 1456]
    expect(ReportRepair.product3(expense_report)).to eq(241861950)
  end
end
