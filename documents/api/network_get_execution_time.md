## Table of Contents

- [network_get_execution_time.proto](#network_get_execution_time-proto)
    - [NetworkGetExecutionTimeQuery](#proto-NetworkGetExecutionTimeQuery)
    - [NetworkGetExecutionTimeResponse](#proto-NetworkGetExecutionTimeResponse)
  



<a name="network_get_execution_time-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_get_execution_time.proto
# Get Execution Time
Given a list of transaction identifiers, return the time required to process each
transaction, excluding pre-consensus processing, consensus, and post-processing
(e.g. record stream generation).

> Important
>> This query is obsolete and not supported.<br/>
>> Any query of this type that is submitted SHALL fail with a `PRE_CHECK` result
>> of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NetworkGetExecutionTimeQuery"></a>

### NetworkGetExecutionTimeQuery
Retrieve the time, in nanoseconds, spent in direct processing for one or more
recent transactions.

For each transaction identifier provided, if that transaction is sufficiently recent
(that is, it is within the range of the configuration value
`stats.executionTimesToTrack`), the node SHALL return the time, in nanoseconds, spent
to directly process that transaction.<br/>
This time will generally correspond to the time spent in a `handle` call within the workflow.

Note that because each node processes every transaction for the Hedera network, this
query MAY be sent to any node.

> REVIEW NOTE
>> This query is no longer supported.  Should we deprecate the messages and service gRPC call?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| transaction_ids | [TransactionID](#proto-TransactionID) | repeated | A list of transaction identifiers to query.<br/> All of the queried transaction identifiers MUST have execution time available. If any identifier does not have available execution time, the query SHALL fail with an `INVALID_TRANSACTION_ID` response. |






<a name="proto-NetworkGetExecutionTimeResponse"></a>

### NetworkGetExecutionTimeResponse
A response to a `networkGetExecutionTime` query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| execution_times | [uint64](#uint64) | repeated | A list of execution times, in nanoseconds. This list SHALL be in the same order as the transaction identifiers were presented in the query. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


