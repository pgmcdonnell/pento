defmodule Pento.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :asked, :string
      add :answer, :string
      add :upvotes, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
