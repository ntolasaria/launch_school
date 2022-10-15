class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    new_name = ''
    2.times { new_name += ('A'..'Z').to_a.sample }
    3.times { new_name += rand(0..9).to_s }
    new_name
  end
end
