## Table of Contents

- [contract_get_records.proto](#contract_get_records-proto)
    - [ContractGetRecordsQuery](#proto-ContractGetRecordsQuery)
    - [ContractGetRecordsResponse](#proto-ContractGetRecordsResponse)
  



<a name="contract_get_records-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_records.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetRecordsQuery"></a>

### ContractGetRecordsQuery
Before v0.9.0, requested records of all transactions against the given contract in the last 25 hours.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | The smart contract instance for which the records should be retrieved |






<a name="proto-ContractGetRecordsResponse"></a>

### ContractGetRecordsResponse
Before v0.9.0, returned records of all transactions against the given contract in the last 25 hours.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| contractID | [ContractID](#proto-ContractID) |  | The smart contract instance that this record is for |
| records | [TransactionRecord](#proto-TransactionRecord) | repeated | List of records, each with contractCreateResult or contractCallResult as its body |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


