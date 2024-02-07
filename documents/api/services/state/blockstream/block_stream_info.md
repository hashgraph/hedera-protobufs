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
immediately prior completed block.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  | A block number.<br/> This is the current block number. |
| block_time | [proto.Timestamp](#proto-Timestamp) |  | A consensus time for the current block.<br/> This is the _first_ consensus time in the current block, and is used to determine if this block was the first across an important boundary in consensus time, such as UTC midnight. This may also be used to purge entities expiring between the last block time and this time. |
| trailing_output_hashes | [bytes](#bytes) |  | A concatenation of hash values.<br/> This combines several trailing output block item hashes and is used as a seed value for a pseudo-random number generator.<br/> This is also required to implement the EVM `PREVRANDAO` opcode. |
| trailing_block_hashes | [bytes](#bytes) |  | A concatenation of hash values.<br/> This field combines up to 256 trailing block hashes. <p> If this message is for block number N, then the earliest available hash SHALL be for block number N-256.<br/> The latest available hash SHALL be for block N-1.<br/> This is REQUIRED to implement the EVM `BLOCKHASH` opcode. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



