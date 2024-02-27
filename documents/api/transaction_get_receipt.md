## Table of Contents

- [transaction_get_receipt.proto](#transaction_get_receipt-proto)
    - [TransactionGetReceiptQuery](#proto-TransactionGetReceiptQuery)
    - [TransactionGetReceiptResponse](#proto-TransactionGetReceiptResponse)
  



<a name="transaction_get_receipt-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_get_receipt.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionGetReceiptQuery"></a>

### TransactionGetReceiptQuery
Get the receipt of a transaction, given its transaction ID. Once a transaction reaches consensus,
then information about whether it succeeded or failed will be available until the end of the
receipt period.  Before and after the receipt period, and for a transaction that was never
submitted, the receipt is unknown.  This query is free (the payment field is left empty). No
State proof is available for this response


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| transactionID | [TransactionID](#proto-TransactionID) |  | The ID of the transaction for which the receipt is requested. |
| includeDuplicates | [bool](#bool) |  | Whether receipts of processing duplicate transactions should be returned along with the receipt of processing the first consensus transaction with the given id whose status was neither <tt>INVALID_NODE_ACCOUNT</tt> nor <tt>INVALID_PAYER_SIGNATURE</tt>; <b>or</b>, if no such receipt exists, the receipt of processing the first transaction to reach consensus with the given transaction id. |
| include_child_receipts | [bool](#bool) |  | Whether the response should include the receipts of any child transactions spawned by the top-level transaction with the given transactionID. |






<a name="proto-TransactionGetReceiptResponse"></a>

### TransactionGetReceiptResponse
Response when the client sends the node TransactionGetReceiptQuery. If it created a new entity
(account, file, or smart contract instance) then one of the three ID fields will be filled in
with the ID of the new entity. Sometimes a single transaction will create more than one new
entity, such as when a new contract instance is created, and this also creates the new account
that it owned by that instance. No State proof is available for this response


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| receipt | [TransactionReceipt](#proto-TransactionReceipt) |  | Either the receipt of processing the first consensus transaction with the given id whose status was neither <tt>INVALID_NODE_ACCOUNT</tt> nor <tt>INVALID_PAYER_SIGNATURE</tt>; <b>or</b>, if no such receipt exists, the receipt of processing the first transaction to reach consensus with the given transaction id. |
| duplicateTransactionReceipts | [TransactionReceipt](#proto-TransactionReceipt) | repeated | The receipts of processing all transactions with the given id, in consensus time order. |
| child_transaction_receipts | [TransactionReceipt](#proto-TransactionReceipt) | repeated | The receipts (if any) of all child transactions spawned by the transaction with the given top-level id, in consensus order. Always empty if the top-level status is UNKNOWN. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


