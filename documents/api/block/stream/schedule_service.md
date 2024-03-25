## Table of Contents

- [stream/schedule_service.proto](#stream_schedule_service-proto)
    - [CreateScheduleOutput](#com-hedera-hapi-block-stream-CreateScheduleOutput)
    - [DeleteScheduleOutput](#com-hedera-hapi-block-stream-DeleteScheduleOutput)
    - [SignScheduleOutput](#com-hedera-hapi-block-stream-SignScheduleOutput)
  



<a name="stream_schedule_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/schedule_service.proto
# Schedule Service
Block stream messages that report the results of transactions handled by the `Schedule` service.
The Schedule service handles delayed execution in two major forms.
- Transactions that only execute after being signed, via scheduleSign transactions,
  with additional keys beyond the keys that signe the scheduleCreate transaction.
- Transactions that only execute after a specified consensus time.

Some outputs contain a scheduled transaction identifier. That value SHALL be set if,
and only if, the transaction resulted in _execution_ of the scheduled child transaction.
Most outputs from this service SHALL NOT set the scheduled transaction identifier,
because the transaction has not executed yet. Only when the schedule has gathered
all of the signatures REQUIRED to execute the scheduled child transaction is the
network able to execute that child transaction, and assign a final transaction
identifier.

When a scheduled child transaction is executed, the identifier of the schedule
that executed that transaction SHALL be included as a `schedule_ref` in the _result_ for
the _child_ transaction. The output of the schedule transaction (create or sign) SHALL NOT
contain the `schedule_ref`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-CreateScheduleOutput"></a>

### CreateScheduleOutput
Block Stream data for a `createSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduled_transaction_id | [proto.TransactionID](#proto-TransactionID) |  | A scheduled transaction identifier.<br/> This value SHALL be the transaction identifier for the _scheduled_ child transaction executed as a result of gathering sufficient signatures to complete the schedule.<br/> This value SHALL NOT be set unless the scheduled transaction was executed as a child of this schedule create transaction.<br/> This value SHALL NOT be set unless this schedule create transaction was signed by sufficient keys to meet the signature requirements for the scheduled child transaction immediately. |






<a name="com-hedera-hapi-block-stream-DeleteScheduleOutput"></a>

### DeleteScheduleOutput
Block Stream data for a `deleteSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-SignScheduleOutput"></a>

### SignScheduleOutput
Block Stream data for a `signSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduled_transaction_id | [proto.TransactionID](#proto-TransactionID) |  | A scheduled transaction identifier.<br/> This value SHALL be the transaction identifier for the _scheduled_ child transaction executed as a result of gathering sufficient signatures to complete the schedule.<br/> This value SHALL NOT be set unless the scheduled transaction was executed as a child of this schedule sign transaction.<br/> This value SHALL NOT be set unless this schedule sign transaction was signed by sufficient additional keys to meet the signature requirements for the scheduled child transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



