## Table of Contents

- [contract_call_local.proto](#contract_call_local-proto)
    - [ContractCallLocalQuery](#proto-ContractCallLocalQuery)
    - [ContractCallLocalResponse](#proto-ContractCallLocalResponse)
    - [ContractFunctionResult](#proto-ContractFunctionResult)
    - [ContractLoginfo](#proto-ContractLoginfo)
  



<a name="contract_call_local-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_call_local.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractCallLocalQuery"></a>

### ContractCallLocalQuery
Call a function of the given smart contract instance, giving it functionParameters as its inputs.
This is performed locally on the particular node that the client is communicating with.
It cannot change the state of the contract instance (and so, cannot spend anything from the instance's cryptocurrency account).
It will not have a consensus timestamp. It cannot generate a record or a receipt. The response will contain the output
returned by the function call.  This is useful for calling getter functions, which purely read the state and don't change it.
It is faster and cheaper than a normal call, because it is purely local to a single  node.

Unlike a ContractCall transaction, the node will consume the entire amount of provided gas in determining
the fee for this query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). The payment must cover the fees and all of the gas offered. |
| contractID | [ContractID](#proto-ContractID) |  | The contract to make a static call against |
| gas | [int64](#int64) |  | The amount of gas to use for the call; all of the gas offered will be used and charged a corresponding fee |
| functionParameters | [bytes](#bytes) |  | which function to call, and the parameters to pass to the function |
| maxResultSize | [int64](#int64) |  | **Deprecated.** max number of bytes that the result might include. The run will fail if it would have returned more than this number of bytes. |
| sender_id | [AccountID](#proto-AccountID) |  | The account that is the "sender." If not present it is the accountId from the transactionId. Typically a different value than specified in the transactionId requires a valid signature over either the hedera transaction or foreign transaction data. |






<a name="proto-ContractCallLocalResponse"></a>

### ContractCallLocalResponse
Response when the client sends the node ContractCallLocalQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| functionResult | [ContractFunctionResult](#proto-ContractFunctionResult) |  | the value returned by the function (if it completed and didn't fail) |






<a name="proto-ContractFunctionResult"></a>

### ContractFunctionResult
The result returned by a call to a smart contract function. This is part of the response to a
ContractCallLocal query, and is in the record for a ContractCall or ContractCreateInstance
transaction. The ContractCreateInstance transaction record has the results of the call to the
constructor.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | the smart contract instance whose function was called |
| contractCallResult | [bytes](#bytes) |  | the result returned by the function |
| errorMessage | [string](#string) |  | message In case there was an error during smart contract execution |
| bloom | [bytes](#bytes) |  | bloom filter for record |
| gasUsed | [uint64](#uint64) |  | units of gas used to execute contract |
| logInfo | [ContractLoginfo](#proto-ContractLoginfo) | repeated | the log info for events returned by the function |
| createdContractIDs | [ContractID](#proto-ContractID) | repeated | **Deprecated.** [DEPRECATED] the list of smart contracts that were created by the function call.

The created ids will now _also_ be externalized through internal transaction records, where each record has its alias field populated with the new contract's EVM address. (This is needed for contracts created with CREATE2, since there is no longer a simple relationship between the new contract's 0.0.X id and its Solidity address.) |
| evm_address | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | The new contract's 20-byte EVM address. Only populated after release 0.23, where each created contract will have its own record. (This is an important point--the field is not <tt>repeated</tt> because there will be a separate child record for each created contract.)

Every contract has an EVM address determined by its <tt>shard.realm.num</tt> id. This address is as follows: <ol> <li>The first 4 bytes are the big-endian representation of the shard.</li> <li>The next 8 bytes are the big-endian representation of the realm.</li> <li>The final 8 bytes are the big-endian representation of the number.</li> </ol>

Contracts created via CREATE2 have an <b>additional, primary address</b> that is derived from the <a href="https://eips.ethereum.org/EIPS/eip-1014">EIP-1014</a> specification, and does not have a simple relation to a <tt>shard.realm.num</tt> id.

(Please do note that CREATE2 contracts can also be referenced by the three-part EVM address described above.) |
| gas | [int64](#int64) |  | The amount of gas available for the call, aka the gasLimit.

This field should only be populated when the paired TransactionBody in the record stream is not a ContractCreateTransactionBody or a ContractCallTransactionBody. |
| amount | [int64](#int64) |  | Number of tinybars sent (the function must be payable if this is nonzero).

This field should only be populated when the paired TransactionBody in the record stream is not a ContractCreateTransactionBody or a ContractCallTransactionBody. |
| functionParameters | [bytes](#bytes) |  | The parameters passed into the contract call.

This field should only be populated when the paired TransactionBody in the record stream is not a ContractCreateTransactionBody or a ContractCallTransactionBody. |
| sender_id | [AccountID](#proto-AccountID) |  | The account that is the "sender." If not present it is the accountId from the transactionId.

This field should only be populated when the paired TransactionBody in the record stream is not a ContractCreateTransactionBody or a ContractCallTransactionBody. |
| contract_nonces | [ContractNonceInfo](#proto-ContractNonceInfo) | repeated | A list of updated contract account nonces containing the new nonce value for each contract account. This is always empty in a ContractCallLocalResponse#ContractFunctionResult message, since no internal creations can happen in a static EVM call. |
| signer_nonce | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  | If not null this field specifies what the value of the signer account nonce is post transaction execution. For transactions that don't update the signer nonce, this field should be null. |






<a name="proto-ContractLoginfo"></a>

### ContractLoginfo
The log information for an event returned by a smart contract function call. One function call
may return several such events.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | address of a contract that emitted the event |
| bloom | [bytes](#bytes) |  | bloom filter for a particular log |
| topic | [bytes](#bytes) | repeated | topics of a particular event |
| data | [bytes](#bytes) |  | event data |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


