## Table of Contents

- [file_get_contents.proto](#file_get_contents-proto)
    - [FileGetContentsQuery](#proto-FileGetContentsQuery)
    - [FileGetContentsResponse](#proto-FileGetContentsResponse)
    - [FileGetContentsResponse.FileContents](#proto-FileGetContentsResponse-FileContents)
  



<a name="file_get_contents-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_get_contents.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FileGetContentsQuery"></a>

### FileGetContentsQuery
Get the contents of a file. The content field is empty (no bytes) if the file is empty.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file whose contents are requested |






<a name="proto-FileGetContentsResponse"></a>

### FileGetContentsResponse
Response when the client sends the node FileGetContentsQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| fileContents | [FileGetContentsResponse.FileContents](#proto-FileGetContentsResponse-FileContents) |  | the file ID and contents (a state proof can be generated for this) |






<a name="proto-FileGetContentsResponse-FileContents"></a>

### FileGetContentsResponse.FileContents



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file whose contents are being returned |
| contents | [bytes](#bytes) |  | The bytes contained in the file |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


