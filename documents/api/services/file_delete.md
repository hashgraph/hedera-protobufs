## Table of Contents

- [file_delete.proto](#file_delete-proto)
    - [FileDeleteTransactionBody](#proto-FileDeleteTransactionBody)
  



<a name="file_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_delete.proto
# File Delete
A message for a transaction to delete a file.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-FileDeleteTransactionBody"></a>

### FileDeleteTransactionBody
Mark a file as deleted and remove its content from network state.

At least _one_ key from the `KeyList` in the `keys` field of the
identified file MUST sign this transaction.<br/>
The metadata for a deleted file SHALL be retained at least until the
expiration time for the file is exceeded.<br/>
On completion, the identified file SHALL be marked `deleted`.<br/>
On completion, the identified file SHALL have an empty `contents` array.<br/>
This transaction SHALL be final and irreversible.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | A file identifier.<br/> This identifies the file to delete. <p> This field is REQUIRED. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



