## Table of Contents

- [stream/block_item.proto](#stream_block_item-proto)
    - [BlockItem](#com-hedera-hapi-block-stream-BlockItem)
    - [FilteredBlockItem](#com-hedera-hapi-block-stream-FilteredBlockItem)
  



<a name="stream_block_item-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_item.proto
# Block Item
A single item in the block stream, such as transaction data, event metadata, or a
a system transaction.

Each block consists of a block header, one or more block items,
and a block state proof. Within the block are a series of events delimited
by start_event block items.

This structure here MUST support a stream of block items with no enclosing message.<br/>
The design SHOULD be reasonable if used in a gRPC bidirectional streaming RPC similar to
`rpc processBlockStream(stream BlockItem) returns (stream BlockAcknowledgement);`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-BlockItem"></a>

### BlockItem
A single item within a block stream.

Each item in the block stream SHALL be self-contained and independent, with the following
constraints applicable to the _unfiltered_ stream.
- A block SHALL start with a `header`.
- A block SHALL end with a `state_proof`.
- A `header` SHALL be followed by a `start_event`.
- A `start_event` SHALL be followed by one or more `system_transaction` or `transaction` items.
- A `transaction` SHALL be followed by a `transaction_result`.
- A `transaction_result` MAY be followed by a `transaction_output`.
- A `transaction_result` (or a `transaction_output`, if present) MAY be
    followed by a `state_changes`.

This forms the following required sequence for each block, which is then repeated within the
block stream, indefinitely.  Note that there is no container structure in the stream,
the indentation below is only to highlight repeated subsequences. The order of items
within each block below is REQUIRED and SHALL NOT change.

```text
header
  repeated {
    start_event
    repeated {
      (optional) repeated system_transaction
      transaction
      transaction_result
      (optional) transaction_output
      (optional) state_changes
    }
  }
state_proof
```
A filtered stream may exclude some items above, depending on filter criteria.  A filtered
item is replaced with its merkle path to maintain block stream verifiability.

A BlockItem SHALL be individually and directly processed to create the running hash.
Items to be hashed MUST NOT be contained within another item, and items which might be
filtered out of the stream MUST NOT be contained in other items.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#com-hedera-hapi-block-stream-BlockHeader) |  | A header for the block, marking the start of a new block. |
| start_event | [EventMetadata](#com-hedera-hapi-block-stream-EventMetadata) |  | An item emitted at the start of a new network "event".<br/> |
| system_transaction | [SystemTransaction](#com-hedera-hapi-block-stream-SystemTransaction) |  | A system transaction.<br/> This item MAY be removed as the platform removes the concept. |
| transaction | [proto.Transaction](#proto-Transaction) |  | A raw network transaction.<br/> A raw transaction is just a legacy container for bytes representing a serialized `SignedTransaction`. |
| transaction_result | [TransactionResult](#com-hedera-hapi-block-stream-TransactionResult) |  | The result of running a transaction.<br/> This item SHALL be present immediately after a `transaction` item.<br/> This item MAY be redacted in some circumstances, and SHALL be replaced with a `filtered_item` if removed. |
| transaction_output | [TransactionOutput](#com-hedera-hapi-block-stream-TransactionOutput) |  | The transaction output.<br/> This item MAY not be present if a transaction does not produce an output.<br/> If a transaction does produce an output that is not reflected in state changes, then this item MUST be present after the `transaction_result` for that transaction. |
| state_changes | [StateChanges](#com-hedera-hapi-block-stream-StateChanges) |  | A set of state changes.<br/> All changes to values in network state SHALL be described by stream items of this type.<br/> The source of these state changes SHALL be described by the `reason` enumeration. |
| state_proof | [BlockStateProof](#com-hedera-hapi-block-stream-BlockStateProof) |  | A State Proof for the BlockInfo node in the network state at the end of this block.<br/> This item is not part of the block stream hash chain/tree, and marks the end of a block. |
| filtered_item | [FilteredBlockItem](#com-hedera-hapi-block-stream-FilteredBlockItem) |  | Verification data for an item filtered from the stream.<br/> Items of this type SHALL NOT be present in the full (unfiltered) block stream.<br/> Items of this type SHALL replace any item removed from a partial (filtered) block stream.<br/> Presence of `filtered_item` entries SHALL NOT prevent verification of a block, but MAY preclude verification or reconstruction of consensus state.<br/> |






<a name="com-hedera-hapi-block-stream-FilteredBlockItem"></a>

### FilteredBlockItem
Verification data for an item filtered from the stream.

> Note:
>> This may change. We are exploring options that may change this value to work with,
>> merkle hashing rather than a running hash chain; the change is expected to
>> improve some forms of verification and resolve edge cases with running hashes.

Items of this type SHALL NOT be present in the full (unfiltered) block stream.<br/>
Items of this type SHALL replace any item removed from a partial (filtered)
block stream.<br/>
Presence of `filtered_item` entries SHALL NOT prevent verification of a block, but
MAY preclude verification or reconstruction of consensus state.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item_hash | [bytes](#bytes) |  | A SHA-384 hash of an item filtered from the stream. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



