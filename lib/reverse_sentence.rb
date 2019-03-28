# A method to reverse the words in a sentence, in place.
# Time complexity: O(n), n is the number of elements in my_words 
# Space complexity: O(1)
def reverse_char(my_words, b, e)
  while b < e
    temp_letter = my_words[b]
    my_words[b] = my_words[e]
    my_words[e] = temp_letter
    b += 1
    e -= 1
  end
  return my_words
end

def is_punctuation?(c)
  punc_str = " ><@#$%^&*()-_\\|:;\""
  punc_str.each_char do |char|
    if c == char
      return true
    end
  end
  return false
end

def reverse_words(my_sentence)
  if my_sentence == nil
    return nil
  end
  b = 0
  len = my_sentence.length
  until b >= len
    while b < len && is_punctuation?(my_sentence[b])
      b += 1
    end
    e = b
    while e < len && !is_punctuation?(my_sentence[e])
      e += 1
    end
    e -= 1
    reverse_char(my_sentence, b, e)
    b = e + 1
  end
  return my_sentence
end

def reverse_sentence(my_sentence)
  if my_sentence == nil
    return nil
  else
    #step 1: reverse each character in my sentence
    reversed_sentence = reverse_char(my_sentence, 0, my_sentence.length - 1)
    #step 2: reverse each word in the reversed_sentence
    return reverse_words(reversed_sentence)
  end
end
