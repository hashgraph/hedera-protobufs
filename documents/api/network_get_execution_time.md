## Table of Contents

- [network_get_execution_time.proto](#network_get_execution_time-proto)
    - [NetworkGetExecutionTimeQuery](#proto-NetworkGetExecutionTimeQuery)
    - [NetworkGetExecutionTimeResponse](#proto-NetworkGetExecutionTimeResponse)
  



<a name="network_get_execution_time-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_get_execution_time.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NetworkGetExecutionTimeQuery"></a>

### NetworkGetExecutionTimeQuery
Gets the time in nanoseconds spent in <tt>handleTransaction</tt> for one or more
TransactionIDs (assuming they have reached consensus "recently", since only a limited
number of execution times are kept in-memory, depending on the value of the node-local
property <tt>stats.executionTimesToTrack</tt>).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | standard info sent from client to node including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| transaction_ids | [TransactionID](#proto-TransactionID) | repeated | The id(s) of the transactions to get the execution time(s) of |






<a name="proto-NetworkGetExecutionTimeResponse"></a>

### NetworkGetExecutionTimeResponse
Response when the client sends the node NetworkGetExecutionTimeQuery; returns
INVALID_TRANSACTION_ID if any of the given TransactionIDs do not have available
execution times in the answering node.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| execution_times | [uint64](#uint64) | repeated | The execution time(s) of the requested TransactionIDs, if available |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


