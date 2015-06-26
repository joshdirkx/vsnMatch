module VSN_Format_Validation
  def vsn_format_valid?
    self.vsn_length_check

    self.vsn_first_half_check

    self.vsn_second_half_check
  end


  def vsn_length_check
    # check if 12 characters long
    self.length == 12 ? true : false
  end

  def vsn_first_half_check
    # Check if index 0-5 are characters
    vsn_characters = self.split('')[0..5]

    vsn_characters.each do |i|
      i =~ /[a-zA-Z]/ || i == '*' ? true : false
    end
  end

  def vsn_second_half_check
    # Check if index 6-11 are integers
    vsn_integers = self.split('')[6..11]

    vsn_integers.each do |i|
      i =~ /\d/ || i == '*' ? true : false
    end
  end
end
