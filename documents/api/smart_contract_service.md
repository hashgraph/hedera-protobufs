## Table of Contents

- [smart_contract_service.proto](#smart_contract_service-proto)
    - [SmartContractService](#proto-SmartContractService)
  



<a name="smart_contract_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## smart_contract_service.proto
# Smart Contract Service
gRPC service definitions for calls to the Hedera EVM-compatible Smart Contract service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-SmartContractService"></a>

### SmartContractService
The Smart Contract service provides an interface to an EVM compatible environment to create,
store, manage, and execute smart contract calls.  Smart Contracts implement useful and often
highly complex interactions between individuals, systems, and the distributed ledger.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Create a new smart contract.<br/> If this transaction succeeds, the `ContractID` for the new smart contract SHALL be set in the transaction receipt.<br/> The contract is defined by the initial bytecode (or `initcode`). The `initcode` SHALL be provided either in a previously created file, or in the transaction body itself for very small contracts. <p> As part of contract creation, the constructor defined for the new smart contract SHALL run with the parameters provided in the `constructorParameters` field.<br/> The gas to "power" that constructor MUST be provided via the `gas` field, and SHALL be charged to the payer for this transaction.</br> If the contract _constructor_ stores information, it is charged gas for that storage. There is a separate fee in HBAR to maintain that storage until the expiration, and that fee SHALL be added to this transaction as part of the _transaction fee_, rather than gas. |
| updateContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Modify a smart contract. Any change other than updating the expiration time requires that the contract be modifiable (has a valid `adminKey`) and that the transaction be signed by the `adminKey`<br/> Fields _not set_ on the request SHALL NOT be modified. |
| contractCallMethod | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Call a function of a given smart contract, providing function parameter inputs as needed. <p> Resource ("gas") charges SHALL include all relevant fees incurred by the contract execution, including any storage required. <p> The total transaction fee SHALL incorporate all of the "gas" actually consumed as well as the standard fees for transaction handling, data transfers, signature verification, etc... |
| contractCallLocalMethod | [Query](#proto-Query) | [Response](#proto-Response) | Call a query function of a given smart contract, providing function parameter inputs as needed. <p> This is performed locally on the particular node that the client is communicating with. Executing the call locally is faster and less costly, but imposes certain restrictions.<br/> The call MUST NOT change the state of the contract instance. This also precludes any expenditure or transfer of HBAR or other tokens.<br/> The call SHALL NOT have a separate consensus timestamp.<br/> The call SHALL NOT generate a record nor a receipt.<br/> The response SHALL contain the output returned by the function call.<br/> <p> This is generally useful for calling accessor functions which read (query) state without changes or side effects. Any contract call that would use the `STATICCALL` opcode MAY be called via contract call local with performance and cost benefits. <p> Unlike a ContractCall transaction, the node SHALL always consume the _entire_ amount of offered "gas" in determining the fee for this query, so accurate gas estimation is important. |
| getContractInfo | [Query](#proto-Query) | [Response](#proto-Response) | A standard query to obtain detailed information for a smart contract. |
| ContractGetBytecode | [Query](#proto-Query) | [Response](#proto-Response) | A standard query to read the current bytecode for a smart contract. |
| getBySolidityID | [Query](#proto-Query) | [Response](#proto-Response) | A standard query to obtain account and contract identifiers for a smart contract, given the Solidity identifier for that contract. |
| getTxRecordByContractID | [Query](#proto-Query) | [Response](#proto-Response) | <blockquote>This query is no longer supported.</blockquote> This query always returned an empty record list. |
| deleteContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Delete a smart contract, and transfer any remaining HBAR balance to a designated account. <p> If this call succeeds then all subsequent calls to that smart contract SHALL fail.<br/> |
| systemDelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Delete a smart contract, as a system-initiated deletion, this SHALL NOT transfer balances. <blockquote> This call is an administrative function of the Hedera network, and requires network administration authorization.<br/> This transaction MUST be signed by one of the network administration accounts (e.g. `0.0.2`, `0.0.50`, or `0.0.59`). </blockquote> If this call succeeds then all subsequent calls to that smart contract SHALL fail.<br/> |
| systemUndelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Un-Delete a smart contract, returning it (mostly) to its state prior to deletion.<br/> The contract to be restored MUST have been deleted via `systemDelete`. If the contract was deleted via `deleteContract` it SHALL NOT be recoverable. <blockquote> This call is an administrative function of the Hedera network, and requires network administration authorization.<br/> This transaction MUST be signed by one of the network administration accounts (e.g. `0.0.2`, `0.0.50`, or `0.0.60`). </blockquote> If this call succeeds then subsequent calls to that smart contract MAY succeed.<br/> |
| callEthereum | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Make an Ethereum transaction "call" with all data in Ethereum formats, including the contract alias. Call data may be in the transaction, or stored within an Hedera File.<br/> The caller MAY offer additional gas above what is offered in the call data, but MAY be charged up to 80% of that value if the amount required is less than this "floor" amount. |

 <!-- end services -->


