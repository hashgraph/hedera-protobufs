## Table of Contents

- [stream/transaction_result.proto](#stream_transaction_result-proto)
    - [TransactionResult](#proto-TransactionResult)
  



<a name="stream_transaction_result-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/transaction_result.proto
#


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionResult"></a>

### TransactionResult



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | The response code that indicates the current status of the transaction. |
| consensus_timestamp | [Timestamp](#proto-Timestamp) |  | The consensus timestamp of the transaction. |
| parent_consensus_timestamp | [Timestamp](#proto-Timestamp) |  | In the record of an internal transaction, the consensus timestamp of the user transaction that spawned it. |
| exchange_rate | [ExchangeRateSet](#proto-ExchangeRateSet) |  | The exchange rates in effect when the transaction reached consensus. |
| transaction_fee_charged | [uint64](#uint64) |  | The actual transaction fee charged, not the original transactionFee value from TransactionBody. |
| transfer_list | [TransferList](#proto-TransferList) |  | All hbar transfers as a result of this transaction, such as fees, or transfers performed by the transaction, or by a smart contract it calls, or by the creation of threshold records that it triggers. |
| token_transfer_lists | [TokenTransferList](#proto-TokenTransferList) | repeated | All Token transfers as a result of this transaction. |
| automatic_token_associations | [TokenAssociation](#proto-TokenAssociation) | repeated | All token associations implicitly created while handling this transaction. |
| paid_staking_rewards | [AccountAmount](#proto-AccountAmount) | repeated | List of accounts with the corresponding staking rewards paid as a result of a transaction. |
| congestion_pricing_multiplier | [uint64](#uint64) |  | Congestion pricing multiplier at the time the transaction was executed. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



