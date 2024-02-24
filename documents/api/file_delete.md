## Table of Contents

- [file_delete.proto](#file_delete-proto)
    - [FileDeleteTransactionBody](#proto-FileDeleteTransactionBody)
  



<a name="file_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FileDeleteTransactionBody"></a>

### FileDeleteTransactionBody
Delete the given file. After deletion, it will be marked as deleted and will have no contents.
But information about it will continue to exist until it expires. A list of keys was given when
the file was created. All the top level keys on that list must sign transactions to create or
modify the file, but any single one of the top level keys can be used to delete the file. This
transaction must be signed by 1-of-M KeyList keys. If keys contains additional KeyList or
ThresholdKey then 1-of-M secondary KeyList or ThresholdKey signing requirements must be meet.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file to delete. It will be marked as deleted until it expires. Then it will disappear. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


