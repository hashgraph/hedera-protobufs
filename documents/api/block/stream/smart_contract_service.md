## Table of Contents

- [stream/smart_contract_service.proto](#stream_smart_contract_service-proto)
    - [CallContractOutput](#proto-CallContractOutput)
    - [CreateContractOutput](#proto-CreateContractOutput)
    - [EthereumOutput](#proto-EthereumOutput)
  



<a name="stream_smart_contract_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/smart_contract_service.proto
#  Service
Block stream messages that report the results of transactions handled by the `` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CallContractOutput"></a>

### CallContractOutput
Block Stream data for a `contractCallMethod` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated |  |
| contract_call_result | [ContractFunctionResult](#proto-ContractFunctionResult) |  | Record of the value returned by the smart contract function (if it completed and didn't fail) from ContractCallTransaction. This is the overall result of the evm execution. |






<a name="proto-CreateContractOutput"></a>

### CreateContractOutput
Block Stream data for a `createContract` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated |  |
| contract_create_result | [ContractFunctionResult](#proto-ContractFunctionResult) |  | Record of the value returned by the smart contract constructor (if it completed and didn't fail) from ContractCreateTransaction. |
| alias | [bytes](#bytes) |  | Set on an internal ContractCreate transaction, triggered by a user transaction with a (previously unused) alias, the new account's alias. |






<a name="proto-EthereumOutput"></a>

### EthereumOutput
Block Stream data for a `callEthereum` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated |  |
| ethereum_hash | [bytes](#bytes) |  | The keccak256 hash of the ethereumData. This field will only be populated for EthereumTransaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



