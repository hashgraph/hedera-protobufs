## Table of Contents

- [state/blockrecords/block_info.proto](#state_blockrecords_block_info-proto)
    - [BlockInfo](#proto-BlockInfo)
  



<a name="state_blockrecords_block_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/blockrecords/block_info.proto



<a name="proto-BlockInfo"></a>

### BlockInfo
Information about ongoing, most recently completed, and last 256 blocks.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| last_block_number | [int64](#int64) |  | The last block number, this is the last completed immutable block. |
| first_cons_time_of_last_block | [Timestamp](#proto-Timestamp) |  | The consensus time of the first transaction of the last block, this is the last completed immutable block. |
| block_hashes | [bytes](#bytes) |  | SHA384 48 byte hashes of the last 256 blocks in single byte array. First 48 bytes is the oldest block. Last 48 bytes is the newest block, which is the last fully completed immutable block. If we are shortly after genesis and there are less than 256 blocks then this could contain less than 256 hashes. |
| cons_time_of_last_handled_txn | [Timestamp](#proto-Timestamp) |  | The consensus time of the last transaction that was handled by the node. This property is how we 'advance the consensus clock', i.e. continually setting this property to the latest consensus timestamp (and thus transaction) handled by the node. |
| migration_records_streamed | [bool](#bool) |  | A flag indicating whether migration records have been published. This property should be marked 'false' immediately following a node upgrade, and marked 'true' once the migration records (if any) are published, which should happen during the first transaction handled by the node. |
| first_cons_time_of_current_block | [Timestamp](#proto-Timestamp) |  | The consensus time of the first transaction in the current block; necessary for reconnecting nodes to detect when the current block is finished. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


