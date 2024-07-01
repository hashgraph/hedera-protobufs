## Table of Contents

- [stream/block_header.proto](#stream_block_header-proto)
    - [BlockHeader](#com-hedera-hapi-block-stream-BlockHeader)
  
    - [BlockHashAlgorithm](#com-hedera-hapi-block-stream-BlockHashAlgorithm)
  



<a name="stream_block_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_header.proto
# Block Header
The block header reports information required to correctly process a block.
This includes versions, block number, and algorithms used.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-BlockHeader"></a>

### BlockHeader
A Block Header.

Each block in the block stream SHALL begin with a block header.<br/>
The block header SHALL provide the base minimum information needed to
correctly interpret and process that block, or stop processing
if appropriate.<br/>
The block header MUST describe, at minimum, the following items.
 - The version of the block stream data
 - The block number
 - The hash of the previous block
 - The hash algorithm used to generate the block hash

All fields of this message are REQUIRED, with the exception that
`hash_algorithm` MAY be _transmitted_ as a default value to improve
data efficiency.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hapi_proto_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | Version of the HAPI specification that was used to serialize the block. |
| number | [uint64](#uint64) |  | The block number of this block. <p> This value MUST be exactly `1` more than the previous block.<br/> Client systems SHOULD optimistically reject any block with a gap or reverse in `number` sequence, and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. |
| previous_block_proof_hash | [bytes](#bytes) |  | The block proof hash for the previous block. <p> This value MUST match the block merkle tree root hash of the previous block in the block stream.<br/> This value SHALL be empty for the genesis block, and SHALL NOT be empty for any other block.<br/> Client systems SHOULD optimistically reject any block with a `previous_block_proof_hash` that does not match the block hash of the previous block and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. <p> The process for computing a block hash is somewhat complex, and involves creating a "virtual" merkle tree to obtain the root merkle hash of that virtual tree.<br/> The merkle tree SHALL have a 4 part structure with 2 internal nodes, structured in a strictly binary tree. <ul> <li>The merkle tree root SHALL be the parent of both internal nodes. <ol> <li>The first "internal" node SHALL be the parent of the two "left-most" nodes. <ol> <li>The first leaf MUST be the previous block hash, and is a single 48-byte value.</li> <li>The second leaf MUST be the root of a, strictly binary, merkle tree composed of all "input" block items in the block.<br/> Input items SHALL be transactions, system transactions, and events.<br/> Leaf nodes in this subtree SHALL be ordered in the same order that the block items are encountered in the stream.</li> </ol> </li> <li>The second "internal" node SHALL be the parent of the two "right-most" nodes.</li> <ol> <li>The third leaf MUST be the root of a, strictly binary, merkle tree composed of all "output" block items in the block.<br/> Output items SHALL be transaction result, transaction output, and state changes.<br/> Leaf nodes in this subtree SHALL be ordered in the same order that the block items are encountered in the stream.</li> <li>The fourth leaf MUST be the merkle tree root hash for network state at the end of the block, and is a single 48-byte value.</li> </ol> </li> </ol> </li> <li>The block hash SHALL be the SHA-384 hash calculated for the root of this merkle tree.</li> </ul> |
| hash_algorithm | [BlockHashAlgorithm](#com-hedera-hapi-block-stream-BlockHashAlgorithm) |  | The hash algorithm used in this block. |
| address_book_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | A version for the network address book.<br/> The address book version is needed to determine the correct public key(s) to use to validate block signatures and state proofs. <p> This MUST be the version of the address book that signed this block. |





 <!-- end messages -->


<a name="com-hedera-hapi-block-stream-BlockHashAlgorithm"></a>

### BlockHashAlgorithm
A specific hash algorithm used within a block.

We did not reuse HashAlgorithm here because in all cases for now it will
be `SHA_384` and if that is the default value then we can save space by
not serializing it, whereas `HASH_ALGORITHM_UNKNOWN` is the
default for HashAlgorithm.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SHA_384 | 0 | A SHA2 algorithm SHA-384 hash. <p> This is the default value, if a field of this enumerated type is not set, then this is the value that will be decoded when the serialized message is read. |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



