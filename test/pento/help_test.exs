defmodule Pento.HelpTest do
  use Pento.DataCase

  alias Pento.Help

  describe "questions" do
    alias Pento.Help.Question

    import Pento.HelpFixtures

    @invalid_attrs %{asked: nil, answer: nil, upvotes: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Help.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Help.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{asked: "some asked", answer: "some answer", upvotes: 42}

      assert {:ok, %Question{} = question} = Help.create_question(valid_attrs)
      assert question.asked == "some asked"
      assert question.answer == "some answer"
      assert question.upvotes == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Help.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{asked: "some updated asked", answer: "some updated answer", upvotes: 43}

      assert {:ok, %Question{} = question} = Help.update_question(question, update_attrs)
      assert question.asked == "some updated asked"
      assert question.answer == "some updated answer"
      assert question.upvotes == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Help.update_question(question, @invalid_attrs)
      assert question == Help.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Help.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Help.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Help.change_question(question)
    end
  end
end
