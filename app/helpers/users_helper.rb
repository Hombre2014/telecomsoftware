module UsersHelper
  def indices_matched(name, umlaut)
    name.enum_for(:scan, /(?=#{umlaut})/).map do
      Regexp.last_match.offset(0).first
    end
  end

  umlauts = {
    "AE" => "Ä",
    "OE" => "Ö",
    "UE" => "Ü",
    "SS" => "ß"
  }

  def all_names(user)
    last_name = user.last_name
    match_for_AE = indices_matched(last_name, 'AE')
    match_for_OE = indices_matched(last_name, 'OE')
    match_for_UE = indices_matched(last_name, 'UE')
    match_for_SS = indices_matched(last_name, 'SS')
    matches_count = match_for_AE.count + match_for_OE.count + match_for_UE.count + match_for_SS.count
    if matches_count > 0
      user.duplicates[0] = ''
      # all_names = []
      user.duplicates << last_name
      match_for_AE.each do |index|
        temp = last_name.dup.insert(index, 'Ä')
        temp.slice!(index + 1..index + 2)
        user.duplicates << temp
      end
      match_for_OE.each do |index|
        temp = last_name.dup.insert(index, 'Ö')
        temp.slice!(index + 1..index + 2)
        user.duplicates << temp
      end
      match_for_UE.each do |index|
        temp = last_name.dup.insert(index, 'Ü')
        temp.slice!(index + 1..index + 2)
        user.duplicates << temp
      end
      match_for_SS.each do |index|
        temp = last_name.dup.insert(index, 'ß')
        temp.slice!(index + 1..index + 2)
        user.duplicates << temp
      end
      user.duplicates
    else
      [last_name]
    end
  end

  # def indices_of_matches(name, umlaut)
  #   umlaut_size = umlaut.size
  #   (0..name.size-umlaut_size).select { |i| name[i, umlaut_size] == umlaut }
  # end
end
