## Table of Contents

- [state/blockstream/block_stream_info.proto](#state_blockstream_block_stream_info-proto)
    - [BlockStreamInfo](#com-hedera-hapi-node-state-blockstream-BlockStreamInfo)
  



<a name="state_blockstream_block_stream_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/blockstream/block_stream_info.proto
# Block Stream Info
Information stored in consensus state at the beginning of each block to
record the status of the immediately prior block.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-node-state-blockstream-BlockStreamInfo"></a>

### BlockStreamInfo
A message stored in state to maintain block stream parameters.<br/>
Nodes use this information for three purposes.
1. To maintain hash chain continuity at restart and reconnect boundaries.
1. To store historical hashes for implementation of the EVM `BLOCKHASH`
   and `PREVRANDAO` opcodes.
1. To track the amount of consensus time that has passed between blocks.

This value MUST be updated for every block.<br/>
This value MUST be transmitted in the "state changes" section of
_each_ block, but MUST be updated at the beginning of the _next_ block.<br/>
This value SHALL contain the block hash up to, and including, the
immediately prior completed block.<br/>
The state change to update this singleton MUST be the last
block item in this block.


| Field | Type | Description |
| ----- | ---- | ----------- |
| block_number | [uint64](#uint64) | A block number.<br/> This is the current block number. |
| block_time | [proto.Timestamp](#proto-Timestamp) | A consensus time for the current block.<br/> This is the consensus time of the first round in the current block, and is used to determine if this block was the first across an important boundary in consensus time, such as UTC midnight. This may also be used to purge entities expiring between the last block time and this time. |
| trailing_output_hashes | [bytes](#bytes) | A concatenation of hash values.<br/> This combines several trailing output block item hashes and is used as a seed value for a pseudo-random number generator.<br/> This is also required to implement the EVM `PREVRANDAO` opcode.<br/> This MUST contain at least 256 bits of entropy. |
| trailing_block_hashes | [bytes](#bytes) | A concatenation of hash values.<br/> This field combines up to 256 trailing block hashes. <p> If this message is for block number N, then the earliest available hash SHALL be for block number N-256.<br/> The latest available hash SHALL be for block N-1.<br/> This is REQUIRED to implement the EVM `BLOCKHASH` opcode. <p> ### Field Length Each hash value SHALL be the trailing 265 bits of a SHA2-384 hash.<br/> The length of this field SHALL be an integer multiple of 32 bytes.<br/> This field SHALL be at least 32 bytes.<br/> The maximum length of this field SHALL be 8192 bytes. |
| input_tree_root_hash | [bytes](#bytes) | A SHA2-384 hash value.<br/> This is the hash of the "input" subtree for this block. |
| start_of_block_state_hash | [bytes](#bytes) | A SHA2-384 hash value.<br/> This is the hash of consensus state at the _start_ of this block. |
| num_preceding_output_items | [uint32](#uint32) | A count of "output" block items in this block. <p> This SHALL count the number of output block items that _precede_ the state change that updates this singleton. |
| rightmost_preceding_output_tree_hashes | [bytes](#bytes) | A concatenation of SHA2-384 hash values.<br/> This is the "rightmost" values of the "output" subtree. <p> The subtree containing these hashes SHALL be constructed from all "output" `BlockItem`s in this block that _precede_ the update to this singleton. |
| block_end_time | [proto.Timestamp](#proto-Timestamp) | A block-end consensus time stamp. <p> This field SHALL hold the last-used consensus time for the current block. |
| post_upgrade_work_done | [bool](#bool) | Whether the post-upgrade work has been done. <p> This MUST be false if and only if the network just restarted after an upgrade and has not yet done the post-upgrade work. |
| creation_software_version | [proto.SemanticVersion](#proto-SemanticVersion) | A version describing the version of application software. <p> This SHALL be the software version that created this block. |
| last_interval_process_time | [proto.Timestamp](#proto-Timestamp) | The time stamp at which the last interval process was done. <p> This field SHALL hold the consensus time for the last time at which an interval of time-dependent events were processed. |
| last_handle_time | [proto.Timestamp](#proto-Timestamp) | The time stamp at which the last user transaction was handled. <p> This field SHALL hold the consensus time for the last time at which a user transaction was handled. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



