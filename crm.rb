require "./contact.rb"

class CRM


  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
      puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    puts "Enter a first name: "
    print "> "
    first_name = gets.chomp
    puts "Enter a last_name: "
    print "> "
    last_name = gets.chomp
    puts "Enter an email: "
    print "> "
    email = gets.chomp
    puts "Enter a note: "
    print "> "
    note = gets.chomp
    person = Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Enter ID of contact to modify: "
    print "> "
     id = gets.chomp
     Contact.all.each do |contact|
       if contact.id ==  id.to_i
         puts "Enter an attribute to modify: First Name = 1,
         Last Name  = 2, Email = 3, Note = 4"
         attribute_to_update = gets.chomp
         puts "Enter updated info"
         updated_value = gets.chomp
         contact.update(attribute_to_update, updated_value)
         puts "Contact updated!"
        end
      end
  end

  def delete_contact
    puts "Enter ID of contact to delete: "
    id = gets.chomp.to_i
    contact = Contact.find(id)
    contact.delete
    puts "#{contact.first_name} #{contact.last_name} deleted."
  end

  def display_all_contacts
    puts "Contacts:"
    puts Contact.all
  end

  def search_by_attribute
    puts "Select an attribute to search by: "
    attribute_to_search = gets.chomp
    puts "Enter name, email, or note"
    value_to_search = gets.chomp
    puts Contact.find_by(attribute_to_search, value_to_search)
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu
