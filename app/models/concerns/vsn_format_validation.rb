module VSN_Format_Validation
  extend ActiveSupport::Concern

  def vsn_format_valid(input)
    query = input

    vsn_length_check(query)

    vsn_first_half_check(query)

    vsn_second_half_check(query)
  end


  def vsn_length_check(input)
    query = input
    # check if 12 characters long
    query.length == 12 ? true : false
  end

  def vsn_first_half_check(input)
    query = input
    # check if index 0-5 are characters
    vsn_characters = query.split('')[0..5]

    vsn_characters.each do |i|
      if i =~ /[a-zA-Z]/ || i == '*'
        next
      else
        return false
      end
    end

    return true
  end

  def vsn_second_half_check(input)
    query = input
    # check if index 6-11 are integers
    vsn_integers = query.split('')[6..11]

    vsn_integers.each do |i|
      if i =~ /[\d]/ || i == '*'
        next
      else
        return false
      end
    end

    return true
  end
end
