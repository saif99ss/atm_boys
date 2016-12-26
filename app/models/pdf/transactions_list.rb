class TransactionsList < Prawn::Document
 
 def initialize(transactions)
   super()
   @transactions = transactions
   
 

 #header 
     data = [[{:content => "ALL TRANSACTIONS",:colspan => 5,:size => 18, :text_color => "000000", :align => :center,:font_style => :bold }]] 
     data += [["#","AMOUNT","TYPE","ATM NAME","CREATED AT"]]
 
 # body
     @transactions.each do |i|
       data += [[("#{i.id}"),( "$ #{i.amount}"),( "#{( ("Debit" if i.debit == true) || ("Withdrawal" if i.debit == false))}" ),( "#{i.atm_mach_id}"),( "#{i.created_at.strftime("%I:%M:%S %p --- %m/%d/%Y")}")]]
     end

     table(
       data,
       :row_colors => ["ddeaff","ffffff"],
       :position => :center, 
       :header => true,
       :column_widths => [50,75,100,75,200]
       )
   
 # the page number in footer 
     number_pages "(<page> of <total>)",{
       :start_count_at => 0,
       :page_filter => :all,
       :at => [bounds.right - 550,0],
       :align => :center, 
       :size => 13 }
 end    
end

