## Table of Contents

- [query.proto](#query-proto)
    - [Query](#proto-Query)
  



<a name="query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Query"></a>

### Query
A single query, which is sent from the client to a node. This includes all possible queries.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| getByKey | [GetByKeyQuery](#proto-GetByKeyQuery) |  | Get all entities associated with a given key |
| getBySolidityID | [GetBySolidityIDQuery](#proto-GetBySolidityIDQuery) |  | Get the IDs in the format used in transactions, given the format used in Solidity |
| contractCallLocal | [ContractCallLocalQuery](#proto-ContractCallLocalQuery) |  | Call a function of a smart contract instance |
| contractGetInfo | [ContractGetInfoQuery](#proto-ContractGetInfoQuery) |  | Get information about a smart contract instance |
| contractGetBytecode | [ContractGetBytecodeQuery](#proto-ContractGetBytecodeQuery) |  | Get runtime code used by a smart contract instance |
| ContractGetRecords | [ContractGetRecordsQuery](#proto-ContractGetRecordsQuery) |  | **Deprecated.** As of release 0.9.0 this query is not supported. Get Records of the contract instance |
| cryptogetAccountBalance | [CryptoGetAccountBalanceQuery](#proto-CryptoGetAccountBalanceQuery) |  | Get the current balance in a cryptocurrency account |
| cryptoGetAccountRecords | [CryptoGetAccountRecordsQuery](#proto-CryptoGetAccountRecordsQuery) |  | Get all the records that currently exist for transactions involving an account |
| cryptoGetInfo | [CryptoGetInfoQuery](#proto-CryptoGetInfoQuery) |  | Get all information about an account |
| cryptoGetLiveHash | [CryptoGetLiveHashQuery](#proto-CryptoGetLiveHashQuery) |  | Get a single livehash from a single account, if present |
| cryptoGetProxyStakers | [CryptoGetStakersQuery](#proto-CryptoGetStakersQuery) |  | Get all the accounts that proxy stake to a given account, and how much they proxy stake (not yet implemented in the current API) |
| fileGetContents | [FileGetContentsQuery](#proto-FileGetContentsQuery) |  | Get the contents of a file (the bytes stored in it) |
| fileGetInfo | [FileGetInfoQuery](#proto-FileGetInfoQuery) |  | Get information about a file, such as its expiration date |
| transactionGetReceipt | [TransactionGetReceiptQuery](#proto-TransactionGetReceiptQuery) |  | Get a receipt for a transaction (lasts 180 seconds) |
| transactionGetRecord | [TransactionGetRecordQuery](#proto-TransactionGetRecordQuery) |  | Get a record for a transaction |
| transactionGetFastRecord | [TransactionGetFastRecordQuery](#proto-TransactionGetFastRecordQuery) |  | Get a record for a transaction (lasts 180 seconds) |
| consensusGetTopicInfo | [ConsensusGetTopicInfoQuery](#proto-ConsensusGetTopicInfoQuery) |  | Get the parameters of and state of a consensus topic. |
| networkGetVersionInfo | [NetworkGetVersionInfoQuery](#proto-NetworkGetVersionInfoQuery) |  | Get the versions of the HAPI protobuf and Hedera Services software deployed on the responding node. |
| tokenGetInfo | [TokenGetInfoQuery](#proto-TokenGetInfoQuery) |  | Get all information about a token |
| scheduleGetInfo | [ScheduleGetInfoQuery](#proto-ScheduleGetInfoQuery) |  | Get all information about a scheduled entity |
| tokenGetAccountNftInfos | [TokenGetAccountNftInfosQuery](#proto-TokenGetAccountNftInfosQuery) |  | Get a list of NFTs associated with the account |
| tokenGetNftInfo | [TokenGetNftInfoQuery](#proto-TokenGetNftInfoQuery) |  | Get all information about a NFT |
| tokenGetNftInfos | [TokenGetNftInfosQuery](#proto-TokenGetNftInfosQuery) |  | Get a list of NFTs for the token |
| networkGetExecutionTime | [NetworkGetExecutionTimeQuery](#proto-NetworkGetExecutionTimeQuery) |  | Gets <tt>handleTransaction</tt> times for one or more "sufficiently recent" TransactionIDs |
| accountDetails | [GetAccountDetailsQuery](#proto-GetAccountDetailsQuery) |  | Gets all information about an account including allowances granted by the account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


