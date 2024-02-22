## Table of Contents

- [transaction_receipt.proto](#transaction_receipt-proto)
    - [TransactionReceipt](#proto-TransactionReceipt)
  



<a name="transaction_receipt-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_receipt.proto
# Transaction Receipt
The receipt returned when the results of a transaction are requested via `TransactionGetReceiptQuery`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionReceipt"></a>

### TransactionReceipt
The summary of a transaction's result so far. If the transaction has not reached consensus, this
result will be necessarily incomplete.
<p>
Most items in this object are only set for specific transactions.  Those values SHALL be unset
for all other transactions.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | The consensus status of the transaction.<br/> This SHALL be `UNKNOWN` if consensus has not been reached.<br/> This SHALL be `UNKNOWN` if the associated transaction did not have a valid payer signature. |
| accountID | [AccountID](#proto-AccountID) |  | In the receipt of a `CryptoCreate`, the id of the newly created account. |
| fileID | [FileID](#proto-FileID) |  | In the receipt of a `FileCreate`, the id of the newly created file. |
| contractID | [ContractID](#proto-ContractID) |  | In the receipt of a `ContractCreate`, the id of the newly created contract. |
| exchangeRate | [ExchangeRateSet](#proto-ExchangeRateSet) |  | The exchange rates in effect when the transaction reached consensus. |
| topicID | [TopicID](#proto-TopicID) |  | In the receipt of a `ConsensusCreateTopic`, the id of the newly created topic. |
| topicSequenceNumber | [uint64](#uint64) |  | In the receipt of a `ConsensusSubmitMessage`, the new sequence number for the topic that received the message. |
| topicRunningHash | [bytes](#bytes) |  | In the receipt of a `ConsensusSubmitMessage`, the new running hash of the topic that received the message.<br/> This 48-byte field is the output of a SHA-384 digest with input data determined by the value of the `topicRunningHashVersion` field.<br/> All new transactions SHALL use `topicRunningHashVersion` `3`.<br/> The bytes of each uint64 or uint32 encoded for the hash input MUST be in Big-Endian format. <p> <hr/> If the `topicRunningHashVersion` is '0' or '1', then the input data to the SHA-384 digest are, in order: <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topicSequenceNumber` (8 bytes)</li> <li>The message bytes from the `ConsensusSubmitMessage` (variable).</li> </ol> <hr/> If the `topicRunningHashVersion` is '2', then the input data to the SHA-384 digest are, in order: <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topicRunningHashVersion` (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topicSequenceNumber` (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> <hr/> If the `topicRunningHashVersion` is '3', then the input data to the SHA-384 digest are, in order: <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topicRunningHashVersion` (8 bytes)</li> <li>The payer account's shard (8 bytes)</li> <li>The payer account's realm (8 bytes)</li> <li>The payer account's number (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topicSequenceNumber` (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> |
| topicRunningHashVersion | [uint64](#uint64) |  | In the receipt of a `ConsensusSubmitMessage`, the version of the SHA-384 digest inputs used to update the running hash. |
| tokenID | [TokenID](#proto-TokenID) |  | In the receipt of a CreateToken, the id of the newly created token |
| newTotalSupply | [uint64](#uint64) |  | In the receipt of TokenMint, TokenWipe, TokenBurn.<br/> For non-unique tokens, the current total supply of that token. For unique tokens,the total number of NFTs issued for that token. |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | In the receipt of a ScheduleCreate, the id of the newly created Scheduled Entity |
| scheduledTransactionID | [TransactionID](#proto-TransactionID) |  | In the receipt of a ScheduleCreate or ScheduleSign that enables the scheduled transaction to execute immediately, the TransactionID that should be used to query for the receipt or record of the scheduled transaction that was executed. |
| serialNumbers | [int64](#int64) | repeated | In the receipt of a TokenMint for `unique` tokens, the serial numbers of the newly created tokens. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


