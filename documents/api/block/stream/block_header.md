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
| start_running_hash | [bytes](#bytes) |  | The running hash of the previous block. <p> This value MUST match the block hash of the previous block in the block stream.<br/> This value SHALL be empty for the genesis block, and SHALL NOT be empty for any other block.<br/> Client systems SHOULD optimistically reject any block with a `start_running_hash` that does not match the block hash of the previous block and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. |
| hash_algorithm | [BlockHashAlgorithm](#com-hedera-hapi-block-stream-BlockHashAlgorithm) |  | The hash algorithm used in this block. |





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



