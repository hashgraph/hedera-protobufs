## Table of Contents

- [state/recordcache/recordcache.proto](#state_recordcache_recordcache-proto)
    - [TransactionReceiptEntries](#proto-TransactionReceiptEntries)
    - [TransactionReceiptEntry](#proto-TransactionReceiptEntry)
    - [TransactionRecordEntry](#proto-TransactionRecordEntry)
  



<a name="state_recordcache_recordcache-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/recordcache/recordcache.proto
# Record Cache
The Record Cache holds transaction records for a short time, and is the
source for responses to `transactionGetRecord` and `transactionGetReceipt`
queries.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TransactionReceiptEntries"></a>

### TransactionReceiptEntries
As transactions are handled and receipts are created, they are stored in state for a configured time
limit (perhaps, for example, 3 minutes). During this time window, any client can query the node and get the
receipt for the transaction. The TransactionReceiptEntries is the object stored in state with this information.
This object contains a list of TransactionReceiptEntry objects.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| entries | [TransactionReceiptEntry](#proto-TransactionReceiptEntry) | repeated |  |






<a name="proto-TransactionReceiptEntry"></a>

### TransactionReceiptEntry
An entry in the record cache with the receipt for a transaction.

When a transaction is handled a receipt is created. This receipt must be
stored in state for a configured time limit (e.g. 3 minutes).
During this time window, any client can query the node and retrieve the
receipt. This message, then, is the entry stored in state that enables
returning this receipt information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [uint64](#uint64) |  | A node identifier.<br/> This identifies the node that submitted the transaction to consensus. The value is the identifier as known to the current address book. <p> Valid node identifiers SHALL be between 0 and <tt>2<sup>63-1</sup></tt>, inclusive. |
| transaction_id | [TransactionID](#proto-TransactionID) |  | The id of the submitted transaction. |
| status | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | The resulting status of handling the transaction. |






<a name="proto-TransactionRecordEntry"></a>

### TransactionRecordEntry
As transactions are handled and records and receipts are created, they are
stored in state for a configured time period (for example, 3 minutes).
During this time, any client can query the node and get the record or receipt
for the transaction. The `TransactionRecordEntry` is the object stored in
state with this information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [int64](#int64) |  | A node identifier.<br/> This identifier is the node, as known to the address book, that submitted the transaction for consensus. <p> This SHALL be a whole number. |
| payer_account_id | [AccountID](#proto-AccountID) |  | An Account identifier for the payer for the transaction. <p> This MAY be the same as the account ID within the Transaction ID of the record, or it MAY be the account ID of the node that submitted the transaction to consensus if the account ID in the Transaction ID was not able to pay. |
| transaction_record | [TransactionRecord](#proto-TransactionRecord) |  | A transaction record for the transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



