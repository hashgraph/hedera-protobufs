## Table of Contents

- [transaction_record.proto](#transaction_record-proto)
    - [PendingAirdropRecord](#proto-PendingAirdropRecord)
    - [TransactionRecord](#proto-TransactionRecord)
  



<a name="transaction_record-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_record.proto
# Transaction Record
The record of a single transaction, including receipt and transaction
results such as transfer lists, entropy, contract call result, etc...<br/>
The record also includes fees, consensus time, EVM information, and
other result metadata.<br/>
Only values appropriate to the requested transaction are populated, all
other fields will not be set (i.e. null or default values).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-PendingAirdropRecord"></a>

### PendingAirdropRecord
A record of a new pending airdrop.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pending_airdrop_id | [PendingAirdropId](#proto-PendingAirdropId) |  | A unique, composite, identifier for a pending airdrop. <p> This field is REQUIRED. |
| pending_airdrop_value | [PendingAirdropValue](#proto-PendingAirdropValue) |  | A single pending airdrop amount. <p> If the pending airdrop is for a fungible/common token this field is REQUIRED and SHALL be the current amount of tokens offered.<br/> If the pending airdrop is for a non-fungible/unique token, this field SHALL NOT be set. |






<a name="proto-TransactionRecord"></a>

### TransactionRecord
Response when the client sends the node TransactionGetRecordResponse


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| receipt | [TransactionReceipt](#proto-TransactionReceipt) |  | A transaction receipt. <p> This SHALL report consensus status (reach consensus, failed, unknown) and the ID of any new entity (i.e. account, file, contract, schedule, etc...) created. |
| transactionHash | [bytes](#bytes) |  | A transaction hash value. <p> This SHALL be the hash of the Transaction that executed and SHALL NOT be the hash of any Transaction that failed for having a duplicate TransactionID. |
| consensusTimestamp | [Timestamp](#proto-Timestamp) |  | A consensus timestamp. <p> This SHALL be null if the transaction did not reach consensus yet. |
| transactionID | [TransactionID](#proto-TransactionID) |  | A transaction identifier to the transaction associated to this record. |
| memo | [string](#string) |  | A transaction memo.<br/> This is the memo that was submitted as part of the transaction. <p> This value, if set, SHALL NOT exceed 100 bytes when encoded as UTF-8. |
| transactionFee | [uint64](#uint64) |  | A transaction fee charged. <p> This SHALL be the actual transaction fee charged.<br/> This MAY NOT match the original `transactionFee` value from the `TransactionBody`. |
| contractCallResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | A contract call result.<br/> A record of the value returned by the smart contract function (if it completed and didn't fail) from a `ContractCallTransaction`. |
| contractCreateResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | A contract creation result.<br/> A record of the value returned by the smart contract constructor (if it completed and didn't fail) from a `ContractCreateTransaction`. |
| transferList | [TransferList](#proto-TransferList) |  | A transfer list for this transaction.<br/> This is a list of all HBAR transfers completed for this transaction. <p> This MAY include fees, transfers performed by the transaction, transfers initiated by a smart contract it calls, or the creation of threshold records that it triggers. |
| tokenTransferLists | [TokenTransferList](#proto-TokenTransferList) | repeated | A token transfer list for this transaction.<br/> This is a list of all non-HBAR token transfers completed for this transaction.<br/> |
| scheduleRef | [ScheduleID](#proto-ScheduleID) |  | A schedule reference.<br/> The reference to a schedule ID for the schedule that initiated this transaction, if this this transaction record represents a scheduled transaction. |
| assessed_custom_fees | [AssessedCustomFee](#proto-AssessedCustomFee) | repeated | A list of all custom fees that were assessed during a CryptoTransfer. <p> These SHALL be paid if the transaction status resolved to SUCCESS. |
| automatic_token_associations | [TokenAssociation](#proto-TokenAssociation) | repeated | A list of all token associations implicitly or automatically created while handling this transaction. |
| parent_consensus_timestamp | [Timestamp](#proto-Timestamp) |  | A consensus timestamp for a child record. <p> This SHALL be the consensus timestamp of a user transaction that spawned an internal child transaction. |
| alias | [bytes](#bytes) |  | A new account alias.<br/> <p> This is the new alias assigned to an account created as part of a CryptoCreate transaction triggered by a user transaction with a (previously unused) alias. |
| ethereum_hash | [bytes](#bytes) |  | A keccak256 hash of the ethereumData. <p> This field SHALL only be populated for EthereumTransaction. |
| paid_staking_rewards | [AccountAmount](#proto-AccountAmount) | repeated | A list of staking rewards paid. <p> This SHALL be a list accounts with the corresponding staking rewards paid as a result of this transaction. |
| prng_bytes | [bytes](#bytes) |  | A pseudorandom 384-bit sequence. <p> This SHALL be returned in the record of a UtilPrng transaction with no output range, |
| prng_number | [int32](#int32) |  | A pseudorandom 32-bit integer.<br/> <p> This SHALL be returned in the record of a PRNG transaction with an output range specified. |
| evm_address | [bytes](#bytes) |  | A new default EVM address for an account created by this transaction. <p> This field SHALL be populated only when the EVM address is not specified in the related transaction body. |
| new_pending_airdrops | [PendingAirdropRecord](#proto-PendingAirdropRecord) | repeated | A list of pending token airdrops. <p> Each pending airdrop SHALL represent a single requested transfer from a sending account to a recipient account.<br/> These pending transfers are issued unilaterally by the sending account, and MUST be claimed by the recipient account before the transfer SHALL complete.<br/> A sender MAY cancel a pending airdrop before it is claimed.<br/> An airdrop transaction SHALL emit a pending airdrop when the recipient has no available automatic association slots available or when the recipient has set `receiver_sig_required`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



