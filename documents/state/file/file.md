## Table of Contents

- [state/file/file.proto](#state_file_file-proto)
    - [File](#proto-File)
  



<a name="state_file_file-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/file/file.proto



<a name="proto-File"></a>

### File
Representation of a Hedera Token Service file in the network Merkle tree.

As with all network entities, a file has a unique entity number, which is given along
with the network's shard and realm in the form of a shard.realm.number id.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| file_id | [FileID](#proto-FileID) |  | The file's unique file identifier in the Merkle state. |
| expiration_second | [int64](#int64) |  | The file's consensus expiration time in seconds since the epoch. |
| keys | [KeyList](#proto-KeyList) |  | All keys at the top level of a key list must sign to create, modify and delete the file. |
| contents | [bytes](#bytes) |  | The bytes that are the contents of the file |
| memo | [string](#string) |  | The memo associated with the file (UTF-8 encoding max 100 bytes) |
| deleted | [bool](#bool) |  | Whether this file is deleted. |
| pre_system_delete_expiration_second | [int64](#int64) |  | The pre system delete expiration time in seconds |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


