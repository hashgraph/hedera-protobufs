## Table of Contents

- [smart_contract_service.proto](#smart_contract_service-proto)
    - [SmartContractService](#proto-SmartContractService)
  



<a name="smart_contract_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## smart_contract_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-SmartContractService"></a>

### SmartContractService
Transactions and queries for the file service.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Creates a contract |
| updateContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates a contract with the content |
| contractCallMethod | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Calls a contract |
| getContractInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the contract information |
| contractCallLocalMethod | [Query](#proto-Query) | [Response](#proto-Response) | Calls a smart contract to be run on a single node |
| ContractGetBytecode | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the runtime code of a contract |
| getBySolidityID | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves a contract by its Solidity address |
| getTxRecordByContractID | [Query](#proto-Query) | [Response](#proto-Response) | Always returns an empty record list, as contract accounts are never effective payers for transactions |
| deleteContract | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a contract instance and transfers any remaining hbars to a specified receiver |
| systemDelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a contract if the submitting account has network admin privileges |
| systemUndelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Undeletes a contract if the submitting account has network admin privileges |
| callEthereum | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Ethereum transaction |

 <!-- end services -->


