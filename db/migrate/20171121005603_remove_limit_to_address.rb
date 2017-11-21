class RemoveLimitToAddress < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :kind, :string         
    change_column :addresses, :street, :string       
    change_column :addresses, :number, :string       
    change_column :addresses, :complement, :string   
    change_column :addresses, :zip_code, :string     
    change_column :addresses, :neighborhood, :string 
    change_column :addresses, :city, :string         
    change_column :addresses, :state, :string        
    change_column :addresses, :country, :string      
  end
end
