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
end
