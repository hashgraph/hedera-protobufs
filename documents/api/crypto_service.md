## Table of Contents

- [crypto_service.proto](#crypto_service-proto)
    - [CryptoService](#proto-CryptoService)
  



<a name="crypto_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-CryptoService"></a>

### CryptoService
Transactions and queries for the Crypto Service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Creates a new account by submitting the transaction |
| updateAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates an account by submitting the transaction |
| cryptoTransfer | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Initiates a transfer by submitting the transaction |
| cryptoDelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes and account by submitting the transaction |
| approveAllowances | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Adds one or more approved allowances for spenders to transfer the paying account's hbar or tokens. |
| deleteAllowances | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes one or more of the specific approved NFT serial numbers on an owner account. |
| addLiveHash | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | (NOT CURRENTLY SUPPORTED) Adds a livehash |
| deleteLiveHash | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | (NOT CURRENTLY SUPPORTED) Deletes a livehash |
| getLiveHash | [Query](#proto-Query) | [Response](#proto-Response) | (NOT CURRENTLY SUPPORTED) Retrieves a livehash for an account |
| getAccountRecords | [Query](#proto-Query) | [Response](#proto-Response) | Returns all transactions in the last 180s of consensus time for which the given account was the effective payer <b>and</b> network property <tt>ledger.keepRecordsInState</tt> was <tt>true</tt>. |
| cryptoGetBalance | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the balance of an account |
| getAccountInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the metadata of an account |
| getTransactionReceipts | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the latest receipt for a transaction that is either awaiting consensus, or reached consensus in the last 180 seconds |
| getFastTransactionRecord | [Query](#proto-Query) | [Response](#proto-Response) | (NOT CURRENTLY SUPPORTED) Returns the records of transactions recently funded by an account |
| getTxRecordByTxID | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the record of a transaction that is either awaiting consensus, or reached consensus in the last 180 seconds |
| getStakersByAccountID | [Query](#proto-Query) | [Response](#proto-Response) | (NOT CURRENTLY SUPPORTED) Retrieves the stakers for a node by account id |

 <!-- end services -->


