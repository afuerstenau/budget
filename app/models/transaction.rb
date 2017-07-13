class Transaction < ApplicationRecord
  require 'csv'
  validates :moneymoney_id, uniqueness: true
  
  def self.import(file)
    CSV.foreach(file.path, headers: true, :col_sep => ";") do |row|
      row_as_hash = row.to_hash
      print "row as hash before #{row_as_hash}\n"
      row_as_hash = replace_category_name_with_category_id (row_as_hash)
      print "row as hash after #{row_as_hash}\n"
      row_as_hash.delete("category")
      transaction = Transaction.find_by moneymoney_id: row_as_hash['moneymoney_id']
      if transaction == nil then
        Transaction.create! row_as_hash
      else
        transaction.update row_as_hash
      end
    end
  end
  
  def self.replace_category_name_with_category_id(row_as_hash)
    name = row_as_hash['category']
    print "row name #{name}\n"
    category = Category.find_by name: name
    print "category #{category}\n"
    row_as_hash[:category_id] = category.id unless category.nil?
    
    return row_as_hash
  end
end
