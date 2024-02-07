## Table of Contents

- [contract_types.proto](#contract_types-proto)
    - [ContractFunctionResult](#proto-ContractFunctionResult)
    - [ContractLoginfo](#proto-ContractLoginfo)
    - [ContractNonceInfo](#proto-ContractNonceInfo)
  



<a name="contract_types-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_types.proto
# Contract Message Types
Message types used in contract transactions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ContractFunctionResult"></a>

### ContractFunctionResult
A contract function result.<br/>
The result returned by a call to a smart contract function. This is part of
the response to a ContractCallLocal query, and is in the record for a
ContractCall. The ContractCreateInstance transaction record also carries a
function result, which is the results of the call to the constructor.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | A contract identifier.<br/> This identifies the smart contract that defines the function called. |
| contractCallResult | [bytes](#bytes) |  | Result data from the function call. <p> This SHALL be encoded in EVM bytecode format. |
| errorMessage | [string](#string) |  | Any error message produced by the contract call. <p> This SHALL be unset if the contract call succeeded. |
| bloom | [bytes](#bytes) |  | A bloom filter produced by this contract call.<br/> Ethereum uses this bloom filter to search for call results in the Ethereum block history. High false positive rates make the bloom filters quite limited value. |
| gasUsed | [uint64](#uint64) |  | A quantity of "gas" used.<br/> This represents the resource units expended to execute this contract call, and correlates to transaction costs. |
| logInfo | [ContractLoginfo](#proto-ContractLoginfo) | repeated | Any Log events produced by this contract call. |
| createdContractIDs | [ContractID](#proto-ContractID) | repeated | **Deprecated.** Replaced by values in transaction records to support `CREATE2` calls.<br/> <p> The list of smart contracts that were created by the function call.<br/> The created ids will now _also_ be externalized through internal transaction records, where each record has its alias field populated with the new contract's EVM address.<br/> This is needed for contracts created with CREATE2, which removes the trivial relationship between a new contract's Identifier and its Solidity address. |
| evm_address | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A created contract address.<br/> If the function created a new contract (e.g. `CREATE2`), this is the primary 20-byte EVM address for that contract. <p> Every contract SHALL have a "base" EVM address that is determined by its `shard.realm.num` contract ID.<br/> This address is constructed as follows <ol> <li>The first 4 bytes are the big-endian representation of the shard.</li> <li>The next 8 bytes are the big-endian representation of the realm.</li> <li>The final 8 bytes are the big-endian representation of the number.</li> </ol> <p> Contracts created via `CREATE2` SHALL have an _additional_, primary, address that is derived from the <a href="https://eips.ethereum.org/EIPS/eip-1014"><tt>EIP-1014</tt></a> specification. This additional address SHALL NOT be directly related to the `shard.realm.num` contract ID.<br/> It should be emphasized that Contracts created via a `CREATE2` call can also be referenced via the same "base" EVM address as described above. |
| gas | [int64](#int64) |  | The amount of gas available for this call, sometimes referred to as the gasLimit.<br/> This field SHALL NOT be populated when the associated `TransactionBody` in the block stream is a `ContractCreateTransactionBody` or a `ContractCallTransactionBody`. |
| amount | [int64](#int64) |  | An amount, in tinybar, sent by this function call.<br/> This SHALL be zero(0) if the function called is not `payable`.<br/> This field SHALL NOT be populated when the associated `TransactionBody` in the block stream is a `ContractCreateTransactionBody` or a `ContractCallTransactionBody`. |
| functionParameters | [bytes](#bytes) |  | The smart contract function to call, and the parameters to pass to that function.<br/> These SHALL be presented in EVM bytecode function call format.<br/> This field SHALL NOT be populated when the associated `TransactionBody` in the block stream is a `ContractCreateTransactionBody` or a `ContractCallTransactionBody`. |
| sender_id | [AccountID](#proto-AccountID) |  | The account that was the "sender" for this contract call.<br/> If this is not set it SHALL be read from the accountId in the transactionId for the contract call.<br/> This field SHALL NOT be populated when the associated `TransactionBody` in the block stream is a `ContractCreateTransactionBody` or a `ContractCallTransactionBody`. |
| contract_nonces | [ContractNonceInfo](#proto-ContractNonceInfo) | repeated | A list of contract account nonce values.<br/> This list SHALL contain a nonce value for each contract account modified as a result of this contract call. These nonce values SHALL be the value after the contract call is completed. |
| signer_nonce | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  | A nonce value for the "signer account".<br/> If the contract call updated the signer nonce for the signer account (i.e. by creating another contract), this field SHALL contain the updated value.<br/> If the signer account nonce was not updated, this field SHALL be `null`. |






<a name="proto-ContractLoginfo"></a>

### ContractLoginfo
EVM log data for a contract call.<br/>
The EVM log information produced by a smart contract function call.

Each contract function call MAY return zero or more log events.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | A contract identifier.<br/> This refers to the contract that generated this log entry. |
| bloom | [bytes](#bytes) |  | A bloom filter.<br/> This filter applies to this log entry and indexes the contract log data in the full data of the Ethereum block.<br/> EIP-7668 proposes to remove bloom filters as they are quite low value in practice and separate indexing services are more effective. |
| topic | [bytes](#bytes) | repeated | A list of the "topics" in this log entry.<br/> The EVM permits up to 4 topics, each of which is 32 bytes (one EVM word). <p> The first "topic" is special, and MUST contain the keccak256 hash of the event signature, if the event is not anonymous. |
| data | [bytes](#bytes) |  | Event data for this log entry.<br/> This is binary data consisting of an arbitrary number of 256 bit (32 byte) words. The content of that data is determined by the smart contract code.<br/> |






<a name="proto-ContractNonceInfo"></a>

### ContractNonceInfo
A contract "nonce" reference.<br/>
This connects a contract and its "nonce" value, and is primarily for use in
query responses.  A "nonce" is short for "nonsense" and is usually a value
with no particular meaning.

The nonce of a contract SHALL be incremented when that contract creates
another contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contract_id | [ContractID](#proto-ContractID) |  | A contract identifier.<br/> This refers to the contract that holds this nonce value. |
| nonce | [int64](#int64) |  | A "nonce" value. The current value of the nonce associated with the identified contract. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


