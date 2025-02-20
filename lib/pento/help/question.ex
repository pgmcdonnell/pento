defmodule Pento.Help.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :asked, :string
    field :answer, :string
    field :upvotes, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:asked, :answer, :upvotes])
    |> validate_required([:asked, :answer, :upvotes])
  end
end
