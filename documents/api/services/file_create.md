## Table of Contents

- [file_create.proto](#file_create-proto)
    - [FileCreateTransactionBody](#proto-FileCreateTransactionBody)
  



<a name="file_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_create.proto
# File Create
Messages to create a new file entry.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-FileCreateTransactionBody"></a>

### FileCreateTransactionBody
Create a new file.

If successful, the new file SHALL contain the (possibly empty) content
provided in the `contents` field.<br/>
When the current consensus time exceeds the `expirationTime` value, the
network SHALL expire the file, and MAY archive the state entry.

#### Signature Requirements
The HFS manages file authorization in a manner that can be confusing.
The core element of file authorization is the `keys` field,
which is a `KeyList`; a list of individual `Key` messages, each of which
may represent a simple or complex key.<br/>
The file service transactions treat this list differently.<br/>
A `fileCreate`, `fileAppend`, or `fileUpdate` MUST have a valid signature
from _each_ key in the list.<br/>
A `fileDelete` MUST have a valid signature from _at least one_ key in
the list. This is different, and allows a file "owned" by many entities
to be deleted by any one of those entities. A deleted file cannot be
restored, so it is important to consider this when assigning keys for
a file.<br/>
If any of the keys in a `KeyList` are complex, the full requirements of
each complex key must be met to count as a "valid signature" for that key.
A complex key structure (i.e. a `ThresholdKey`, or `KeyList`, possibly
including additional `ThresholdKey` or `KeyList` descendants) may be
assigned as the sole entry in a file `keys` field to ensure all transactions
have the same signature requirements.

If the `keys` field is an empty `KeyList`, then the file SHALL be immutable
and the only transaction permitted to modify that file SHALL be a
`fileUpdate` transaction with _only_ the `expirationTime` set.

#### Shard and Realm
The current API ignores shardID and realmID. All files are created in
shard 0 and realm 0. Future versions of the API may support multiple
realms and multiple shards.

### Block Stream Effects
After the file is created, the FileID for it SHALL be returned in the
transaction receipt, and SHALL be recorded in the transaction record.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| expirationTime | [Timestamp](#proto-Timestamp) |  | An expiration timestamp. <p> When the network consensus time exceeds this value, the network SHALL expire the file. |
| keys | [KeyList](#proto-KeyList) |  | A list of keys that represent file "owners". <p> Every `Key` in this list MUST sign this `fileCreate` transaction, as well as any `fileUpdate` or `fileAppend` that modifies this file.<br/> At least one `Key` in this list MUST sign any `fileDelete` transaction to delete this file.<br/> If this `KeyList` is empty, the file SHALL be created immutable and the only field that may be changed subsequently is the `expirationTime`. An immutable file cannot be deleted except with a `systemDelete` transaction, or by expiration. |
| contents | [bytes](#bytes) |  | A byte array of file content. <p> The file SHALL be created with initial content equal to this field.<br/> Additional `fileAppend` transactions MAY add additional content to the end of this file.<br/> A `fileUpdate` transaction MAY replace the file content. |
| shardID | [ShardID](#proto-ShardID) |  | A shard in which this file is created |
| realmID | [RealmID](#proto-RealmID) |  | A realm in which this file is created. <p> The shard number for this realm MUST match the value in `shardID`.<br/> Currently, this MUST be `0` for both fields.<br/> If the desired realm is `0.0`, this SHOULD NOT be set. |
| newRealmAdminKey | [Key](#proto-Key) |  | **Deprecated.** An admin key for a new realm, if one is created. <blockquote>Should this be deprecated?<blockquote> The "create realm" was never enabled, and probably should not be possible on file creation. </blockquote></blockquote> Added deprecated tag 2024-05 based on above. |
| memo | [string](#string) |  | A short description of this file. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



