defmodule BitcoinDashboardWeb.WalletController do
  use BitcoinDashboardWeb, :controller

  def index(conn, _params) do
    networkId = Network.generateNetwork()
    numOfWallets = 10
    numOfTransactions = 10
    transactionId = Transaction.genesisTransaction()
		# IO.puts transactionId
		IO.puts "Genesis transaction created..."


		# blockId=startBlock()
		genesisBlockId = Block.genesisBlock(transactionId)
		IO.puts "Genesis block created..."
		blockchain = [genesisBlockId]
		IO.puts "Blockchain created with Genesis block..."
		Network.updateNetworkBlockchain(networkId, blockchain)


		# Create wallets

		walletPublicKeyList = Enum.map(1..numOfWallets, fn(x) ->
			Wallet.generateWallet(x, blockchain, networkId)
		end)

		allWalletIds = Enum.map(0..numOfWallets-1, fn(x) ->
			Enum.fetch!(Enum.fetch!(walletPublicKeyList, x), 0)
    end)

    IO.inspect allWalletIds



    IO.inspect networkId
    render(conn, "index.html")
	end


	def create(conn, _params) do
		render(conn, "walletList.html")
	end
end


