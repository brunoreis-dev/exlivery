defmodule ExliveryTest.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Bruno",
        address: "rua das bananas",
        email: "teste@teste.com",
        cpf: "123456789",
        age: 26
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created ou updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid parameters, returns an error" do
      response =
        CreateOrUpdate.call(%{
          name: "Bruno",
          address: "rua das bananas",
          email: "teste@teste.com",
          cpf: "123456789",
          age: 17
        })

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
