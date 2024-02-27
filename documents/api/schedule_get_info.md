## Table of Contents

- [schedule_get_info.proto](#schedule_get_info-proto)
    - [ScheduleGetInfoQuery](#proto-ScheduleGetInfoQuery)
    - [ScheduleGetInfoResponse](#proto-ScheduleGetInfoResponse)
    - [ScheduleInfo](#proto-ScheduleInfo)
  



<a name="schedule_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_get_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ScheduleGetInfoQuery"></a>

### ScheduleGetInfoQuery
Gets information about a schedule in the network's action queue.

Responds with <tt>INVALID_SCHEDULE_ID</tt> if the requested schedule doesn't exist.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | The id of the schedule to interrogate |






<a name="proto-ScheduleGetInfoResponse"></a>

### ScheduleGetInfoResponse
Response wrapper for the <tt>ScheduleInfo</tt>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| scheduleInfo | [ScheduleInfo](#proto-ScheduleInfo) |  | The information requested about this schedule instance |






<a name="proto-ScheduleInfo"></a>

### ScheduleInfo
Information summarizing schedule state


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | The id of the schedule |
| deletion_time | [Timestamp](#proto-Timestamp) |  | If the schedule has been deleted, the consensus time when this occurred |
| execution_time | [Timestamp](#proto-Timestamp) |  | If the schedule has been executed, the consensus time when this occurred |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The time at which the schedule will be evaluated for execution and then expire.

Note: Before Long Term Scheduled Transactions are enabled, Scheduled Transactions will _never_ execute at expiration - they will _only_ execute during the initial ScheduleCreate transaction or via ScheduleSign transactions and will _always_ expire at expirationTime. |
| scheduledTransactionBody | [SchedulableTransactionBody](#proto-SchedulableTransactionBody) |  | The scheduled transaction |
| memo | [string](#string) |  | The publicly visible memo of the schedule |
| adminKey | [Key](#proto-Key) |  | The key used to delete the schedule from state |
| signers | [KeyList](#proto-KeyList) |  | The Ed25519 keys the network deems to have signed the scheduled transaction |
| creatorAccountID | [AccountID](#proto-AccountID) |  | The id of the account that created the schedule |
| payerAccountID | [AccountID](#proto-AccountID) |  | The id of the account responsible for the service fee of the scheduled transaction |
| scheduledTransactionID | [TransactionID](#proto-TransactionID) |  | The transaction id that will be used in the record of the scheduled transaction (if it executes) |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| wait_for_expiry | [bool](#bool) |  | When set to true, the transaction will be evaluated for execution at expiration_time instead of when all required signatures are received. When set to false, the transaction will execute immediately after sufficient signatures are received to sign the contained transaction. During the initial ScheduleCreate transaction or via ScheduleSign transactions.

Note: this field is unused until Long Term Scheduled Transactions are enabled. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


