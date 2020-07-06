require "pry"

class CalendarDisplay

  attr_accessor :events

  def initialize(events)
    @events = events
  end

  # Display a line separating each row
  def display_line
    puts "\n" + "+" + "-" * 76 + "+" + "\n"
  end

  # Format and display the day in order not to break
  def display_day(day)
    numb_of_digits_in_day = Math.log10(day).to_i + 1
    print numb_of_digits_in_day < 2 ? "#{day} " : "#{day}"
  end

  def display
    # Display the first line
    display_line

    # Init variables used for the loops
    row = 1 # From 1 to 5
    column = 1 # From 1 to 7
    day = 1 # From 1 to 31

    # Loop to display the calendar
    while row <= 5
        while column <= 7 && day <= 31
          print "|"
          display_day(day)
          print " " * 8

          column += 1
          day += 1
        end
        print "|"
        print ("\n" + ("| " + " " * 9) * 8) * 5
      row += 1
      column = 1

      # Separate the rows with a line
      display_line
    end
  end
end


events = {}
i = 1
while i <= 31
  events[i] = "Event # #{i}"
  i = i + 1
end

calendar = CalendarDisplay.new(events)
calendar.display


