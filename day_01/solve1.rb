require_relative 'report_repair'

expense_report = File.read('../day_01/1.txt').split.map(&:to_i)
puts ReportRepair.product(expense_report)
puts ReportRepair.product3(expense_report)
# puts ReportRepair.roduct3(expense_report)
puts ReportRepair.hash_product3e(expense_report)