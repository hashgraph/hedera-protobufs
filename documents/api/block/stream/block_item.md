## Table of Contents

- [stream/block_item.proto](#stream_block_item-proto)
    - [BlockItem](#com-hedera-hapi-block-stream-BlockItem)
    - [FilteredItemHash](#com-hedera-hapi-block-stream-FilteredItemHash)
  



<a name="stream_block_item-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_item.proto
# Block Item
A single item in the block stream, such as transaction data, event metadata,
or a a system transaction.<br/>
Each block consists of a block header, one or more block items,
and a block state proof. Within the block are a series of events delimited
by start_event block items.

This structure here MUST support a stream of block items with no enclosing
message.<br/>
Implementations SHOULD behave in a reasonable manner if used in a gRPC
bidirectional streaming RPC similar to
`rpc processBlocks(stream BlockItem) returns (stream Acknowledgement);`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-BlockItem"></a>

### BlockItem
A single item within a block stream.

Each item in the block stream SHALL be self-contained and independent,
with the following constraints applicable to the _unfiltered_ stream.
- A block SHALL start with a `header`.
- A block SHALL end with a `state_proof`.
- A `block_header` SHALL be followed by an `event_header`.
- An `event_header` SHALL be followed by one or more
  `event_transaction` items.
- An `event_transaction` SHALL be followed by a `transaction_result`.
- A `transaction_result` MAY be followed by a `transaction_output`.
- A `transaction_result` (or a `transaction_output`, if present) MAY be
    followed by one or more `state_changes`.

This forms the following required sequence for each block, which is then
repeated within the block stream, indefinitely.  Note that there is no
container structure in the stream, the indentation below is only to
highlight repeated subsequences.<br/>
The order of items within each block below is REQUIRED and SHALL NOT change.

```text
header
  repeated {
    start_event
    repeated {
      event_transaction
      transaction_result
      (optional) transaction_output
      (optional) repeated state_changes
    }
  }
state_proof
```
A filtered stream may exclude some items above, depending on filter
criteria. A filtered item is replaced with a merkle path and hash value
to maintain block stream verifiability.

A BlockItem SHALL be individually and directly processed to create the
item hash.<br/>
Items to be hashed MUST NOT be contained within another item.<br/>
Items which might be filtered out of the stream MUST NOT be
contained in other items.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_header | [output.BlockHeader](#com-hedera-hapi-block-stream-output-BlockHeader) |  | An header for the block, marking the start of a new block. |
| event_header | [input.EventHeader](#com-hedera-hapi-block-stream-input-EventHeader) |  | An header emitted at the start of a new network "event". <p> This item SHALL contain the properties relevant to a single gossip event. |
| round_header | [input.RoundHeader](#com-hedera-hapi-block-stream-input-RoundHeader) |  | An header emitted at the start of a new consensus "round". <p> This item SHALL contain the properties relevant to a single consensus round. |
| event_transaction | [com.hedera.hapi.platform.event.EventTransaction](#com-hedera-hapi-platform-event-EventTransaction) |  | A single transaction. <p> This item SHALL contain the serialized bytes of a single transaction.<br/> Each event transaction SHALL be either a `SignedTransaction` or an internal system-generated transaction.<br/> This item MUST NOT contain data for more than one `SignedTransaction` or system-generated transaction. |
| transaction_result | [output.TransactionResult](#com-hedera-hapi-block-stream-output-TransactionResult) |  | The result of running a transaction. <p> This item SHALL be present immediately after an `event_transaction` item.<br/> This item MAY be redacted in some circumstances, and SHALL be replaced with a `filtered_item` if removed. |
| transaction_output | [output.TransactionOutput](#com-hedera-hapi-block-stream-output-TransactionOutput) |  | A transaction output. <p> This item MAY not be present if a transaction does not produce an output.<br/> If a transaction does produce an output that is not reflected in state changes, then this item MUST be present after the `transaction_result` for that transaction. |
| state_changes | [output.StateChanges](#com-hedera-hapi-block-stream-output-StateChanges) |  | A set of state changes. <p> All changes to values in network state SHALL be described by stream items of this type.<br/> The source of these state changes SHALL be described by the `reason` enumeration. |
| filtered_item_hash | [FilteredItemHash](#com-hedera-hapi-block-stream-FilteredItemHash) |  | Verification data for an item filtered from the stream.<br/> This is a hash for a merkle tree node where the contents of that part of the merkle tree have been removed from this stream. <p> Items of this type SHALL NOT be present in the full (unfiltered) block stream.<br/> Items of this type SHALL replace any item removed from a partial (filtered) block stream.<br/> Presence of `filtered_item` entries SHALL NOT prevent verification of a block, but MAY preclude verification or reconstruction of consensus state.<br/> |
| block_proof | [BlockProof](#com-hedera-hapi-block-stream-BlockProof) |  | A signed block proof.<br/> The signed merkle proof for this block. This will validate a "virtual" merkle tree containing the previous block "virtual" root, an "input" subtree, an "output" subtree, and a "state changes" subtree. <p> This item is not part of the block stream hash chain/tree, and MUST follow after the end of a block. |
| record_file | [RecordFileItem](#com-hedera-hapi-block-stream-RecordFileItem) |  | A record file and associated data. <p> This MUST contain a single Record file, associated Sidecar files, and data from related Signature files. If this item is present, special treatment is REQUIRED for this block. <ul> <li>The block SHALL NOT have a `BlockHeader`.</li> <li>The block SHALL NOT have a `BlockProof`.</li> <li>The block SHALL contain _exactly one_ `RecordFileItem`.</li> <li>The block SHALL NOT contain any item other than a `RecordFileItem`.</li> <li>The content of the `RecordFileItem` MUST be validated using the signature data and content provided within according to the process used for Record Files prior to the creation of Block Stream.</li> </ul> |






<a name="com-hedera-hapi-block-stream-FilteredItemHash"></a>

### FilteredItemHash
Verification data for an item filtered from the stream.

Items of this type SHALL NOT be present in the full (unfiltered) block
stream.<br/>
Items of this type SHALL replace any item removed from a partial (filtered)
block stream.<br/>
Presence of `filtered_item` entries SHALL NOT prevent verification
of a block, but MAY preclude verification or reconstruction
of consensus state.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item_hash | [bytes](#bytes) |  | A hash of an item filtered from the stream. <p> The hash algorithm used MUST match the hash algorithm specified in the block header for the containing block.<br/> This field is REQUIRED. |
| filtered_path | [uint64](#uint64) |  | A record of the merkle path to the item that was filtered from the stream.<br/> This path begins at the root of the block proof merkle tree. <p> This REQUIRED field SHALL describe the full path in the virtual merkle tree constructed for the block proof that contained the item filtered from the stream. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



