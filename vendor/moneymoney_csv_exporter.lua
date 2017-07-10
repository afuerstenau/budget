Exporter{version       = 1.00,
         format        = "Custom CSV file",
         fileExtension = "csv",
         description   = "Export transactions as custom CSV file"}

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
  assert(io.write("Date;Value date;Category;Name;Purpose;Account;Bank;Amount;Currency\n"))
end

function WriteTransactions (account, transactions)
  -- Write one line per transaction.
  for _,transaction in ipairs(transactions) do
    assert(io.write(csvField(MM.localizeDate(transaction.bookingDate)) .. ";" ..
                    csvField(MM.localizeDate(transaction.valueDate)) .. ";" ..
                    csvField(transaction.category) .. ";" ..
                    csvField(transaction.name) .. ";" ..
                    csvField(transaction.purpose) .. ";" ..
                    csvField(transaction.accountNumber) .. ";" ..
                    csvField(transaction.bankCode) .. ";" ..
                    csvField(MM.localizeNumber("0.00", transaction.amount)) .. ";" ..
                    csvField(transaction.currency) .. "\n"))
  end
end

function WriteTail (account)
  -- Nothing to do.
end