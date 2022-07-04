defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Bruno",
      email: "bruno@teste.com",
      cpf: "123456789",
      age: 26,
      address: "Rua das Bananeiras, 25"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de Peperoni",
      category: :pizza,
      unity_price: Decimal.new("33.00"),
      quantity: 2
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Bananeiras, 25",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("107.00"),
      user_cpf: "123456789"
    }
  end
end
