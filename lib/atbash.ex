defmodule Atbash do
  @moduledoc """
  Atbash cipher implementation
  """

  @doc """
  Get a map of english alphabet and reverse alphabet
  """
  defp get_alphabet_map() do
    alphabet = Enum.map(Enum.to_list(?a..?z), fn(n) -> <<n>> end)
    Enum.zip(alphabet, Enum.reverse(alphabet))
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
  defp encrypt_string(string, reverse \\ :false) do
    alphabet_map = prepare_alphabet(get_alphabet_map(), reverse)
    String.graphemes(string)
    |> Enum.map(fn g -> alphabet_map[g] end)
    |> Enum.join("")
  end

  @doc """
  Get encrypted string
  """
  def encrypt(string) do
    encrypt_string(string)
  end

  @doc """
  Get decrypted string
  """
  def decrypt(string) do
    encrypt_string(string, :true)
  end

end
