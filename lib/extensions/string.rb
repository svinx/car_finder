class String

  def cap_sentences
    self.split('. ').map {|w| w.capitalize }.join('. ')
  end

  def phone_numberize
    self.insert(3, '-').insert(7, '-')
  end
end
