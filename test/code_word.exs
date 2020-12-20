defmodule CodeWordTest do
  use ExUnit.Case

  test "encrypt_decrypt" do
    test_string = "hello"
    code_word = "world"
    encrypted_string = CodeWord.encrypt(test_string, code_word)
    assert encrypted_string == "cdhhk"
    assert CodeWord.decrypt(encrypted_string, code_word) == test_string
  end
end
