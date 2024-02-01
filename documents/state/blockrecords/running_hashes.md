## Table of Contents

- [state/blockrecords/running_hashes.proto](#state_blockrecords_running_hashes-proto)
    - [RunningHashes](#proto-RunningHashes)
  



<a name="state_blockrecords_running_hashes-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/blockrecords/running_hashes.proto



<a name="proto-RunningHashes"></a>

### RunningHashes
The running hash of a transaction records and the previous 3 running hashes. All hashes are 48 bytes SHA384 hashes. If the
running hashes do not exist yet then they will be default values witch is empty bytes object or zero length byte array.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| running_hash | [bytes](#bytes) |  | A running hash of all record stream items |
| n_minus_1_running_hash | [bytes](#bytes) |  | The previous running hash of all record stream items |
| n_minus_2_running_hash | [bytes](#bytes) |  | The previous, previous running hash of all record stream items |
| n_minus_3_running_hash | [bytes](#bytes) |  | The previous, previous, previous running hash of all record stream items |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


