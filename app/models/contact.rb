class Contact < ActiveRecord::Base
	has_no_table

	column :name, string
	column :email, string
	column :content, string
end
