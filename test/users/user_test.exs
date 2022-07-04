defmodule ExliveryTest.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all parameters are valid, returns the user" do
      response = User.build("Rua das Bananeiras, 25", "Bruno", "bruno@teste.com", "123456789", 26)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid parameters, returns an error" do
      response = User.build("rua aleatoria", "Bruno Jr", "bruno@teste.com", "1234567810", 17)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
