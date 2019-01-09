defmodule MyEcto.Car do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  @uncles [
    %{
      difficulty: 1_907_116_673_382_750,
      extra_data: "65746865726d696e652d757331",
      extra_data_plain: "ethermine-us1",
      gas_limit: 8_000_029,
      gas_used: 561_556,
      hash: "9a6fdeaf3fb01d18ebe5ce3255849e4d6a346af6b6170f7a7cef92aaeac262bb",
      height: 4_832_837,
      logs_bloom: "111",
      miner: "ea674fdde714fd979de3edf0f56aa9716b898ec8",
      mix_hash: "44d868b3b699c1f131bdaeded42c57d90286cbca49a24bf5a3c19a67c29d6808",
      nonce: "99d9c301d882030b",
      pre_hash: "5a5c3794d291da373506d8c9cd86b1e123bdbd7dad0596da0d3ebb5d590147c9",
      receipts_root: "95f72fac4270f45da6e3cdf23c638d9962740544a15145524572f1e040955894",
      reward: 2_250_000_000_000_000_000,
      seal_fields: [
        "a044d868b3b699c1f131bdaeded42c57d90286cbca49a24bf5a3c19a67c29d6808",
        "8899d9c301d882030b"
      ],
      sha3_uncles: "1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
      size: 0,
      state_root: "ead2d4de0bd5c395861a5b9c42f3ec134019e78a383f184e79def8ffb82c6968",
      total_difficulty: 1_915_321_937_943_920_889_902,
      transactions_root: "5fbd005be9ab329312563e1cdf61124c2e910852d5a03f716447e1f60d462be3"
    }
  ]
  schema "car" do
    field(:uncles, {:array, :map})
  end

  def changeset(params, struct \\ MyEcto.Car) do
    struct
    |> struct()
    |> cast(params, [:id, :uncles])
  end
end
