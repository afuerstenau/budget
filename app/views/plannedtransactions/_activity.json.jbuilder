json.extract! planned_transaction, :id, :name, :amount, :months, :repeat_yearly, :category_id, :created_at, :updated_at
json.url planned_transaction_url(activity, format: :json)
