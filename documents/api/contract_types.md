## Table of Contents

- [contract_types.proto](#contract_types-proto)
    - [ContractNonceInfo](#proto-ContractNonceInfo)
  



<a name="contract_types-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_types.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractNonceInfo"></a>

### ContractNonceInfo
Info about a contract account's nonce value.
A nonce of a contract is only incremented when that contract creates another contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contract_id | [ContractID](#proto-ContractID) |  | Id of the contract |
| nonce | [int64](#int64) |  | The current value of the contract account's nonce property |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


