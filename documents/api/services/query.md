## Table of Contents

- [query.proto](#query-proto)
    - [Query](#proto-Query)
  



<a name="query-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query.proto
# Query
This is the parent message for all queries, and this message is
serialized and signed, with the signature included in the QueryHeader.

All of the entries in the `query` `oneof` are fully specified elsewhere;
we only include a short summary here.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Query"></a>

### Query
A query transaction.<br/>
This message is serialized to bytes and those bytes are signed by the
submitter, with the signature included in the QueryHeader for the query
request.


| Field | Type | Description |
| ----- | ---- | ----------- |
| getByKey | [GetByKeyQuery](#proto-GetByKeyQuery) | Get all entities associated with a given key. |
| getBySolidityID | [GetBySolidityIDQuery](#proto-GetBySolidityIDQuery) | Get an Hedera identifier associated with an identifier in EVM "Solidity" form.<br/> Most often used in smart contracts to find an Hedera account, file, or contract identifier to pass to a system contract or precompile. |
| contractCallLocal | [ContractCallLocalQuery](#proto-ContractCallLocalQuery) | Call a function of a smart contract.<br/> This call is executed exclusively on the node to which it is submitted, and is much less expensive than a `contractCall` transaction. |
| contractGetInfo | [ContractGetInfoQuery](#proto-ContractGetInfoQuery) | Get information about a smart contract. |
| contractGetBytecode | [ContractGetBytecodeQuery](#proto-ContractGetBytecodeQuery) | Get runtime bytecode used by a smart contract. |
| ContractGetRecords | [ContractGetRecordsQuery](#proto-ContractGetRecordsQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get Records of a smart contract. |
| cryptogetAccountBalance | [CryptoGetAccountBalanceQuery](#proto-CryptoGetAccountBalanceQuery) | Get the current HBAR balance of an Hedera account or smart contract. |
| cryptoGetAccountRecords | [CryptoGetAccountRecordsQuery](#proto-CryptoGetAccountRecordsQuery) | Get records of all "recent" transactions for which a specified account is the effective payer. |
| cryptoGetInfo | [CryptoGetInfoQuery](#proto-CryptoGetInfoQuery) | Get information about an account, including the balance.<br/> This does not get the list of account records. |
| cryptoGetLiveHash | [CryptoGetLiveHashQuery](#proto-CryptoGetLiveHashQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get a single livehash from a single account, if present. |
| cryptoGetProxyStakers | [CryptoGetStakersQuery](#proto-CryptoGetStakersQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get all the accounts that are proxy staking to this account. |
| fileGetContents | [FileGetContentsQuery](#proto-FileGetContentsQuery) | Get the content of a file. |
| fileGetInfo | [FileGetInfoQuery](#proto-FileGetInfoQuery) | Get metadata for a file. |
| transactionGetReceipt | [TransactionGetReceiptQuery](#proto-TransactionGetReceiptQuery) | Get a receipt for a transaction.<br/> This only returns a receipt if the transaction is "recent", which is typically within the previous 180 seconds (3 minutes). |
| transactionGetRecord | [TransactionGetRecordQuery](#proto-TransactionGetRecordQuery) | Get a record for a transaction. This only returns a record if the transaction is "available", which is typically within the previous 1 hour. |
| transactionGetFastRecord | [TransactionGetFastRecordQuery](#proto-TransactionGetFastRecordQuery) | Get a record for a transaction. This only returns a record if the transaction is "recent", which is typically within the previous 180 seconds (3 minutes). |
| consensusGetTopicInfo | [ConsensusGetTopicInfoQuery](#proto-ConsensusGetTopicInfoQuery) | Get metadata for a consensus topic. |
| networkGetVersionInfo | [NetworkGetVersionInfoQuery](#proto-NetworkGetVersionInfoQuery) | Get the versions of Hedera Services and the HAPI API deployed on the responding consensus node. |
| tokenGetInfo | [TokenGetInfoQuery](#proto-TokenGetInfoQuery) | Get metadata for a token. |
| scheduleGetInfo | [ScheduleGetInfoQuery](#proto-ScheduleGetInfoQuery) | Get metadata for a schedule.<br/> A schedule is a request to execute a transaction at a future time. |
| tokenGetAccountNftInfos | [TokenGetAccountNftInfosQuery](#proto-TokenGetAccountNftInfosQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get a list of non-fungible/unique tokens associated with an account. |
| tokenGetNftInfo | [TokenGetNftInfoQuery](#proto-TokenGetNftInfoQuery) | Get metadata for a specific, serial numbered, non-fungible/unique token (NFT). |
| tokenGetNftInfos | [TokenGetNftInfosQuery](#proto-TokenGetNftInfosQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get metadata for all non-fungible/unique tokens (NFTs) of a single type within a range of indices (0-based count of minted tokens). |
| networkGetExecutionTime | [NetworkGetExecutionTimeQuery](#proto-NetworkGetExecutionTimeQuery) | **Deprecated.** This query is unsupported and SHALL fail.<br/> Requests for this information MUST be directed to a mirror node. <p> Get the execution time for a recent transaction. |
| accountDetails | [GetAccountDetailsQuery](#proto-GetAccountDetailsQuery) | Get detail metadata for an account. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



