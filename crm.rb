require "./contact.rb"

class CRM

  def initialize(name)
    @name = name
  end

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
    person = Contact.create
  end

  def modify_existing_contact
    puts "Enter ID of contact to modify: "
    print "> "
     id = gets.chomp
     Contact.all.each do |id|
       if Contact.all.include? id
        puts "Enter an attribute to modify: First Name = 1,
        Last Name  = 2, Email = 3, Note = 4"
        something.update = gets.chomp
        person = Contact.update
        else
          return nil
        end
      end
  end

  def delete_contact_being_passed_in
    puts "Enter the id of a contact to delete: "
    id = gets.chomp
  end

  def display_all_contacts
    return Contact.all
  end

  def search_by_attribute
    puts "Select an attribute to search by: "
  end


end

malcolm = Contact.create("malcom", "mclure", "emailmemail", "notesnotesnotes")
Contact.all
Contact.all.each do |id|
  puts id.first_name
end
