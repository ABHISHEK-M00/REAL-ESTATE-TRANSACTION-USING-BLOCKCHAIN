
import json
from web3 import Web3, HTTPProvider


# truffle development blockchain address
blockchain_address = 'http://127.0.0.1:9545'
# Client instance to interact with the blockchain
web3 = Web3(HTTPProvider(blockchain_address))
# Set the default account (so we don't need to set the "from" for every transaction call)
web3.eth.defaultAccount = web3.eth.accounts[0]
compiled_contract_path = 'C:/Users/Akash/Downloads/Real Estate/Real_Estate_TOCH/node_modules/.bin/build/contracts/realestate.json'
# Deployed contract address (see `migrate` command output: `contract address`)
deployed_contract_address = '0x7499e6a6D6A055E4F42A041C99d2Cb47CC3be75e'
syspath=r"C:\Users\Riss\Desktop\RISS\BLOCKCHAIN\EHR\static\\"




