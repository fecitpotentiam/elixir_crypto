defmodule CaesarTest do
  use ExUnit.Case

  test "encrypt_decrypt" do
    test_string = "hello"
    shift = 4
    encrypted_string = Caesar.encrypt(test_string, shift)
    assert encrypted_string == "dahhk"
    assert Caesar.decrypt(encrypted_string, shift) == test_string
  end
end
