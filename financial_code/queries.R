

load_mint_data = function(transaction_download_date=Sys.Date()) { 
  file_name = paste0('transactions/transactions_', transaction_download_date, '.csv')
  ds = read.csv(file_name)
}

clean_data = function(ds) {
  ds$Original.Description = ds$Labels = ds$Notes= NULL
  colnames(ds) = c('date', 'description', 'amount', 'type', 'cat', 'account') 
  ds$date = as.Date(ds$date, format='%m/%d/%Y')
  ds$date = format(ds$date)
  
  exclude = c('Loan Insurance', 'Loan Payment', 'Investments', 
              'Hide from Budgets & Trends', 'Credit Card Payment', 'Transfer', 
              'Loan Interest', 'Deposit', 'Loans') 
  
  ds = ds[!(ds$cat %in% exclude), ]
  
  ds$shared = ifelse(ds$account=='Capital One Costco Card', 'yes', 'no') 
  
  ds$amount2 = ifelse(ds$shared=='yes', ds$amount/2, ds$amount) 
    tidy_ds = sqldf('SELECT strftime("%m", date) AS month, 
                    strftime("%Y", date) AS year, 
                    SUM(amount2) AS amount, cat, type FROM ds 
                    GROUP BY year, month, cat, type ORDER BY year, month, cat, type') 
    
    tidy_ds$amount = round(tidy_ds$amount, 2)
    
    tidy_ds_expense = tidy_ds[tidy_ds$type=='debit', ]
    tidy_ds_income = tidy_ds[tidy_ds$type=='credit', ]
    
    return(df=list(tidy_ds_expense=tidy_ds_expense, 
                tidy_ds_income=tidy_ds_income))
}

expense_summary = function(tidy_ds_expense, latest_transaction_date) { 
    
    tidy_ds_this_month = tidy_ds_expense[tidy_ds_expense$year == year(today) & 
                                         as.numeric(tidy_ds_expense$month) == month(today), c('cat', 'amount')]
    
    
    
    tidy_ds_last_month = tidy_ds_expense[tidy_ds_expense$year == year(today %m-% months(1)) & 
                                           as.numeric(tidy_ds_expense$month) ==  month(today %m-% months(1)), c('cat', 'amount')]
    
    
    tidy_ds_expense_summary = merge(tidy_ds_this_month, tidy_ds_last_month, by='cat', all=TRUE)
    
    
    for (i in 2:3){
      tidy_ds_expense_summary[,i] = ifelse(is.na(tidy_ds_expense_summary[,i])==TRUE, 0, tidy_ds_expense_summary[,i])
    }
    
    return(tidy_ds_expense_summary)
}

income_summary = function(tidy_ds_income, latest_transaction_date) {

  tidy_ds_this_month = tidy_ds_income[tidy_ds_income$year == year(today) &
                                         as.numeric(tidy_ds_income$month) == month(today), c('cat', 'amount')]



  tidy_ds_last_month = tidy_ds_income[tidy_ds_income$year == year(today %m-% months(1)) &
                                         as.numeric(tidy_ds_income$month) ==  month(today %m-% months(1)), c('cat', 'amount')]


  tidy_ds_income_summary = merge(tidy_ds_this_month, tidy_ds_last_month, by='cat', all=TRUE)


  for (i in 2:3){
    tidy_ds_income_summary[,i] = ifelse(is.na(tidy_ds_income_summary[,i])==TRUE, 0, tidy_ds_income_summary[,i])
  }

  return(tidy_ds_income_summary)
}




