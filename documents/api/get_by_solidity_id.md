## Table of Contents

- [get_by_solidity_id.proto](#get_by_solidity_id-proto)
    - [GetBySolidityIDQuery](#proto-GetBySolidityIDQuery)
    - [GetBySolidityIDResponse](#proto-GetBySolidityIDResponse)
  



<a name="get_by_solidity_id-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## get_by_solidity_id.proto
# Get By Solidity
A standard query to obtain account and contract identifiers for a smart contract, given the
Solidity identifier for that contract.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-GetBySolidityIDQuery"></a>

### GetBySolidityIDQuery
Query to read Contract, Account, and File identifiers for a smart contract given a Solidity
identifier.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| solidityID | [string](#string) |  | A contract ID in the format used by Solidity |






<a name="proto-GetBySolidityIDResponse"></a>

### GetBySolidityIDResponse
Response to a getBySolidityId query.

This message returns the account, contract, and file identifiers for a smart contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID of the account supporting the requested smart contract. |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file supporting the requested smart contract. |
| contractID | [ContractID](#proto-ContractID) |  | The contract ID of the requested smart contract. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


