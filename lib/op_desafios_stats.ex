defmodule OpDesafiosStats do
  def call() do
    File.read!("desafios.txt")
    |> String.split()
    |> Enum.map(& separate(&1))
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, List.last(x), 1, &(&1 + 1)) end)
  end

  def separate(line) do
    line
    |> String.trim("./")
    |> String.split("/")
    |> List.update_at(2, &cleanFeature(&1))
  end

  defp cleanFeature(lang_feature) do
    lng = String.split(lang_feature, "-")
    get_lang(lng)
  end

  defp get_lang([lang]) do
    if (lang == "js" || lang == "nodejs" || lang == "JS") do
      "javascript"
    else
      lang
    end
  end

  defp get_lang([lang | _]), do: get_lang([lang])
end
