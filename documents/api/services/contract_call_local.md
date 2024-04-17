## Table of Contents

- [contract_call_local.proto](#contract_call_local-proto)
    - [ContractCallLocalQuery](#proto-ContractCallLocalQuery)
    - [ContractCallLocalResponse](#proto-ContractCallLocalResponse)
  



<a name="contract_call_local-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_call_local.proto
# Local Contract Call
A Contract Call executed directly on the current node
(that is, without consensus).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ContractCallLocalQuery"></a>

### ContractCallLocalQuery
Call a query function of a given smart contract, providing function parameter
inputs as needed.

This is performed locally on the particular node that the client is
communicating with. Executing the call locally is faster and less costly,
but imposes certain restrictions.<br/>
The call MUST NOT change the state of the contract instance. This also
precludes any expenditure or transfer of HBAR or other tokens.<br/>
The call SHALL NOT have a separate consensus timestamp.<br/>
The call SHALL NOT generate a record nor a receipt.<br/>
The response SHALL contain the output returned by the function call.<br/>

This is generally useful for calling accessor functions which read (query)
state without changes or side effects. Any contract call that would use the
`STATICCALL` opcode MAY be called via contract call local with performance
and cost benefits.

Unlike a ContractCall transaction, the node SHALL always consume the
_entire_ amount of offered "gas" in determining the fee for this query, so
accurate gas estimation is important.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). <p> The payment MUST be sufficient for the base fees _and_ the full amount in the `gas` field. |
| contractID | [ContractID](#proto-ContractID) |  | The ID of a smart contract to call. |
| gas | [int64](#int64) |  | The amount of "gas" to use for this call. <p> This transaction SHALL consume all of the gas offered and charge the corresponding fee according to the current exchange rate between HBAR and "gas". |
| functionParameters | [bytes](#bytes) |  | The smart contract function to call, and the parameters to pass to that function. <p> These SHALL be presented in EVM bytecode function call format. |
| maxResultSize | [int64](#int64) |  | **Deprecated.** Do not use this field; it is ignored in the current software. <p> The maximum number of bytes that the result might include.<br/> The call will fail if it would have returned more than this number of bytes. |
| sender_id | [AccountID](#proto-AccountID) |  | The account that is the "sender" for this contract call. <p> If this is not set it SHALL be interpreted as the accountId from the associated transactionId.<br/> If this is set then either the associated transaction or the foreign transaction data MUST be signed by the referenced account. |






<a name="proto-ContractCallLocalResponse"></a>

### ContractCallLocalResponse
The response returned by a `ContractCallLocalQuery` transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| functionResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | The result(s) returned by the function call, if successful. <p> If the call failed this value SHALL be unset. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


