defmodule My.File do
  def open(path, mode) do
    case File.open(path, mode) do
      {:ok, file} -> file
      {:error, :enoent} -> raise("File does not exist: #{path}")
    end
  end

  def close(io_device) do
    File.close(io_device)
  end

  def avg_time(path) do
    File.stream!(path)
    |> Enum.map(fn str -> NaiveDateTime.from_iso8601!(extract_date_time(str)) end)
    |> avg_diff({0, 0})
  end

  def extract_date_time(str) do
    String.slice(str, 1..10) <> " " <> String.slice(str, 13..24)
  end

  def avg_diff([_], {sum, counter}), do: sum / counter

  def avg_diff([first | rest], {sum, counter}) do
    sum = sum + NaiveDateTime.diff(List.first(rest), first)
    counter = counter + 1
    avg_diff(rest, {sum, counter})
  end
end
