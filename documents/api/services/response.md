## Table of Contents

- [response.proto](#response-proto)
    - [Response](#proto-Response)
  



<a name="response-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## response.proto
# Query Response
The `Response` message is returned from a query transaction.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Response"></a>

### Response
A single query response.

Each query MUST define its specific response type.<br/>
Each query response MUST include both the information request and a
`ResponseHeader`.<br/>
All possible query response types MUST be listed here in a `oneof`.


| Field | Type | Description |
| ----- | ---- | ----------- |
| getByKey | [GetByKeyResponse](#proto-GetByKeyResponse) | A response for a query requesting all accounts, claims, files, and smart contract instances whose associated keys include the given Key. <p> > This query is no longer supported. |
| getBySolidityID | [GetBySolidityIDResponse](#proto-GetBySolidityIDResponse) | A response for a query requesting Contract, Account, and File identifiers for a smart contract, given a Solidity identifier. |
| contractCallLocal | [ContractCallLocalResponse](#proto-ContractCallLocalResponse) | A response for a _local_ call to a query function of a given smart contract, providing function parameter inputs as needed. <p> > This call is only performed on the local node. It is _not_ a > network consensus result. |
| contractGetBytecodeResponse | [ContractGetBytecodeResponse](#proto-ContractGetBytecodeResponse) | A response for a query requesting the current bytecode for a smart contract. |
| contractGetInfo | [ContractGetInfoResponse](#proto-ContractGetInfoResponse) | A response for a query requesting detailed information about a smart contract. |
| contractGetRecordsResponse | [ContractGetRecordsResponse](#proto-ContractGetRecordsResponse) | A response for a query requesting records of all transactions against the given contract in the last 25 hours. <p> > This query is no longer supported. |
| cryptogetAccountBalance | [CryptoGetAccountBalanceResponse](#proto-CryptoGetAccountBalanceResponse) | A response for a query requesting the HBAR balance of an account or contract. |
| cryptoGetAccountRecords | [CryptoGetAccountRecordsResponse](#proto-CryptoGetAccountRecordsResponse) | A response for a query requesting records of all "recent" transactions for which the specified account is the effective payer. |
| cryptoGetInfo | [CryptoGetInfoResponse](#proto-CryptoGetInfoResponse) | A response for a query requesting information for an account.<br/> This query includes balance, but not allowances or token relationships. |
| cryptoGetLiveHash | [CryptoGetLiveHashResponse](#proto-CryptoGetLiveHashResponse) | A response for a query requesting detail for a specific live hash associated to a specific account. <p> > This query is no longer supported. |
| cryptoGetProxyStakers | [CryptoGetStakersResponse](#proto-CryptoGetStakersResponse) | A response for a query requesting all the accounts that are proxy staking to this account. <p> > This query is no longer supported. |
| fileGetContents | [FileGetContentsResponse](#proto-FileGetContentsResponse) | A response for a query requesting the content of a file in the Hedera File Service (HFS). |
| fileGetInfo | [FileGetInfoResponse](#proto-FileGetInfoResponse) | A response for a query requesting file metadata from the Hedera File Service (HFS). |
| transactionGetReceipt | [TransactionGetReceiptResponse](#proto-TransactionGetReceiptResponse) | A response for a query requesting the post-consensus (final) result of a transaction. |
| transactionGetRecord | [TransactionGetRecordResponse](#proto-TransactionGetRecordResponse) | A response for a query requesting a transaction record; the detail changes completed in response to a transaction. |
| transactionGetFastRecord | [TransactionGetFastRecordResponse](#proto-TransactionGetFastRecordResponse) | A response for a query requesting a very recent transaction record. <p> > This query is no longer supported. |
| consensusGetTopicInfo | [ConsensusGetTopicInfoResponse](#proto-ConsensusGetTopicInfoResponse) | A response for a query requesting the current state of a topic for the Hedera Consensus Service (HCS). |
| networkGetVersionInfo | [NetworkGetVersionInfoResponse](#proto-NetworkGetVersionInfoResponse) | A response for a query requesting the deployed versions of Hedera Services and the API definitions in semantic version format |
| tokenGetInfo | [TokenGetInfoResponse](#proto-TokenGetInfoResponse) | A response for a query requesting metadata for a specific Token. |
| scheduleGetInfo | [ScheduleGetInfoResponse](#proto-ScheduleGetInfoResponse) | A response for a query requesting detail for a scheduled transaction. |
| tokenGetAccountNftInfos | [TokenGetAccountNftInfosResponse](#proto-TokenGetAccountNftInfosResponse) | A response for a query requesting detail for a subset of individual non-fungible/unique tokens owned by an account.<br/> The requested tokens are selected by a list index, which is based on the order in which the tokens were added to the account. |
| tokenGetNftInfo | [TokenGetNftInfoResponse](#proto-TokenGetNftInfoResponse) | A response for a query requesting detail for a specific non-fungible/unique token selected by both token identifier and serial number. |
| tokenGetNftInfos | [TokenGetNftInfosResponse](#proto-TokenGetNftInfosResponse) | A response for a query requesting detail for a subset of individual non-fungible/unique tokens.<br/> The requested tokens are selected by a list index, which is based on the order in which the tokens were minted. |
| networkGetExecutionTime | [NetworkGetExecutionTimeResponse](#proto-NetworkGetExecutionTimeResponse) | A response for a query requesting the time, in nanoseconds, spent in direct processing for one or more recent transactions. <p> > This query is no longer supported. |
| accountDetails | [GetAccountDetailsResponse](#proto-GetAccountDetailsResponse) | A response for a query requesting detail information about an account. <p> This query is a privileged query and "system" account authorization is REQUIRED for this query. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



