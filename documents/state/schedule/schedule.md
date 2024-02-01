## Table of Contents

- [state/schedule/schedule.proto](#state_schedule_schedule-proto)
    - [Schedule](#proto-Schedule)
    - [ScheduleList](#proto-ScheduleList)
  



<a name="state_schedule_schedule-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/schedule/schedule.proto
# Scheduled Transaction
Information regarding Scheduled Transactions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Schedule"></a>

### Schedule
Representation of a Hedera Schedule entry in the network Merkle tree.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| schedule_id | [ScheduleID](#proto-ScheduleID) |  | This schedule's ID within the global network state.<br/> This value SHALL be unique within the network. |
| deleted | [bool](#bool) |  | A flag indicating this schedule is deleted.<br/> A schedule SHALL either be executed or deleted, but never both. |
| executed | [bool](#bool) |  | A flag indicating this schedule has executed.<br/> A schedule SHALL either be executed or deleted, but never both. |
| wait_for_expiry | [bool](#bool) |  | A schedule flag to wait for expiration before executing. A schedule SHALL be executed immediately when all necessary signatures are gathered, unless this flag is set.<br/> If this flag is set, the schedule SHALL wait until the consensus time reaches `expiration_time_provided`, when signatures MUST again be verified, and if all required signatures are present at that time, the schedule SHALL be executed. Otherwise the schedule SHALL expire without execution. <p> Note that a schedule is always removed from state after it expires, regardless of whether it was executed or not. |
| memo | [string](#string) |  | The memo associated with this schedule.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| scheduler_account_id | [AccountID](#proto-AccountID) |  | The scheduler account for this schedule.<br/> This SHALL be the account that submitted the original ScheduleCreate transaction. |
| payer_account_id | [AccountID](#proto-AccountID) |  | The explicit payer account for the scheduled transaction.<br/> If set, this account SHALL be added to the accounts that MUST sign the schedule before it may execute. |
| admin_key | [Key](#proto-Key) |  | The admin key for this schedule.<br/> This key, if set, MUST sign any `schedule_delete` transaction.<br/> If not set, then this schedule SHALL NOT be deleted, and any `schedule_delete` transaction for this schedule SHALL fail. |
| schedule_valid_start | [Timestamp](#proto-Timestamp) |  | The transaction valid start value for this schedule.<br/> This MUST be set, and SHALL be copied from the `TransactionID` of the original `schedule_create` transaction. |
| provided_expiration_second | [int64](#int64) |  | The requested expiration time of the schedule if provided by the user.<br/> If not provided in the `schedule_create` transaction, this SHALL be set to a default value equal to the current consensus time, forward offset by the maximum schedule expiration time in the current dynamic network configuration (typically 62 days).<br/> The actual `calculated_expiration_second` MAY be "earlier" than this, but MUST NOT be later. |
| calculated_expiration_second | [int64](#int64) |  | The calculated expiration time of the schedule.<br/> This SHALL be calculated from the requested expiration time in the `schedule_create` transaction, and limited by the maximum expiration time in the current dynamic network configuration (typically 62 days). <p> The schedule SHALL be removed from global network state after the network reaches a consensus time greater than or equal to this value. |
| resolution_time | [Timestamp](#proto-Timestamp) |  | The consensus timestamp of the transaction that executed or deleted this schedule.<br/> This value SHALL be set to the `current_consensus_time` when a `schedule_delete` transaction is completed.<br/> This value SHALL be set to the `current_consensus_time` when the scheduled transaction is executed, either as a result of gathering the final required signature, or, if long-term schedule execution is enabled, at the requested execution time. |
| scheduled_transaction | [SchedulableTransactionBody](#proto-SchedulableTransactionBody) |  | The scheduled transaction to execute.<br/> This MUST be one of the transaction types permitted in the current value of the `schedule.whitelist` in the dynamic network configuration.<br/> |
| original_create_transaction | [TransactionBody](#proto-TransactionBody) |  | The full transaction that created this schedule.<br/> This is primarily used for duplicate schedule create detection. This is also the source of the parent transaction ID, from which the child transaction ID is derived when the `scheduled_transaction` is executed. |
| signatories | [Key](#proto-Key) | repeated | All of the "primitive" keys that have already signed this schedule.<br/> The scheduled transaction will not be executed before this list is sufficient to "activate" the required keys for the scheduled transaction.<br/> A Key SHALL NOT be stored in this list unless the corresponding private key has signed either the original `schedule_create` transaction or a subsequent `schedule_sign` transaction intended for, and referencing to, this specific schedule. <p> The only keys stored are "primitive" keys (ED25519 or ECDSA_SECP256K1) in order to ensure that any key list or threshold keys are correctly handled, regardless of signing order, intervening changes, or other situations. The `scheduled_transaction` SHALL execute only if, at the time of execution, this list contains sufficient public keys to satisfy the full requirements for signature on that transaction. |






<a name="proto-ScheduleList"></a>

### ScheduleList
A message for storing a list of schedules in state.

This is used to store lists of schedules that expire at a particular time or that have the same
simplified hash code.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| schedules | [Schedule](#proto-Schedule) | repeated | A list of schedules, in encounter order. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


