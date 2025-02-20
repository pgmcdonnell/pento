defmodule Pento.HelpFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.Help` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        asked: "some asked",
        upvotes: 42
      })
      |> Pento.Help.create_question()

    question
  end
end
