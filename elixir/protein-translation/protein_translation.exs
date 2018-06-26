defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins = get_codons(rna) |> Enum.map(fn(x) -> of_codon(x) end) |> list_proteins([])
    cond do
      proteins == :unknown_codon -> {:error, "invalid RNA"}
      true -> {:ok, Enum.reverse(proteins)}
    end
  end

  defp get_codons(strand) do
    for <<characters::binary-3 <- strand>>, do: characters
  end

  defp list_proteins([{:error, "invalid codon"} | _], _) do :unknown_codon end

  defp list_proteins([{:ok, "STOP"} | _], proteins) do proteins end

  defp list_proteins([{:ok, protein} | tail], proteins) do
    list_proteins(tail, [protein | proteins])
  end

  defp list_proteins([], proteins) do proteins end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    try do
      %{ ^codon => protein } = codons_to_protein_mapping()
      {:ok, protein}
    rescue
      MatchError -> {:error, "invalid codon"}
    end
  end

  defp codons_to_protein_mapping do
    %{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP"
    }
  end
end
