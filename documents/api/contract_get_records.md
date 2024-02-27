## Table of Contents

- [contract_get_records.proto](#contract_get_records-proto)
    - [ContractGetRecordsQuery](#proto-ContractGetRecordsQuery)
    - [ContractGetRecordsResponse](#proto-ContractGetRecordsResponse)
  



<a name="contract_get_records-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_records.proto
# Get contract records
Deprecated query messages to read all recent contract transaction records.

> REVIEW QUESTION
>> Can we delete this file and remove the related query entirely?
>> It appears it hasn't been supported for over 3½ years...

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetRecordsQuery"></a>

### ContractGetRecordsQuery
Deprecated and not supported after release `0.9.0`.
Request records of all transactions against the given contract in the last 25 hours.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract ID.<br/> The network SHALL return information for this smart contract, if successful. |






<a name="proto-ContractGetRecordsResponse"></a>

### ContractGetRecordsResponse
Deprecated and not supported after release `0.9.0`.
Response with records of all transactions against the given contract in the last 25 hours.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract that this response describes. |
| records | [TransactionRecord](#proto-TransactionRecord) | repeated | A list of records, each with contractCreateResult or contractCallResult as its body |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


