defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @mapping %{
    71 => 'C',
    67 => 'G',
    84 => 'A',
    65 => 'U'
  }
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    rna_complement(dna) |> List.to_string |> String.to_charlist
  end

  def rna_complement([head | tail]) do
    [Map.fetch!(@mapping, head) | rna_complement(tail)]
  end
  def rna_complement([]) do [] end
end
