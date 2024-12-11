## Table of Contents

- [state/file/file.proto](#state_file_file-proto)
    - [File](#proto-File)
  



<a name="state_file_file-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/file/file.proto
# File
A "file" in the distributed ledger is a stream of bytes. These bytes may
contain any data, and are limited in length based on network configuration
(for example, 1048576).


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-File"></a>

### File
Representation of an Hedera File Service `file`.

Files offer a place to store additional data, much more than is available in
other entities, for use with smart contracts, non-fungible tokens, etc...
As with all network entities, a file has a unique entity number, which is
given along with the network's shard and realm in the form of a
shard.realm.number id.


| Field | Type | Description |
| ----- | ---- | ----------- |
| file_id | [FileID](#proto-FileID) | This file's ID within the global network state. <p> This value SHALL be unique within the network. |
| expiration_second | [int64](#int64) | The file's expiration time in seconds since the epoch.<br/> This value should be compared against consensus time, which may not exactly match clock time at the moment of expiration. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| keys | [KeyList](#proto-KeyList) | A list of keys that MUST sign any transaction to create or update this file. <p> Only _one_ of these keys must sign a transaction to delete the file.<br/> This field MAY be `null` or an empty list.<br/> If this field is null or an empty `KeyList`, then the file SHALL be immutable.<br/> For an immutable file, the only transaction permitted to modify that file SHALL be a `fileUpdate` transaction with _only_ the `expirationTime` set. |
| contents | [bytes](#bytes) | The contents of the file. <p> This SHALL be limited to the current maximum file size; typically no more than 1 Megabyte (1048576 bytes). |
| memo | [string](#string) | A short description of the file. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8. |
| deleted | [bool](#bool) | A flag indicating that this file is deleted. <p> The `contents` of a deleted "regular" file SHALL be an empty (zero length) bytes. |
| pre_system_delete_expiration_second | [int64](#int64) | The pre-system-delete expiration time of a deleted "system" file, in seconds. <p> This field SHALL contain the original expiration time of a "system" file that is deleted. This SHOULD be used to restore that expiration time if the file is subsequently "un-deleted" before it is purged from the system.<br/> A "regular" file cannot be "un-deleted", so this field SHALL NOT be set for those files. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



