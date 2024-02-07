## Table of Contents

- [schedule_get_info.proto](#schedule_get_info-proto)
    - [ScheduleGetInfoQuery](#proto-ScheduleGetInfoQuery)
    - [ScheduleGetInfoResponse](#proto-ScheduleGetInfoResponse)
    - [ScheduleInfo](#proto-ScheduleInfo)
  



<a name="schedule_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_get_info.proto
# Schedule Get Information
Query body and response to retrieve information about a scheduled
transaction.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ScheduleGetInfoQuery"></a>

### ScheduleGetInfoQuery
Request for information about a scheduled transaction.

If the requested schedule does not exist, the network SHALL respond
with `INVALID_SCHEDULE_ID`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | A schedule identifier. <p> This SHALL identify the schedule to retrieve.<br/> This field is REQUIRED. |






<a name="proto-ScheduleGetInfoResponse"></a>

### ScheduleGetInfoResponse
A response message for a `getScheduleInfo` query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| scheduleInfo | [ScheduleInfo](#proto-ScheduleInfo) |  | Detail information for a schedule. <p> This field SHALL contain all available schedule detail. |






<a name="proto-ScheduleInfo"></a>

### ScheduleInfo
Information summarizing schedule state


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | A schedule identifier. <p> This SHALL identify the schedule retrieved. |
| deletion_time | [Timestamp](#proto-Timestamp) |  | A deletion timestamp. <p> If the schedule was deleted, this SHALL be set to the consensus timestamp of the `deleteSchedule` transaction.<br/> If the schedule is _not_ deleted, this field SHALL NOT be set. |
| execution_time | [Timestamp](#proto-Timestamp) |  | An execution timestamp. <p> If the schedule was completed, and the _scheduled_ transaction executed, this SHALL be set to the consensus timestamp of the transaction that initiated that execution.<br/> If the schedule is _not_ complete, this field SHALL NOT be set. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | An expiration timestamp.<br/> This represents the time at which the schedule will expire. For a long-term schedule (if enabled) this is when the schedule will be executed, assuming it meets signature requirements at that time. For a short-term schedule, this is the deadline to complete the signature requirements for the scheduled transaction to execute. Regardless of schedule type, the schedule will be removed from state when it expires. <p> A schedule SHALL be removed from state when it expires.<br/> A short-term schedule MUST meet signature requirements strictly before expiration or it SHALL NOT be executed.<br/> A long-term schedule SHALL be executed if, and only if, all signature requirements for the scheduled transaction are met at expiration.<br/> A long-term schedule SHALL NOT be executed if any signature requirement for the scheduled transaction are not met at expiration.<br/> |
| scheduledTransactionBody | [SchedulableTransactionBody](#proto-SchedulableTransactionBody) |  | A scheduled transaction. <p> This SHALL be a transaction type enabled in the network property `scheduling.whitelist`, and SHALL NOT be any other transaction type.<br/> This transaction SHALL be executed if the schedule meets all signature and execution time requirements for this transaction.<br/> The signature requirements for this transaction SHALL be evaluated at schedule creation, SHALL be reevaluated with each `signSchedule` transaction, and, for long-term schedules, SHALL be reevaluated when the schedule expires.<br/> |
| memo | [string](#string) |  | A short description for this schedule. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| adminKey | [Key](#proto-Key) |  | The key used to delete the schedule from state |
| signers | [KeyList](#proto-KeyList) |  | A list of "valid" signatures for this schedule.<br/> This list contains only "primitive" (i.e. cryptographic or contract) signatures. The full signature requirements for the scheduled transaction are evaluated as if this list of keys had signed the scheduled transaction directly. <p> This list SHALL contain every "primitive" key that has signed the original `createSchedule`, or any subsequent `signSchedule` transaction.<br/> This list MAY elide any signature not likely to be required by the scheduled transaction. Such requirement SHOULD be evaluated when the signature is presented (i.e. during evaluation of a `createSchedule` or `signSchedule` transaction). |
| creatorAccountID | [AccountID](#proto-AccountID) |  | An account identifier. <p> This SHALL identify the account that created this schedule. |
| payerAccountID | [AccountID](#proto-AccountID) |  | An account identifier. <p> The identified account SHALL pay the full transaction fee for the scheduled transaction _when it executes_. |
| scheduledTransactionID | [TransactionID](#proto-TransactionID) |  | A transaction identifier. <p> This SHALL be recorded as the transaction identifier for the _scheduled_ transaction, if (and when) it is executed. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response.<br/> This is originally defined in `HIP-198` and depends on network configuration.<br/> The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |
| wait_for_expiry | [bool](#bool) |  | A flag indicating this schedule will execute when it expires. <p> If this field is set <ul> <li>This schedule SHALL be considered a "long-term" schedule.</li> <li>This schedule SHALL be evaluated when the network consensus time reaches the `expirationTime`, and if the signature requirements for the scheduled transaction are met at that time, the scheduled transaction SHALL be executed.</li> <li>This schedule SHALL NOT be executed before the network consensus time reaches the `expirationTime`.</li> </ul> If this field is not set <ul> <li>This schedule SHALL be considered a "short-term" schedule.</li> <li>This schedule SHALL be evaluated when created, and reevaluated with each `signSchedule` transaction, and if the signature requirements for the scheduled transaction are met at that time, the scheduled transaction SHALL be executed immediately.</li> <li>This schedule SHALL be executed as soon as the signature requirements are met, and MUST be executed before the network consensus time reaches the `expirationTime`, if at all.</li> </ul> |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



