class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  def postpone_24h
    @start_date = @start_date + 24 * 60 * 60
  end

  def end_date
    @start_date + (duration * 60 * 60)
  end

  def is_past?
    @start_date < Time.now ? true : false
  end

  def is_futur?
    @start_date > Time.now ? true : false
  end

  def is_soon?
    if Time.now < @start_date
      @start_date - Time.now < 60 * 30 ? true : false
    else
      false
    end
  end

  def to_s
    puts "> Titre : #{@title}"
    puts "> Date de début : #{@start_date}"
    puts "> Durée :#{@duration} minutes"
    puts "> Invités : #{@attendees.join(", ")}"
  end
end