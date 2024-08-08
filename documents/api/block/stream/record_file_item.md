## Table of Contents

- [stream/record_file_item.proto](#stream_record_file_item-proto)
    - [RecordFileItem](#com-hedera-hapi-block-stream-RecordFileItem)
  



<a name="stream_record_file_item-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/record_file_item.proto
# Record File Block
This block carries the data from "record stream" and "sidecar"
files that preceded the block stream. Record blocks are full blocks,
not block items, but do not have a block header or block proof.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-RecordFileItem"></a>

### RecordFileItem
A Block Item for record files.

A `RecordFileItem` contains data produced before the innovation of the
Block Stream, when data was stored in files and validated by individual
signature files rather than a block proof.<br/>
This item enables a single format, the Block Stream, to carry both
historical and current data; eliminating the need to search two sources for
block and block chain data.<br/>
Any block containing this item requires special handling.
- The block SHALL NOT have a `BlockHeader`.
- The block SHALL NOT have a `BlockProof`.
- The block SHALL contain _exactly one_ `RecordFileItem`.
- The block SHALL NOT contain any item other than a `RecordFileItem`.
- The content of the `RecordFileItem` MUST be validated using the
  signature data and content provided herein according to the
  process used for Record Files prior to the creation of Block Stream.
   - This block item only replaces the requirement to read several
     individual files from cloud storage services.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| number | [uint64](#uint64) |  | The block number of this block. <p> This value MUST be exactly `1` more than the previous block.<br/> Client systems SHOULD optimistically reject any block with a gap or reverse in `number` sequence, and MAY assume the block stream has encountered data loss, data corruption, or unauthorized modification. |
| creation_time | [proto.Timestamp](#proto-Timestamp) |  | The consensus time the record file was produced for.<br/> This comes from the record file name. |
| record_file_contents | [bytes](#bytes) |  | The contents of a record file.<br/> The first 4 bytes are a 32bit int little endian version number. The versions that existed are 2,3,5 and 6. |
| sidecar_file_contents | [bytes](#bytes) | repeated | The contents of sidecar files for this block.<br/> Each block can have zero or more sidecar files. |
| hash_algorithm | [proto.BlockHashAlgorithm](#proto-BlockHashAlgorithm) |  | A hash algorithm.<br/> This is the algorithm used to hash the block. <p> This SHOULD always be `SHA2_384`. |
| record_file_hash_signatures | [bytes](#bytes) | repeated | A collection of RSA signatures from consensus nodes.<br/> These signatures validate the hash of the record_file_contents field. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



