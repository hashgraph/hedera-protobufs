## Table of Contents

- [file_append.proto](#file_append-proto)
    - [FileAppendTransactionBody](#proto-FileAppendTransactionBody)
  



<a name="file_append-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_append.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FileAppendTransactionBody"></a>

### FileAppendTransactionBody
Append the given contents to the end of the specified file. If a file is too big to create with a
single FileCreateTransaction, then it can be created with the first part of its contents, and
then appended as many times as necessary to create the entire file. This transaction must be
signed by all initial M-of-M KeyList keys. If keys contains additional KeyList or ThresholdKey
then M-of-M secondary KeyList or ThresholdKey signing requirements must be meet.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file to which the bytes will be appended |
| contents | [bytes](#bytes) |  | The bytes that will be appended to the end of the specified file |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


