defmodule CodeWord do
  @moduledoc """
  Code Word cipher implementation
  """
  import Enum
  @doc """
  Get a map of english alphabet and encrypted alphabet
  """
  defp get_alphabet_map(code_word) do
    alphabet = map(to_list(?a..?z), fn(n) -> <<n>> end)
    head = String.graphemes(code_word)
           |> uniq
    tail =  Enum.filter(alphabet, fn el -> !Enum.member?(head, el) end)
    zip(alphabet, head ++ tail)
    |> into(%{})
  end

  @doc """
  Get a reversed alphabet map (for decrypting)
  """
  defp prepare_alphabet(alphabet, :true) do
    for {k, v} <- alphabet, into: %{}, do: {v, k}
  end

  @doc """
  Get a straight alphabet map (for encrypting)
  """
  defp prepare_alphabet(alphabet, :false) do
    alphabet
  end

  @doc """
  Get encrypted or decrypted string
  """
  defp encrypt_string(string, code_word, reverse \\ :false) do
    alphabet_map = prepare_alphabet(get_alphabet_map(code_word), reverse)
    String.graphemes(string)
    |> map(fn g -> alphabet_map[g] end)
    |> join("")
  end

  @doc """
  Get encrypted string
  """
  def encrypt(string, code_word) do
    encrypt_string(string, code_word)
  end

  @doc """
  Get decrypted string
  """
  def decrypt(string, code_word) do
    encrypt_string(string, code_word, :true)
  end

end
