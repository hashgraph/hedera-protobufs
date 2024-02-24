## Table of Contents

- [get_by_key.proto](#get_by_key-proto)
    - [EntityID](#proto-EntityID)
    - [GetByKeyQuery](#proto-GetByKeyQuery)
    - [GetByKeyResponse](#proto-GetByKeyResponse)
  



<a name="get_by_key-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## get_by_key.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-EntityID"></a>

### EntityID
the ID for a single entity (account, livehash, file, or smart contract instance)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID for the cryptocurrency account |
| liveHash | [LiveHash](#proto-LiveHash) |  | A uniquely identifying livehash of an acount |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file |
| contractID | [ContractID](#proto-ContractID) |  | The smart contract ID that identifies instance |






<a name="proto-GetByKeyQuery"></a>

### GetByKeyQuery
Get all accounts, claims, files, and smart contract instances whose associated keys include the
given Key. The given Key MUST NOT be a contractID or a ThresholdKey.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| key | [Key](#proto-Key) |  | The key to search for. It MUST NOT contain a contractID nor a ThresholdKey. |






<a name="proto-GetByKeyResponse"></a>

### GetByKeyResponse
Response when the client sends the node GetByKeyQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| entities | [EntityID](#proto-EntityID) | repeated | The list of entities that include this public key in their associated Key list |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


