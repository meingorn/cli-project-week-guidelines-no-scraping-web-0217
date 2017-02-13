require 'pry'

class NYTCLI

    attr_accessor :make_albums

  def call
    puts "Have you wondered what was going on the day you were born?"
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    print "Please enter your birthday(yyyy-mm-dd): "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def search(input)

    #tests if input is valid format, if so converts input to
    #  if
    input == true


        month_year = input.gsub("-","")

            puts "Your birthday was #{input}, I am searching..."
            search_term = input.split(" ").join("%20").downcase
            puts " "

          albums = NYTApi.new(month_year).make_albums

      albums === albums

     puts "Thank you for your patience. I found this on NYTimes:"
     puts " "


     puts "********************************************************************************"
     puts albums
     puts "********************************************************************************"
     puts " "

     #2. find hash values in json which is roughly "query --> :docs, until it hits "pub_date": with date at format "2016-03-01T00:00:00z" if match then ideally find headling, main then page 1
  #  else
  #    puts "Invalid input please try again"
  #  end

    end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for an Artist's albums"
  end

end
