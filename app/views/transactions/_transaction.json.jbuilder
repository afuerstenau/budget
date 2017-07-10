json.extract! transaction, :id, :moneymoney_id, :occurance_date, :value_date, :category, :name, :purpose, :account, :bank, :amount, :currency, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
