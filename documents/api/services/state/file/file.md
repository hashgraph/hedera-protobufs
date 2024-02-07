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

> Review Question
>> File lacks auto renewal (account and period).  We need to add that here,
>> and also to create and update transactions.
>
>> The keys field is weird and really needs to change to adminKey and
>> deleteKey to be more correct and match other things.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| file_id | [FileID](#proto-FileID) |  | This file's ID within the global network state. <p> This value SHALL be unique within the network. |
| expiration_second | [int64](#int64) |  | The file's expiration time in seconds since the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| keys | [KeyList](#proto-KeyList) |  | A list of keys that MUST sign any transaction to update this file. <p> Only _one_ of these keys must sign a transaction to delete the file.<br/> This field SHOULD NOT be `null` or an empty list. |
| contents | [bytes](#bytes) |  | The contents of the file. <p> This SHALL be limited to the current maximum file size; typically no more than 1 Megabyte (1048576 bytes). |
| memo | [string](#string) |  | A short description of the file. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| deleted | [bool](#bool) |  | A flag indicating that this file is deleted. <p> The `contents` of a deleted "regular" file SHALL be an empty (zero length) bytes. |
| pre_system_delete_expiration_second | [int64](#int64) |  | The pre-system-delete expiration time of a deleted "system" file, in seconds. <p> This field SHALL contain the original expiration time of a "system" file that is deleted. This SHOULD be used to restore that expiration time if the file is subsequently "un-deleted" before it is purged from the system.<br/> A "regular" file cannot be "un-deleted", so this field SHALL NOT be set for those files. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


