## Table of Contents

- [transaction_get_fast_record.proto](#transaction_get_fast_record-proto)
    - [TransactionGetFastRecordQuery](#proto-TransactionGetFastRecordQuery)
    - [TransactionGetFastRecordResponse](#proto-TransactionGetFastRecordResponse)
  



<a name="transaction_get_fast_record-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_get_fast_record.proto
# Get Fast Record
Get a recent transaction record "fast".

> Important
>> This query is obsolete and not supported.<br/>
>> Any query of this type that is submitted SHALL fail with a `PRE_CHECK` result
>> of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionGetFastRecordQuery"></a>

### TransactionGetFastRecordQuery
Get the tx record of a transaction, given its transaction ID. Once a transaction reaches
consensus, then information about whether it succeeded or failed will be available until the end
of the receipt period.  Before and after the receipt period, and for a transaction that was never
submitted, the receipt is unknown.  This query is free (the payment field is left empty).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| transactionID | [TransactionID](#proto-TransactionID) |  | The ID of the transaction for which the record is requested. |






<a name="proto-TransactionGetFastRecordResponse"></a>

### TransactionGetFastRecordResponse
Response when the client sends the node TransactionGetFastRecordQuery. If it created a new entity
(account, file, or smart contract instance) then one of the three ID fields will be filled in
with the ID of the new entity. Sometimes a single transaction will create more than one new
entity, such as when a new contract instance is created, and this also creates the new account
that it owned by that instance.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| transactionRecord | [TransactionRecord](#proto-TransactionRecord) |  | The requested transaction records |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


