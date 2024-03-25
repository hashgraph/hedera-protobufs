## Table of Contents

- [stream/block_header.proto](#stream_block_header-proto)
    - [BlockHeader](#proto-BlockHeader)
  
    - [BlockHashAlgorithm](#proto-BlockHashAlgorithm)
    - [BlockSignatureAlgorithm](#proto-BlockSignatureAlgorithm)
  



<a name="stream_block_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_header.proto
# Block Header
The block header reports information required to correctly process a block.  This includes
versions, block number, and algorithms used.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BlockHeader"></a>

### BlockHeader
A Block Header.

Each block in the block stream SHALL begin with a block header.<br/>
The block header SHALL provide the base minimum information needed to correctly interpret
and process that block, or stop processing if appropriate.<br/>
The block header MUST describe, at minimum, the following items.
 - The version of the block stream data
 - The Hedera API version
 - The Hedera Services version
 - The Hedera Platform version
 - The block number
 - The hash algorithm used to generate the block hash
 - The digital signature algorithm used to sign the block hash

All fields of this message are REQUIRED, with the exception that the _algorithms_ MAY
be _transmitted_ as a default value to improve data efficiency.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_version | [SemanticVersion](#proto-SemanticVersion) |  | Version of the protobuf schema used to serialize the block. |
| hapi_proto_version | [SemanticVersion](#proto-SemanticVersion) |  | Version of HAPI that was used to serialize the block. |
| services_version | [SemanticVersion](#proto-SemanticVersion) |  | Version of Services that was used to produce the block. |
| platform_version | [SemanticVersion](#proto-SemanticVersion) |  | Version platform that was used to serialize the block. |
| number | [uint64](#uint64) |  | The block number of this block.<br/> This value MUST be exactly `1` more than the previous block.<br/> Client systems SHOULD optimistically reject any block with a gap or reverse in `number` sequence, and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. |
| start_running_hash | [bytes](#bytes) |  | The running hash of the previous block.<br/> This value MUST match the block hash of the previous block in the block stream.<br/> This value SHALL be empty for the genesis block, and SHALL NOT be empty for any other block.<br/> Client systems SHOULD optimistically reject any block with a `start_running_hash` that does not match the block hash of the previous block and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. |
| hash_algorithm | [BlockHashAlgorithm](#proto-BlockHashAlgorithm) |  | The hash algorithm used in this block. |
| signature_algorithm | [BlockSignatureAlgorithm](#proto-BlockSignatureAlgorithm) |  | The signature algorithm used in this block. |





 <!-- end messages -->


<a name="proto-BlockHashAlgorithm"></a>

### BlockHashAlgorithm
A specific hash algorithm used within a block.

We did not reuse HashAlgorithm here because in all cases for now it will be `SHA_384` and
if that is the default value then we can save space by not serializing it, whereas
`HASH_ALGORITHM_UNKNOWN` is the default for HashAlgorithm.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SHA_384 | 0 |  |



<a name="proto-BlockSignatureAlgorithm"></a>

### BlockSignatureAlgorithm
A specific signature algorithm used within a block.

We did not reuse SignatureType here because in all cases for now it will be `SHA_384_WITH_RSA`
and if that is the default value then we can save space by not serializing it, whereas
`SIGNATURE_TYPE_UNKNOWN` is the default for SignatureType.

> REVIEW NOTE
>> If space is a premium, why are we using RSA signatures?  RSA is 2048 or 4096 bits (the latter strongly
>> recommended for security).  EdDSA is 512 (ed25519) or 912 (ed448) bits, faster to compute,
>> and _more secure_. Here we increase complexity to save a single byte (8 bits), while using
>> EdDSA would save at least 142 bytes (2048-912=1136 bits), and might save 448 bytes(4096-512=3584 bits)...

| Name | Number | Description |
| ---- | ------ | ----------- |
| SHA_384_WITH_RSA | 0 |  |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



