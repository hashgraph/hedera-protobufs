## Table of Contents

- [state/schedule/schedule.proto](#state_schedule_schedule-proto)
    - [Schedule](#proto-Schedule)
    - [ScheduleIdList](#proto-ScheduleIdList)
    - [ScheduleList](#proto-ScheduleList)
    - [ScheduledCounts](#proto-ScheduledCounts)
    - [ScheduledOrder](#proto-ScheduledOrder)
  



<a name="state_schedule_schedule-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/schedule/schedule.proto
# Scheduled Transaction
Information regarding Scheduled Transactions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Schedule"></a>

### Schedule
Representation of a Hedera Schedule entry in the network Merkle tree.<br/>
A Schedule represents a request to run a transaction _at some future time_
either when the `Schedule` expires (if long term schedules are enabled and
`wait_for_expiry` is true) or as soon as the `Schedule` has gathered
enough signatures via any combination of the `scheduleCreate` and 0 or more
subsequent `scheduleSign` transactions.


| Field | Type | Description |
| ----- | ---- | ----------- |
| schedule_id | [ScheduleID](#proto-ScheduleID) | This schedule's ID within the global network state. <p> This value SHALL be unique within the network. |
| deleted | [bool](#bool) | A flag indicating this schedule is deleted. <p> A schedule SHALL either be executed or deleted, but never both. |
| executed | [bool](#bool) | A flag indicating this schedule has executed. <p> A schedule SHALL either be executed or deleted, but never both. |
| wait_for_expiry | [bool](#bool) | A schedule flag to wait for expiration before executing. <p> A schedule SHALL be executed immediately when all necessary signatures are gathered, unless this flag is set.<br/> If this flag is set, the schedule SHALL wait until the consensus time reaches `expiration_time_provided`, when signatures MUST again be verified. If all required signatures are present at that time, the schedule SHALL be executed. Otherwise the schedule SHALL expire without execution. <p> Note that a schedule is always removed from state after it expires, regardless of whether it was executed or not. |
| memo | [string](#string) | A short description for this schedule. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8. |
| scheduler_account_id | [AccountID](#proto-AccountID) | The scheduler account for this schedule. <p> This SHALL be the account that submitted the original ScheduleCreate transaction. |
| payer_account_id | [AccountID](#proto-AccountID) | The explicit payer account for the scheduled transaction. <p> If set, this account SHALL be added to the accounts that MUST sign the schedule before it may execute. |
| admin_key | [Key](#proto-Key) | The admin key for this schedule. <p> This key, if set, MUST sign any `schedule_delete` transaction.<br/> If not set, then this schedule SHALL NOT be deleted, and any `schedule_delete` transaction for this schedule SHALL fail. |
| schedule_valid_start | [Timestamp](#proto-Timestamp) | The transaction valid start value for this schedule. <p> This MUST be set, and SHALL be copied from the `TransactionID` of the original `schedule_create` transaction. |
| provided_expiration_second | [int64](#int64) | The requested expiration time of the schedule if provided by the user. <p> If not provided in the `schedule_create` transaction, this SHALL be set to a default value equal to the current consensus time, forward offset by the maximum schedule expiration time in the current dynamic network configuration (typically 62 days).<br/> The actual `calculated_expiration_second` MAY be "earlier" than this, but MUST NOT be later. |
| calculated_expiration_second | [int64](#int64) | The calculated expiration time of the schedule. <p> This SHALL be calculated from the requested expiration time in the `schedule_create` transaction, and limited by the maximum expiration time in the current dynamic network configuration (typically 62 days). <p> The schedule SHALL be removed from global network state after the network reaches a consensus time greater than or equal to this value. |
| resolution_time | [Timestamp](#proto-Timestamp) | The consensus timestamp of the transaction that executed or deleted this schedule. <p> This value SHALL be set to the `current_consensus_time` when a `schedule_delete` transaction is completed.<br/> This value SHALL be set to the `current_consensus_time` when the scheduled transaction is executed, either as a result of gathering the final required signature, or, if long-term schedule execution is enabled, at the requested execution time. |
| scheduled_transaction | [SchedulableTransactionBody](#proto-SchedulableTransactionBody) | The scheduled transaction to execute. <p> This MUST be one of the transaction types permitted in the current value of the `schedule.whitelist` in the dynamic network configuration. |
| original_create_transaction | [TransactionBody](#proto-TransactionBody) | The full transaction that created this schedule. <p> This is primarily used for duplicate schedule create detection. This is also the source of the parent transaction ID, from which the child transaction ID is derived when the `scheduled_transaction` is executed. |
| signatories | [Key](#proto-Key) | All of the "primitive" keys that have already signed this schedule. <p> The scheduled transaction SHALL NOT be executed before this list is sufficient to "activate" the required keys for the scheduled transaction.<br/> A Key SHALL NOT be stored in this list unless the corresponding private key has signed either the original `schedule_create` transaction or a subsequent `schedule_sign` transaction intended for, and referencing to, this specific schedule. <p> The only keys stored are "primitive" keys (ED25519 or ECDSA_SECP256K1) in order to ensure that any key list or threshold keys are correctly handled, regardless of signing order, intervening changes, or other situations. The `scheduled_transaction` SHALL execute only if, at the time of execution, this list contains sufficient public keys to satisfy the full requirements for signature on that transaction. |






<a name="proto-ScheduleIdList"></a>

### ScheduleIdList
A message for storing a list of schedule identifiers in state.<br/>
This is used to store lists of `ScheduleID` values.
One example is all schedules that expire at a particular time.


| Field | Type | Description |
| ----- | ---- | ----------- |
| schedule_ids | [ScheduleID](#proto-ScheduleID) | A list of schedule identifiers, in no particular order. <p> While the order is not _specified_, it MUST be deterministic. |






<a name="proto-ScheduleList"></a>

### ScheduleList
A message for storing a list of schedules in state.<br/>
This is used to store lists of `Schedule` values.
One example is all schedules that expire at a particular time.


| Field | Type | Description |
| ----- | ---- | ----------- |
| schedules | [Schedule](#proto-Schedule) | a list of schedules, in no particular order. <p> While the order is not _specified_, it MUST be deterministic. |






<a name="proto-ScheduledCounts"></a>

### ScheduledCounts
A count of schedules scheduled and processed.
This value summarizes the counts of scheduled and processed transactions
within a particular consensus second.


| Field | Type | Description |
| ----- | ---- | ----------- |
| number_scheduled | [uint32](#uint32) | A number of transactions scheduled to expire at a consensus second. |
| number_processed | [uint32](#uint32) | A number of scheduled transactions that have been processed at a consensus second. |






<a name="proto-ScheduledOrder"></a>

### ScheduledOrder
An ordering for a scheduled transaction.<br/>
This establishes the order in which scheduled transactions intended to
execute at a particular consensus second will be executed.

Scheduled transactions that have the same `expiry_second` SHALL execute
in ascending order of `order_number`.


| Field | Type | Description |
| ----- | ---- | ----------- |
| expiry_second | [uint64](#uint64) | A consensus second in which the transaction is to be executed. This is _also_ the consensus time when the transaction will expire if it has not gathered enough signatures in time. |
| order_number | [uint32](#uint32) | An ordered position within a conceptual list.<br/> This is the ordered position within the consensus second when the associated transaction will be executed. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



