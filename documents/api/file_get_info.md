## Table of Contents

- [file_get_info.proto](#file_get_info-proto)
    - [FileGetInfoQuery](#proto-FileGetInfoQuery)
    - [FileGetInfoResponse](#proto-FileGetInfoResponse)
    - [FileGetInfoResponse.FileInfo](#proto-FileGetInfoResponse-FileInfo)
  



<a name="file_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_get_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FileGetInfoQuery"></a>

### FileGetInfoQuery
Get all of the information about a file, except for its contents. When a file expires, it no
longer exists, and there will be no info about it, and the fileInfo field will be blank. If a
transaction or smart contract deletes the file, but it has not yet expired, then the fileInfo
field will be non-empty, the deleted field will be true, its size will be 0, and its contents
will be empty.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file for which information is requested |






<a name="proto-FileGetInfoResponse"></a>

### FileGetInfoResponse
Response when the client sends the node FileGetInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| fileInfo | [FileGetInfoResponse.FileInfo](#proto-FileGetInfoResponse-FileInfo) |  | The information about the file |






<a name="proto-FileGetInfoResponse-FileInfo"></a>

### FileGetInfoResponse.FileInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file for which information is requested |
| size | [int64](#int64) |  | Number of bytes in contents |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The current time at which this account is set to expire |
| deleted | [bool](#bool) |  | True if deleted but not yet expired |
| keys | [KeyList](#proto-KeyList) |  | One of these keys must sign in order to modify or delete the file |
| memo | [string](#string) |  | The memo associated with the file |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


