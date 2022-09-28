class Robot
  ALPHABET = ('A'..'Z').to_a

  @@names = []

  def name
    return @name if @name
    generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    @name = ''
    2.times { @name << ALPHABET.sample }
    3.times { @name << rand(0..9).to_s }
  end
end
