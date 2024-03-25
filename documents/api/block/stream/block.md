## Table of Contents

- [stream/block.proto](#stream_block-proto)
    - [Block](#com-hedera-hapi-block-stream-Block)
  



<a name="stream_block-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block.proto
# Block Stream
The base element of the block stream _at rest_.
A `Block` contains a record of all transactions, results, and outputs for a block in the chain.
Each `Block` also contains a state proof for validation and a header with version and
algorithm information.

Block entries are not designed for streaming, but for storing blocks in persistent
storage, verifying block stream data, and as query responses when a block is
requested from a block node.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-Block"></a>

### Block
A single complete Hedera block chain block.

This is a single block structure and SHALL NOT represent the primary mechanism to
transmit a block stream.<br/>
The primary mechanism for transmitting block stream data SHALL be to stream individual
block items to the block node(s).<br/>
The only delimiter between blocks when streamed SHALL be the `BlockHeader` item and
`BlockStateProof` item.

This block SHALL be verifiable as correct using only data in the block,
including the `BlockStateProof`, and public keys for the consensus nodes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| items | [BlockItem](#com-hedera-hapi-block-stream-BlockItem) | repeated | A list of items that, together, make up this block. <p> This list SHALL begin with a `BlockHeader`.<br/> This list SHALL end with a `BlockStateProof`.<br/> Items in this list SHALL be in exactly the same order produced by consensus.<br/> Items in this list MAY be filtered, if so requested.<br/> If this list is filtered, removed items SHALL be replaced with `FilteredBlockItem` entries.<br/> |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



