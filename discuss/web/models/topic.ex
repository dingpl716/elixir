defmodule Discuss.Topic do
  use(Discuss.Web, :model)

  schema("topics") do
    field(:title, :string)
  end

  @doc """
  `Struct`: A hash that contains some data. Represents a record (or a record we
  want to save) in the database.
  `Params`: A hash that contains the properties we want to update the struct with.
  Returns a changeset which knows the data we're trying to save and whether or
  not there are validation issues with it.
  """
  def changeset(struct, params \\ %{}) do
    struct
    # produces a changeset
    |> cast(params, [:title])
    |> IO.inspect(label: "before")
    # adds errors to changeset
    |> validate_required([:title])
    |> IO.inspect(label: "after")
  end
end
