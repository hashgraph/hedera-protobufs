## Table of Contents

- [get_by_solidity_id.proto](#get_by_solidity_id-proto)
    - [GetBySolidityIDQuery](#proto-GetBySolidityIDQuery)
    - [GetBySolidityIDResponse](#proto-GetBySolidityIDResponse)
  



<a name="get_by_solidity_id-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## get_by_solidity_id.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-GetBySolidityIDQuery"></a>

### GetBySolidityIDQuery
Get the IDs in the format used by transactions, given the ID in the format used by Solidity. If
the Solidity ID is for a smart contract instance, then both the ContractID and associated
AccountID will be returned.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| solidityID | [string](#string) |  | The ID in the format used by Solidity |






<a name="proto-GetBySolidityIDResponse"></a>

### GetBySolidityIDResponse
Response when the client sends the node GetBySolidityIDQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID for the cryptocurrency account |
| fileID | [FileID](#proto-FileID) |  | The file Id for the file |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract ID for the instance (if this is included, then the associated accountID will also be included) |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


