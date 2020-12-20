defmodule Caesar do
  @moduledoc """
  Atbash cipher implementation
  """
  import Enum
  @doc """
  Get a map of english alphabet and shifted alphabet
  """
  defp get_alphabet_map(shift) do
    alphabet = map(to_list(?a..?z), fn(n) -> <<n>> end)
    head = slice(alphabet, length(alphabet)-shift, length(alphabet))
    tail =  slice(alphabet, 0, length(alphabet)-shift)
    zip(alphabet, head ++ tail)
    |> Enum.into(%{})
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
  defp encrypt_string(string, shift, reverse \\ :false) do
    alphabet_map = prepare_alphabet(get_alphabet_map(shift), reverse)
    String.graphemes(string)
    |> map(fn g -> alphabet_map[g] end)
    |> join("")
  end

  @doc """
  Get encrypted string
  """
  def encrypt(string, shift) do
    encrypt_string(string, shift)
  end

  @doc """
  Get decrypted string
  """
  def decrypt(string, shift) do
    encrypt_string(string, shift, :true)
  end

end
