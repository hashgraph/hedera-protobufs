## Table of Contents

- [transaction_get_receipt.proto](#transaction_get_receipt-proto)
    - [TransactionGetReceiptQuery](#proto-TransactionGetReceiptQuery)
    - [TransactionGetReceiptResponse](#proto-TransactionGetReceiptResponse)
  



<a name="transaction_get_receipt-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_get_receipt.proto
# Get Transaction Receipt
This query is central to client interactions. A client must query
the network for the "receipt" after a transaction is submitted to know
whether the transaction succeeded and the consensus result.

> Implementation Note
>> This query is _defined_ for "Crypto" service, but is _implemented_ by
>> the "Network Admin" service.

> Note
>> The mechanism for transaction receipts and results is subject to
>> considerable change in the near future. Clients heavily dependent
>> on direct network queries for transaction receipts may consider
>> changes needed to query a mirror node for transaction receipts
>> and results instead.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TransactionGetReceiptQuery"></a>

### TransactionGetReceiptQuery
A query to retrieve a transaction receipt.
This query retrieves the post-consensus (final) result of a transaction.
A transaction receipt may not be available if queried too early
(less than 5-10 seconds), or too late (more than 3 minutes). If a receipt
is available, it contains basic transaction results. A query to a mirror
node (or other archival system) is required to obtain full detail for a
transaction, or any result after the basic receipt time period.

This query is "free". The payment field in the header MUST be empty.<br/>
If a receipt is not available, the response SHALL be `UNKNOWN`.<br/>
A transaction receipt SHALL be available after the network reaches
consensus for a transaction.<br/>
A transaction receipt SHALL NOT be available after the end of the network
configured "receipt period", typically three(3) minutes.

<dl>
  <dt>What is the "first" transaction?</dt>
  <dd>The "first" transaction SHALL be the the transaction with
      the earliest consensus time and a status that is neither
      `INVALID_NODE_ACCOUNT` nor `INVALID_PAYER_SIGNATURE`.<br/>
      If no transaction is found meeting this status criteria, the
      "first" transaction SHALL be the transaction with the earliest
      consensus time.</dd>
 <dt>What is a "child" transaction?</dt>
 <dd>A "child" transaction is any transaction created in the process of
     completing another transaction. These are most common with a smart
     contract call, where a call to a contract may initiate one or more
     additional transactions to complete a complex process.</dd>
</dl>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| transactionID | [TransactionID](#proto-TransactionID) |  | A transaction identifier. <p> This MUST contain the full identifier, as submitted, for the transaction to query. |
| includeDuplicates | [bool](#bool) |  | A flag to request duplicates. <p> If set, every transaction receipt within the receipt period that matches the requested transaction identifier SHALL be returned.<br/> If not set, duplicate transactions SHALL NOT be returned.<br/> If not set, only the receipt for the first matching transaction to reach consensus SHALL be returned. |
| include_child_receipts | [bool](#bool) |  | A flag to request "child" receipts. <p> If set, the response SHALL include receipts for each child transaction executed as part of the requested parent transaction.<br/> If not set, the response SHALL NOT include any receipts for child transactions. |






<a name="proto-TransactionGetReceiptResponse"></a>

### TransactionGetReceiptResponse
Response message for a `getTransactionReceipts` query.

The `receipt` field SHALL return the receipt for the "first" transaction
that matches the transaction identifier requested.<br/>
If receipts for duplicate transactions are requested, those duplicate
receipts SHALL be present in the `duplicateTransactionReceipts` list.<br/>
If receipts for child transactions are requested, those child receipts
SHALL be present in the `child_transaction_receipts` list.<br/>
A state proof SHALL NOT be provided for this response; transaction receipts
are not retained in network state.

<dl>
  <dt>What is the "first" transaction?</dt>
  <dd>The "first" transaction receipt SHALL be the receipt for the
      first transaction with status that is neither
      `INVALID_NODE_ACCOUNT` nor `INVALID_PAYER_SIGNATURE`.<br/>
      If no transaction is found meeting the status criteria, the
      "first" transaction SHALL be the first transaction by
      consensus time.</dd>
 <dt>What is a "child" transaction?</dt>
 <dd>A "child" transaction is any transaction created in the process of
     completing another transaction. These are most common with a smart
     contract call, where a call to a contract may initiate one or more
     additional transactions to complete a complex process.</dd>
</dl>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| receipt | [TransactionReceipt](#proto-TransactionReceipt) |  | A transaction receipt. <p> This SHALL be the receipt for the "first" transaction that matches the transaction identifier requested.<br/> If the identified transaction has not reached consensus, this receipt SHALL have a `status` of `UNKNOWN`.<br/> If the identified transaction reached consensus prior to the current configured receipt period (typically the last 180 seconds), this receipt SHALL have a `status` of `UNKNOWN`. |
| duplicateTransactionReceipts | [TransactionReceipt](#proto-TransactionReceipt) | repeated | A list of duplicate transaction receipts. <p> If the request set the `includeDuplicates` flat, this list SHALL include the receipts for each duplicate transaction associated to the requested transaction identifier. If the request did not set the `includeDuplicates` flag, this list SHALL be empty.<br/> If the `receipt` status is `UNKNOWN`, this list SHALL be empty.<br/> This list SHALL be in order by consensus timestamp. |
| child_transaction_receipts | [TransactionReceipt](#proto-TransactionReceipt) | repeated | A list of receipts for all child transactions spawned by the requested transaction. <p> If the request set the `include_child_receipts` flag, this list SHALL include receipts for each child transaction executed as part of the requested parent transaction.<br/> If the request did not set the `include_child_receipts` flag, this list SHALL be empty. <br/> If the parent transaction did not initiate any child transactions this list SHALL be empty.<br/> If the `receipt` status is `UNKNOWN`, this list SHALL be empty.<br/> This list SHALL be in order by consensus timestamp. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



