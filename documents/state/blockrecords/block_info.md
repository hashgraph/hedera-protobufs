## Table of Contents

- [state/blockrecords/block_info.proto](#state_blockrecords_block_info-proto)
    - [BlockInfo](#proto-BlockInfo)
  



<a name="state_blockrecords_block_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/blockrecords/block_info.proto
# Block Information


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BlockInfo"></a>

### BlockInfo
Information for a transaction block.

This includes:
- last block number.
- consensus times for:
   - previous block start.
   - current block start.
   - last handled transaction.
- hash data for a rolling window of 256 blocks.
- whether migration records were produced.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| last_block_number | [int64](#int64) |  | The block number of the last completed immutable block. |
| first_cons_time_of_last_block | [Timestamp](#proto-Timestamp) |  | The consensus time of the first transaction for the last completed immutable block. |
| block_hashes | [bytes](#bytes) |  | The SHA384 48 byte hashes of the previous 256 blocks in single byte array.<br/> The first 48 bytes is the oldest block in the list.<br/> The last 48 bytes is the newest block, which is the last fully completed immutable block.<br/> This SHALL contain less than 256 block hashes if there are less than 256 preceding blocks; for instance, shortly after network genesis the network will not have processed 256 blocks yet. <p> This MAY change significantly for Block Stream (HIP TBD). |
| cons_time_of_last_handled_txn | [Timestamp](#proto-Timestamp) |  | The consensus time of the last transaction that was handled by the node within this block.<br/> This property is how we 'advance the consensus clock'. The node continually setts this property to the consensus timestamp for the most recent transaction completed by the node. |
| migration_records_streamed | [bool](#bool) |  | A flag indicating that migration records have been published.<br/> This property SHALL be `false` immediately following a node upgrade<br/> This SHALL be set 'true' as migration records, if any, are published. Migration records are typically published "during" the first transaction handled by the node following startup. |
| first_cons_time_of_current_block | [Timestamp](#proto-Timestamp) |  | The consensus time of the first transaction in the current block; necessary for reconnecting nodes to detect when the current block is finished. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


