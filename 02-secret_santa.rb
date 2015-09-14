class Santa

  def initialize(list)
    @list = list
    @names = Array.new
    @list.each do |name,v|
      @names << name
    end
  end

  def output
    output_pairs = evaluate_pairs
    output_pairs.each do |pair|
      pair[0]  = "#{pair.first} #{@list[pair.first]}"
      pair[-1] = "#{pair.last} #{@list[pair.last]}"
    end
    output_pairs
  end

  def evaluate_pairs
    evaluated_pairs = sort_names(@names)
    evaluated_pairs.each do |pair|
      first_surname = pair.first.slice(/\S*.$/)
      last_surname = pair.last.slice(/\S*.$/)

      if first_surname == last_surname
        evaluate_pairs
      end
    end
    evaluated_pairs
  end

  def sort_names(list_of_names)
    sorted_pairs = Array.new
    list = list_of_names.shuffle

    (list.length / 2).times do
      sorted_pairs << list.pop(2)
    end

    sorted_pairs
  end
end

names = {
  "Luke Skywalker"   => "luke@theforce.net",
  "Leia Skywalker"   => "leia@therebellion.org",
  "Toula Portokalos" => "toula@manhunter.org",
  "Gus Portokalos"   => "gus@weareallfruit.net",
  "Bruce Wayne"      => "bruce@imbatman.com",
  "Virgil Brigman"   => "virgil@rigworkersunion.org",
  "Lindsey Brigman"  => "lindsey@iseealiens.net"
}
test = Santa.new(names)
p test.output
