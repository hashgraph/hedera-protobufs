## Table of Contents

- [state/contract/bytecode.proto](#state_contract_bytecode-proto)
    - [Bytecode](#proto-Bytecode)
  



<a name="state_contract_bytecode-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/contract/bytecode.proto
# EVM Bytecode
The verified bytecode of an EVM contract for the Hedera Smart Contract service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Bytecode"></a>

### Bytecode
The bytecode for a contract account.

This is not referred to by any other protocol buffer, but is used internally
within the Hedera Node software.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [bytes](#bytes) |  | The raw bytes (not hex-encoded) of a contract's bytecode. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


