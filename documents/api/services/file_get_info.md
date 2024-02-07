## Table of Contents

- [file_get_info.proto](#file_get_info-proto)
    - [FileGetInfoQuery](#proto-FileGetInfoQuery)
    - [FileGetInfoResponse](#proto-FileGetInfoResponse)
    - [FileGetInfoResponse.FileInfo](#proto-FileGetInfoResponse-FileInfo)
  



<a name="file_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_get_info.proto
# File Get Information
Messages for a query to retrieve the metadata for a file in the
Hedera File Service (HFS).

The query defined here does not include the content of the file.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-FileGetInfoQuery"></a>

### FileGetInfoQuery
Query to request file metadata from the Hedera File Service (HFS).<br/>
This query requests all of the information _about_ a file, but none of the
_content_ of a file. A client should submit a `fileGetContents` query to
view the content of a file. File content _may_ also be available from a
block node or mirror node, generally at lower cost.

File metadata SHALL be available for active files and deleted files.<br/>
File metadata MAY be unavailable for expired files.<br/>
The size of a deleted file SHALL be `0` and the content SHALL be empty.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> This MUST be the identifier of a file that exists in HFS.<br/> This value SHALL identify the file to be queried. |






<a name="proto-FileGetInfoResponse"></a>

### FileGetInfoResponse
A response to a query for the metadata of a file in the HFS.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| fileInfo | [FileGetInfoResponse.FileInfo](#proto-FileGetInfoResponse-FileInfo) |  | A combination of fields from the requested file metadata. <p> This SHALL NOT be set if the identified file does not exist or has expired. |






<a name="proto-FileGetInfoResponse-FileInfo"></a>

### FileGetInfoResponse.FileInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> This SHALL be the identifier of a file that exists in HFS.<br/> This value SHALL identify the file that was queried. |
| size | [int64](#int64) |  | A size, in bytes, for the file. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | An expiration timestamp. <p> The file SHALL NOT expire before the network consensus time exceeds this value.<br/> The file SHALL expire after the network consensus time exceeds this value.<br/> |
| deleted | [bool](#bool) |  | A flag indicating this file is deleted. <p> A deleted file SHALL have a size `0` and empty content. |
| keys | [KeyList](#proto-KeyList) |  | A KeyList listing all keys that "own" the file. <p> All keys in this list MUST sign a transaction to append to the file content, or to modify file metadata.<br/> At least _one_ key in this list MUST sign a transaction to delete this file.<br/> If this is an empty `KeyList`, the file is immutable, cannot be modified or deleted, but MAY expire. A `fileUpdate` transaction MAY extend the expiration time for an immutable file. |
| memo | [string](#string) |  | A short description for this file. <p> This value, if set, SHALL NOT exceed 100 bytes when encoded as UTF-8. |
| ledger_id | [bytes](#bytes) |  | A ledger identifier for the responding network. <p> This value SHALL identify the distributed ledger that responded to this query. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



