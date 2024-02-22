## Table of Contents

- [transaction_record.proto](#transaction_record-proto)
    - [TransactionRecord](#proto-TransactionRecord)
  



<a name="transaction_record-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_record.proto
# Transaction Record
The record of a single transaction, including receipt and transaction results such as
transfer lists, entropy, contract call result, etc...
The record also includes fees, consensus time, EVM information, and other result metadata.<br/>
Only values appropriate to the requested transaction are populated, all other fields will not be
set (i.e. null or default values).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionRecord"></a>

### TransactionRecord
Response when the client sends the node TransactionGetRecordResponse


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| receipt | [TransactionReceipt](#proto-TransactionReceipt) |  | The status (reach consensus, or failed, or is unknown) and the ID of any new account/file/instance created. |
| transactionHash | [bytes](#bytes) |  | The hash of the Transaction that executed (not the hash of any Transaction that failed for having a duplicate TransactionID) |
| consensusTimestamp | [Timestamp](#proto-Timestamp) |  | The consensus timestamp (or null if didn't reach consensus yet) |
| transactionID | [TransactionID](#proto-TransactionID) |  | The ID of the transaction this record represents |
| memo | [string](#string) |  | The memo that was submitted as part of the transaction, decoded to a string. |
| transactionFee | [uint64](#uint64) |  | The actual transaction fee charged, not the original transactionFee value from TransactionBody |
| contractCallResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | Record of the value returned by the smart contract function (if it completed and didn't fail) from ContractCallTransaction |
| contractCreateResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | Record of the value returned by the smart contract constructor (if it completed and didn't fail) from ContractCreateTransaction |
| transferList | [TransferList](#proto-TransferList) |  | All HBAR transfers as a result of this transaction, such as fees, or transfers performed by the transaction, or by a smart contract it calls, or by the creation of threshold records that it triggers. |
| tokenTransferLists | [TokenTransferList](#proto-TokenTransferList) | repeated | All Token transfers as a result of this transaction |
| scheduleRef | [ScheduleID](#proto-ScheduleID) |  | Reference to the scheduled transaction ID that this transaction record represent |
| assessed_custom_fees | [AssessedCustomFee](#proto-AssessedCustomFee) | repeated | All custom fees that were assessed during a CryptoTransfer, and must be paid if the transaction status resolved to SUCCESS |
| automatic_token_associations | [TokenAssociation](#proto-TokenAssociation) | repeated | All token associations implicitly created while handling this transaction |
| parent_consensus_timestamp | [Timestamp](#proto-Timestamp) |  | In the record of an internal transaction, the consensus timestamp of the user transaction that spawned it. |
| alias | [bytes](#bytes) |  | In the record of a CryptoCreate transaction triggered by a user transaction with a (previously unused) alias, the new account's alias. |
| ethereum_hash | [bytes](#bytes) |  | The keccak256 hash of the ethereumData. This field will only be populated for EthereumTransaction. |
| paid_staking_rewards | [AccountAmount](#proto-AccountAmount) | repeated | List of accounts with the corresponding staking rewards paid as a result of a transaction. |
| prng_bytes | [bytes](#bytes) |  | In the record of a UtilPrng transaction with no output range, a pseudorandom 384-bit sequence. |
| prng_number | [int32](#int32) |  | In the record of a PRNG transaction with an output range, the output of a PRNG whose input was a 384-bit sequence. |
| evm_address | [bytes](#bytes) |  | The new default EVM address of the account created by this transaction. This field is populated only when the EVM address is not specified in the related transaction body. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


