class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions 
  attr_accessor :amount, :image, :name
    


 def deposit(i)
   t = (Time.now-6.hours).beginning_of_day 
   if i[:amount].to_f <= 0.0
     self.errors[:base] << " Negative OR empty NOT permited"
     puts " #{self.errors.full_messages.to_sentence} "
     return false
   else
     if ((Transaction.where("account_id =? and created_at>=? and debit=?",id,t,true).sum(:amount).to_f)+i[:amount].to_f) > 1000
       errors.add(:amount,"$1000.00 Daily Limited")        
       return false 
     else
       self.balance = balance.to_f + i[:amount].to_f
       self.save        
       return true
     end
   end
 end
 
 def withdrawal(i)
   t = (Time.now-6.hours).beginning_of_day
   if i[:amount].to_f <= 0.0 
     errors.add(:amount, " Negative OR Empty NOT Permited ")
     return false
   else
     if (self.balance.to_f  - i[:amount].to_f < 0.0 )
       errors.add(:CAN," NOT WITHDRAWAL MORE THAN THE AVAILABLE BALANCE ")                   
       return false
     else
       if ((Transaction.where("account_id =? and created_at>=? and debit=?",id,t,false).sum(:amount).to_f)+i[:amount].to_f) > 500
         errors.add(:YOU," $500.00 Daily Withdrawal limit")        
         return false
       else
         self.balance = balance.to_f - i[:amount].to_f
         self.save
         # transactions.create!(amount: i[:amount].to_f ,debit: false,account_id: id) we used anothe create in the controller
         return true
       end
     end
   end
 end


end
