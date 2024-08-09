## Table of Contents

- [state/recordcache/recordcache.proto](#state_recordcache_recordcache-proto)
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


<a name="proto-TransactionRecordEntry"></a>

### TransactionRecordEntry
As transactions are handled and records and receipts are created, they are
stored in state for a configured time period (for example, 3 minutes).
During this time, any client can query the node and get the record or receipt
for the transaction. The `TransactionRecordEntry` is the object stored in
state with this information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [int64](#int64) |  | The ID of the node that submitted the transaction to consensus. <p> The ID is the ID of the node as known by the address book. Valid node IDs are whole numbers. |
| payer_account_id | [AccountID](#proto-AccountID) |  | The AccountID of the payer of the transaction. <p> This MAY be the same as the account ID within the Transaction ID of the record, or it MAY be the account ID of the node that submitted the transaction to consensus if the account ID in the Transaction ID was not able to pay. |
| transaction_record | [TransactionRecord](#proto-TransactionRecord) |  | The transaction record for the transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


