module UsersHelper
  def indices_matched(name, umlaut)
    name.enum_for(:scan, /(?=#{umlaut})/).map do
      Regexp.last_match.offset(0).first
    end
  end

  def array_of_matches_for(user, letters)
    last_name = user.last_name.last
    indices_matched(last_name, letters)
  end

  def recursive_replacement(matches, user, last_name)
    umlauts = {
      "AE" => "Ä",
      "OE" => "Ö",
      "UE" => "Ü",
      "SS" => "ß"
    }
    if array_of_matches_for(user, matches).empty?
      return
    else
      umlauts.each do |key, value|
        matches = array_of_matches_for(user, key)
        matches.each do |index|
          temp = last_name.dup.insert(index, value)
          temp.slice!(index + 1..index + 2)
          user.last_name << temp if user.last_name.exclude?(temp)
          if matches.length > 2
            recursive_replacement(matches, user, user.last_name.last)
          end
        end
      end
    end
  end

  def all_names(user)
    last_name = user.last_name.last
    # user.duplicates << last_name
    matches_count = array_of_matches_for(user, 'AE').count + array_of_matches_for(user, 'OE').count + array_of_matches_for(user, 'UE').count + array_of_matches_for(user, 'SS').count
    if matches_count > 0
      recursive_replacement('AE', user, last_name)
      recursive_replacement('OE', user, last_name)
      recursive_replacement('UE', user, last_name)
      recursive_replacement('SS', user, last_name)
      user.last_name
    else
      [last_name]
    end
  end
end
