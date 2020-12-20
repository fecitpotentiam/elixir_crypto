defmodule AtbashTest do
  use ExUnit.Case

  test "encrypt_decrypt" do
    test_string = "hello"
    encrypted_string = Atbash.encrypt(test_string)
    assert encrypted_string == "svool"
    assert Atbash.decrypt(encrypted_string) == test_string
  end
end
