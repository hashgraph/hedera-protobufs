## Table of Contents

- [file_get_contents.proto](#file_get_contents-proto)
    - [FileGetContentsQuery](#proto-FileGetContentsQuery)
    - [FileGetContentsResponse](#proto-FileGetContentsResponse)
    - [FileGetContentsResponse.FileContents](#proto-FileGetContentsResponse-FileContents)
  



<a name="file_get_contents-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_get_contents.proto
# File Get Contents
Messages for a query to retrieve the content of a file in the
Hedera File Service (HFS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-FileGetContentsQuery"></a>

### FileGetContentsQuery
A query request to the Hedera File Service (HFS) for file content.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> This MUST be the identifier of a file that exists in HFS.<br/> This value SHALL identify the file to be queried. |






<a name="proto-FileGetContentsResponse"></a>

### FileGetContentsResponse
A response to a query for the content of a file in the
Hedera File Service (HFS).

This message SHALL contain the full content of the requested file, but
SHALL NOT contain any metadata.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| fileContents | [FileGetContentsResponse.FileContents](#proto-FileGetContentsResponse-FileContents) |  | A combination of File identifier and content bytes. <p> This SHALL NOT be set if the file does not exist.<br/> The network MAY generate a state proof for this field. |






<a name="proto-FileGetContentsResponse-FileContents"></a>

### FileGetContentsResponse.FileContents



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> This SHALL be the identifier of a file that exists in HFS.<br/> This value SHALL identify the file that was queried. |
| contents | [bytes](#bytes) |  | A byte array of file content. <p> This SHALL contain the full content of the requested file.<br/> This SHALL be empty if, and only if, the file content is empty. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



