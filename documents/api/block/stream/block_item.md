## Table of Contents

- [stream/block_item.proto](#stream_block_item-proto)
    - [BlockItem](#proto-BlockItem)
    - [TransactionItem](#proto-TransactionItem)
  



<a name="stream_block_item-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_item.proto
# Block Item
A single item in the block stream, such as transaction data, event metadata, or a
a system transaction.

Each block consists of a block header, one or more block items,
and a block state proof. Within the block items are a series of events delimited
by start_event block items.

> Note
>> the existing structure here seems overly flexible. An alternative is proposed which
   intends to move the transaction items (which are required in strict order and
   to be all present or none present) to a separate item, and moves the header and state
   proof up to the block.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BlockItem"></a>

### BlockItem



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#proto-BlockHeader) |  | The header of the block, marking the start of a new block. <blockquote>REVIEW NOTE<blockquote> Should this be in the `Block`? It seems like each block should include exactly one header and exactly one state proof...</blockquote></blockquote> |
| start_event | [EventMetadata](#proto-EventMetadata) |  | The start of a new event. |
| system_transaction | [SystemTransaction](#proto-SystemTransaction) |  | A system transaction. |
| transaction | [Transaction](#proto-Transaction) |  | A raw non-system transaction. A `transaction` block item is always followed by `transaction_result`, `transaction_output` and `state_changes` in that order. <blockquote>REVIEW NOTE<blockquote> Should we have a separate message that is just a `Transaction`, `TransactionResult`, `TransactionOutput`, and `StateChanges` combined?<br/> It seems like these four are _always_ combined and strictly ordered, so why not just have a single message that combines the four rather than relying on software to consistently add all four in strict order?</blockquote></blockquote> |
| transaction_result | [TransactionResult](#proto-TransactionResult) |  | The result of running a transaction. |
| transaction_output | [TransactionOutput](#proto-TransactionOutput) |  | The transaction output. |
| state_changes | [StateChanges](#proto-StateChanges) |  | The state changes. The type of state changes is determined by the reason enum in StateChanges. |
| transaction_data | [TransactionItem](#proto-TransactionItem) |  | ==================== SUGGESTED ITEM ==================== A combination of `Transaction`, `TransactionResult`, `TransactionOutput`, and `StateChanges`. This ensures that these four tightly coupled items are always included together. This replaces the prior mechanism which wrote them separately but in immediate succession and in strict order. |
| state_proof | [BlockStateProof](#proto-BlockStateProof) |  | State Proof of running hash <blockquote>REVIEW NOTE<blockquote> Should this be in the `Block`? It seems like each block should include exactly one header and exactly one state proof...</blockquote></blockquote> |






<a name="proto-TransactionItem"></a>

### TransactionItem
A block stream item representing single a user-initiated transaction and its
associated results, outputs, and changes.

All fields are REQUIRED.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transaction_bytes | [Transaction](#proto-Transaction) |  | A raw transaction. This is just a legacy container for bytes representing a serialized `SignedTransaction`. <blockquote>REVIEW NOTE<blockquote> Perhaps we should include the `SignedTransaction` here instead. That would create some issues with old data (before the transaction format changed), but I believe we could reprocess those to match this format if needed. </blockquote></blockquote> |
| transaction_result | [TransactionResult](#proto-TransactionResult) |  | The result of running a transaction. |
| transaction_output | [TransactionOutput](#proto-TransactionOutput) |  | A transaction output. |
| state_changes | [StateChanges](#proto-StateChanges) |  | A set of state changes.<br/> The structure of state changes is determined by the reason field in StateChanges. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



