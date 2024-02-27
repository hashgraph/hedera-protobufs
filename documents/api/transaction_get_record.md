## Table of Contents

- [transaction_get_record.proto](#transaction_get_record-proto)
    - [TransactionGetRecordQuery](#proto-TransactionGetRecordQuery)
    - [TransactionGetRecordResponse](#proto-TransactionGetRecordResponse)
  



<a name="transaction_get_record-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_get_record.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionGetRecordQuery"></a>

### TransactionGetRecordQuery
Get the record for a transaction. If the transaction requested a record, then the record lasts
for one hour, and a state proof is available for it. If the transaction created an account, file,
or smart contract instance, then the record will contain the ID for what it created. If the
transaction called a smart contract function, then the record contains the result of that call.
If the transaction was a cryptocurrency transfer, then the record includes the TransferList which
gives the details of that transfer. If the transaction didn't return anything that should be in
the record, then the results field will be set to nothing.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| transactionID | [TransactionID](#proto-TransactionID) |  | The ID of the transaction for which the record is requested. |
| includeDuplicates | [bool](#bool) |  | Whether records of processing duplicate transactions should be returned along with the record of processing the first consensus transaction with the given id whose status was neither <tt>INVALID_NODE_ACCOUNT</tt> nor <tt>INVALID_PAYER_SIGNATURE</tt>; <b>or</b>, if no such record exists, the record of processing the first transaction to reach consensus with the given transaction id.. |
| include_child_records | [bool](#bool) |  | Whether the response should include the records of any child transactions spawned by the top-level transaction with the given transactionID. |






<a name="proto-TransactionGetRecordResponse"></a>

### TransactionGetRecordResponse
Response when the client sends the node TransactionGetRecordQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| transactionRecord | [TransactionRecord](#proto-TransactionRecord) |  | Either the record of processing the first consensus transaction with the given id whose status was neither <tt>INVALID_NODE_ACCOUNT</tt> nor <tt>INVALID_PAYER_SIGNATURE</tt>; <b>or</b>, if no such record exists, the record of processing the first transaction to reach consensus with the given transaction id. |
| duplicateTransactionRecords | [TransactionRecord](#proto-TransactionRecord) | repeated | The records of processing all consensus transaction with the same id as the distinguished record above, in chronological order. |
| child_transaction_records | [TransactionRecord](#proto-TransactionRecord) | repeated | The records of processing all child transaction spawned by the transaction with the given top-level id, in consensus order. Always empty if the top-level status is UNKNOWN. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


