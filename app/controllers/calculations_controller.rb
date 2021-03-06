class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    text_split_into_array= @text.split

    @word_count = text_split_into_array.length

    @character_count_with_spaces = @text.chars.length

    text_no_spaces = @text.gsub(" ", "")

    @character_count_without_spaces = text_no_spaces.chars.length

    downcased_text_split_into_array = @text.downcase.split

    downcased_text_split_into_array_no_punctuation = @text.gsub(".","").downcase.split

    @occurrences = downcased_text_split_into_array_no_punctuation.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = ((((@apr/100)/12) * @principal) / (1 - (1 + ((@apr/100)/12)) ** ( -(@years * 12))))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @sorted_numbers.count

    @minimum = @sorted_numbers[0]

    @maximum = @sorted_numbers.last

    @range = @maximum - @minimum

    if @count % 2 != 0
      @median = @sorted_numbers[(@count - 1) /(2)]
    else
      @median = (@sorted_numbers[@count/(2)] + @sorted_numbers[@count/(2) - (1)]) / 2
    end

    @sum = @sorted_numbers.sum

    @mean = @sorted_numbers.sum/ @sorted_numbers.count

    a = []
    while a.length <= @count
      array_of_mean = rand(@mean)
      a.push(array_of_mean)
    end

    x_minus_mu = []
    x_minus_mu.push (@sorted_numbers - a)

    sum_x_minus_mu = @x_minus_mu.sum

    @variance = "Replace this string with your answer."

      @standard_deviation = "Replace this string with your answer."

      @mode = "Replace this string with your answer."

      # ================================================================================
      # Your code goes above.
      # ================================================================================

      render("descriptive_statistics.html.erb")
    end
  end
