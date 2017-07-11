Exporter{version       = 1.00,
         format        = "Exporter for Budget",
         fileExtension = "csv",
         description   = "to be used for import files into budget"}

local function csvField (str)
  -- Helper function for quoting separator character and escaping double quotes.
  if str == nil then
    return ""
  elseif string.find(str, ";") then
    return '"' .. string.gsub(str, '"', '""') .. '"'
  else
    return str
  end
end

function WriteHeader (account, startDate, endDate, transactionCount)
  -- Write CSV header.
  assert(io.write("moneymoney_id;occurance_date;value_date;category;name;purpose;account;bank;amount;currency\n"))
end

function WriteTransactions (account, transactions)
  -- Write one line per transaction.
  for _,transaction in ipairs(transactions) do
    assert(io.write(csvField(transaction.id) .. ";" ..
					csvField(MM.localizeDate("yyyy-MM-dd", transaction.bookingDate)) .. ";" ..
                    csvField(MM.localizeDate("yyyy-MM-dd", transaction.valueDate)) .. ";" ..
                    csvField(transaction.category) .. ";" ..
                    csvField(transaction.name) .. ";" ..
                    csvField(transaction.purpose) .. ";" ..
                    csvField(transaction.accountNumber) .. ";" ..
                    csvField(transaction.bankCode) .. ";" ..
                    csvField(transaction.amount) .. ";" ..
                    csvField(transaction.currency) .. "\n"))
  end
end

function WriteTail (account)
  -- Nothing to do.
end