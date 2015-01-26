
def cycle_example
  letters_in_alphabet = ["a","b","c","d"]
  letters_in_alphabet.cycle(3) {|n| puts n}
end

=>
a
b
c
d
a
b
c
d
a
b
c
d