## Table of Contents

- [stream/output/transaction_result.proto](#stream_output_transaction_result-proto)
    - [TransactionResult](#com-hedera-hapi-block-stream-output-TransactionResult)
  



<a name="stream_output_transaction_result-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/transaction_result.proto
# Transaction Result
The result of a transaction, sometimes called a receipt.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-TransactionResult"></a>

### TransactionResult
While we have the state changes as part of the block stream,
we may not have the full data set needed. To surface information
such as staking rewards, fees, etc. we need to include some of the
data from the original TransactionRecord.

> REVIEW NOTE
>> Should we have custom fees here, and remove that from the
>> CryptoTransfer output message? That would make more sense, as I believe
>> TokenTransfer output would also need custom fees, and we may wish
>> to add custom fees to other transactions in the future.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [proto.ResponseCodeEnum](#proto-ResponseCodeEnum) |  | A response code. <p> This value SHALL indicate the status of this transaction.<br/> This code SHALL indicate success or a specific failure. |
| consensus_timestamp | [proto.Timestamp](#proto-Timestamp) |  | A consensus timestamp. <p> The time index, agreed by all network nodes, when this transaction reached consensus.<br/> This field SHALL be set for all transactions. |
| parent_consensus_timestamp | [proto.Timestamp](#proto-Timestamp) |  | A consensus timestamp. <p> The time index, agreed by all network nodes, when the "parent" transaction, if any, for this transaction reached consensus.<br/> This SHALL NOT be set on a user-submitted transaction.<br/> This SHALL be set on an internal "child" transaction initiated as part of completing a user-submitted transaction. |
| exchange_rate | [proto.ExchangeRateSet](#proto-ExchangeRateSet) |  | An exchange rate set. <p> This field SHALL describe the exchange rates in effect when this transaction reached consensus. |
| schedule_ref | [proto.ScheduleID](#proto-ScheduleID) |  | A schedule that executed this transaction, if this transaction was scheduled. <p> This value SHALL NOT be set unless this transaction result represents the result of a _scheduled_ child transaction. |
| transaction_fee_charged | [uint64](#uint64) |  | An amount, in tinybar, charged for this transaction. <p> This SHALL be the actual transaction fee charged, and SHALL NOT be the transactionFee value from TransactionBody. |
| transfer_list | [proto.TransferList](#proto-TransferList) |  | A list of HBAR transfers, in double-entry form. <p> This SHALL include all HBAR transfers completed as a result of this transaction.<br/> This MUST include, at least, <ul> <li>Each source and recipient of transaction fees</li> <li>All transfers directly performed by this transaction</li> <li>All transfers due to staking rewards paid as a result of this transaction</li> <li>Any transfers performed by a smart contract call associated with this transaction</li> <li>Any transfers caused by the creation of threshold records</li> </ul> <p> This transfer list is exposed in the Mirror Node API (MAPI) and in use by clients of the MAPI. Additionally, there are some transfers that are mingled with transactions and only split out here. |
| token_transfer_lists | [proto.TokenTransferList](#proto-TokenTransferList) | repeated | A list of _non-HBAR_ token transfers, in single-entry form. <p> This SHALL include all _non-HBAR_ token transfers completed as a result of this transaction.<br/> This MUST include, at least, <ul> <li>Each source and recipient of custom fees</li> <li>All transfers directly performed by this transaction</li> <li>Any transfers performed by a smart contract call associated with this transaction</li> </ul> |
| automatic_token_associations | [proto.TokenAssociation](#proto-TokenAssociation) | repeated | A list of token associations. <p> This field SHALL list all token associations created automatically while handling this transaction. |
| paid_staking_rewards | [proto.AccountAmount](#proto-AccountAmount) | repeated | A list of accounts and amounts. <p> This SHALL list all accounts paid staking rewards as a result of this transaction.<br/> Each entry SHALL contain both the account and the amount paid. |
| congestion_pricing_multiplier | [uint64](#uint64) |  | A congestion pricing multiplier. <p> This SHALL be the multiplier that is applied to the transaction fees charged for this transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



