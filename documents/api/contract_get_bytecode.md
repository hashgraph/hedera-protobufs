## Table of Contents

- [contract_get_bytecode.proto](#contract_get_bytecode-proto)
    - [ContractGetBytecodeQuery](#proto-ContractGetBytecodeQuery)
    - [ContractGetBytecodeResponse](#proto-ContractGetBytecodeResponse)
  



<a name="contract_get_bytecode-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_bytecode.proto
# Get Contract Bytecode
A standard query to read the current bytecode for a smart contract.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetBytecodeQuery"></a>

### ContractGetBytecodeQuery
Request the current bytecode for a smart contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract ID.<br/> The network SHALL return bytecode for this smart contract, if successful. |






<a name="proto-ContractGetBytecodeResponse"></a>

### ContractGetBytecodeResponse
Information returned in response to a "get bytecode" query for a smart contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| bytecode | [bytes](#bytes) |  | The current bytecode of the requested smart contract. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


