## Table of Contents

- [response.proto](#response-proto)
    - [Response](#proto-Response)
  



<a name="response-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## response.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Response"></a>

### Response
A single response, which is returned from the node to the client, after the client sent the node
a query. This includes all responses.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| getByKey | [GetByKeyResponse](#proto-GetByKeyResponse) |  | Get all entities associated with a given key |
| getBySolidityID | [GetBySolidityIDResponse](#proto-GetBySolidityIDResponse) |  | Get the IDs in the format used in transactions, given the format used in Solidity |
| contractCallLocal | [ContractCallLocalResponse](#proto-ContractCallLocalResponse) |  | Response to call a function of a smart contract instance |
| contractGetBytecodeResponse | [ContractGetBytecodeResponse](#proto-ContractGetBytecodeResponse) |  | Get the runtime code for a smart contract instance |
| contractGetInfo | [ContractGetInfoResponse](#proto-ContractGetInfoResponse) |  | Get information about a smart contract instance |
| contractGetRecordsResponse | [ContractGetRecordsResponse](#proto-ContractGetRecordsResponse) |  | Get all existing records for a smart contract instance |
| cryptogetAccountBalance | [CryptoGetAccountBalanceResponse](#proto-CryptoGetAccountBalanceResponse) |  | Get the current balance in a cryptocurrency account |
| cryptoGetAccountRecords | [CryptoGetAccountRecordsResponse](#proto-CryptoGetAccountRecordsResponse) |  | Get all the records that currently exist for transactions involving an account |
| cryptoGetInfo | [CryptoGetInfoResponse](#proto-CryptoGetInfoResponse) |  | Get all information about an account |
| cryptoGetLiveHash | [CryptoGetLiveHashResponse](#proto-CryptoGetLiveHashResponse) |  | Contains a livehash associated to an account |
| cryptoGetProxyStakers | [CryptoGetStakersResponse](#proto-CryptoGetStakersResponse) |  | Get all the accounts that proxy stake to a given account, and how much they proxy stake |
| fileGetContents | [FileGetContentsResponse](#proto-FileGetContentsResponse) |  | Get the contents of a file (the bytes stored in it) |
| fileGetInfo | [FileGetInfoResponse](#proto-FileGetInfoResponse) |  | Get information about a file, such as its expiration date |
| transactionGetReceipt | [TransactionGetReceiptResponse](#proto-TransactionGetReceiptResponse) |  | Get a receipt for a transaction |
| transactionGetRecord | [TransactionGetRecordResponse](#proto-TransactionGetRecordResponse) |  | Get a record for a transaction |
| transactionGetFastRecord | [TransactionGetFastRecordResponse](#proto-TransactionGetFastRecordResponse) |  | Get a record for a transaction (lasts 180 seconds) |
| consensusGetTopicInfo | [ConsensusGetTopicInfoResponse](#proto-ConsensusGetTopicInfoResponse) |  | Parameters of and state of a consensus topic.. |
| networkGetVersionInfo | [NetworkGetVersionInfoResponse](#proto-NetworkGetVersionInfoResponse) |  | Semantic versions of Hedera Services and HAPI proto |
| tokenGetInfo | [TokenGetInfoResponse](#proto-TokenGetInfoResponse) |  | Get all information about a token |
| scheduleGetInfo | [ScheduleGetInfoResponse](#proto-ScheduleGetInfoResponse) |  | Get all information about a schedule entity |
| tokenGetAccountNftInfos | [TokenGetAccountNftInfosResponse](#proto-TokenGetAccountNftInfosResponse) |  | A list of the NFTs associated with the account |
| tokenGetNftInfo | [TokenGetNftInfoResponse](#proto-TokenGetNftInfoResponse) |  | All information about an NFT |
| tokenGetNftInfos | [TokenGetNftInfosResponse](#proto-TokenGetNftInfosResponse) |  | A list of the NFTs for the token |
| networkGetExecutionTime | [NetworkGetExecutionTimeResponse](#proto-NetworkGetExecutionTimeResponse) |  | Execution times of "sufficiently recent" transactions |
| accountDetails | [GetAccountDetailsResponse](#proto-GetAccountDetailsResponse) |  | Gets all information about an account including allowances granted by the account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


