## Table of Contents

- [stream/smart_contract_service.proto](#stream_smart_contract_service-proto)
    - [CallContractOutput](#com-hedera-hapi-block-stream-CallContractOutput)
    - [CreateContractOutput](#com-hedera-hapi-block-stream-CreateContractOutput)
    - [DeleteContractOutput](#com-hedera-hapi-block-stream-DeleteContractOutput)
    - [EthereumOutput](#com-hedera-hapi-block-stream-EthereumOutput)
    - [SystemDeleteContractOutput](#com-hedera-hapi-block-stream-SystemDeleteContractOutput)
    - [SystemUnDeleteContractOutput](#com-hedera-hapi-block-stream-SystemUnDeleteContractOutput)
    - [UpdateContractOutput](#com-hedera-hapi-block-stream-UpdateContractOutput)
  



<a name="stream_smart_contract_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/smart_contract_service.proto
#  Service
Block stream messages that report the results of transactions handled
by the `` service.

> REVIEW NOTE
>> The use of sidecar records is a bit odd here. We may find it more
>> effective to extract the actual changes into proper output messages
>> and fields included in the ethereum call output and/or related state
>> changes items, and remove the whole sidecar concept going forward.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-CallContractOutput"></a>

### CallContractOutput
Block Stream data for a `contractCallMethod` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [proto.TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated |  |
| contract_call_result | [proto.ContractFunctionResult](#proto-ContractFunctionResult) |  | An EVM contract call result. <p> This field SHALL contain all of the data produced by the contract call transaction as well as basic accounting results. |






<a name="com-hedera-hapi-block-stream-CreateContractOutput"></a>

### CreateContractOutput
Block Stream data for a `createContract` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [proto.TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated |  |
| contract_create_result | [proto.ContractFunctionResult](#proto-ContractFunctionResult) |  | An EVM contract call result. <p> This field SHALL contain all of the data produced by the contract create transaction as well as basic accounting results. |






<a name="com-hedera-hapi-block-stream-DeleteContractOutput"></a>

### DeleteContractOutput
Block Stream data for a `deleteContract` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-EthereumOutput"></a>

### EthereumOutput
Block Stream data for a `callEthereum` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sidecars | [proto.TransactionSidecarRecord](#proto-TransactionSidecarRecord) | repeated | A list of additional outputs. <p> This field MAY record one or more additional outputs and smart contract state changes produced during the ethereum call transaction handling.<br/> This field SHALL NOT be set if the transaction handling did not produce additional outputs.<br/> This field is not settled and MAY be removed or modified. |
| ethereum_hash | [bytes](#bytes) |  | An ethereum hash value. <p> This SHALL be a keccak256 hash of the ethereumData. |






<a name="com-hedera-hapi-block-stream-SystemDeleteContractOutput"></a>

### SystemDeleteContractOutput
Block Stream data for a contract `systemDelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-SystemUnDeleteContractOutput"></a>

### SystemUnDeleteContractOutput
Block Stream data for a contract `systemUndelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-UpdateContractOutput"></a>

### UpdateContractOutput
Block Stream data for a `updateContract` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



