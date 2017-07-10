class Transaction < ApplicationRecord
  require 'csv'
  
  def self.import(file)
    CSV.foreach(file.path, headers: true, :col_sep => ";") do |row|
      row_as_hash = row.to_hash
      row_as_hash = replace_category_name_with_category_id (row_as_hash)
      row_as_hash.delete("category")
      Transaction.create! row_as_hash
    end
  end
  
  def self.replace_category_name_with_category_id(row_as_hash)
    row_as_hash[:category_id] = Category.find_by name: row_as_hash[:category]
    return row_as_hash
  end
  
  def self.replace_category_name_with_category_id(row_as_hash)
    row_as_hash[:category_id] = Category.find_by name: row_as_hash[:category]
    return row_as_hash
  end
end
