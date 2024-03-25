## Table of Contents

- [stream/block.proto](#stream_block-proto)
    - [Block](#proto-Block)
  



<a name="stream_block-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block.proto
# Block Stream
The base element of the block stream, a `Block` contains a record of all transactions,
results, and outputs for a block in the chain.  Each `Block` also contains a state proof
for validation and a header with version and algorithm information.


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Block"></a>

### Block
Block is used to serialize all the data for a block into a stream of
blocks. This structure represents a block on an Hedera block chain.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| items | [BlockItem](#proto-BlockItem) | repeated | A list of items that, together, make up this block. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



