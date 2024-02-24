## Table of Contents

- [contract_get_bytecode.proto](#contract_get_bytecode-proto)
    - [ContractGetBytecodeQuery](#proto-ContractGetBytecodeQuery)
    - [ContractGetBytecodeResponse](#proto-ContractGetBytecodeResponse)
  



<a name="contract_get_bytecode-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_bytecode.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetBytecodeQuery"></a>

### ContractGetBytecodeQuery
Get the runtime bytecode for a smart contract instance


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | the contract for which information is requested |






<a name="proto-ContractGetBytecodeResponse"></a>

### ContractGetBytecodeResponse
Response when the client sends the node ContractGetBytecodeQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| bytecode | [bytes](#bytes) |  | the runtime bytecode of the contract |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


