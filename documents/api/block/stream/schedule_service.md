## Table of Contents

- [stream/schedule_service.proto](#stream_schedule_service-proto)
    - [CreateScheduleOutput](#proto-CreateScheduleOutput)
    - [SignScheduleOutput](#proto-SignScheduleOutput)
  



<a name="stream_schedule_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/schedule_service.proto
#  Service
Block stream messages that report the results of transactions handled by the `` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CreateScheduleOutput"></a>

### CreateScheduleOutput
Block Stream data for a `createSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| schedule_id | [ScheduleID](#proto-ScheduleID) |  | The id of the newly created Scheduled Entity. |
| scheduled_transaction_id | [TransactionID](#proto-TransactionID) |  | The TransactionID that should be used to query for the receipt or record of the relevant scheduled transaction when the status of the transaction resolves to SUCCESS. |
| schedule_ref | [ScheduleID](#proto-ScheduleID) |  | Reference to the scheduled transaction ID that this transaction record represent. |






<a name="proto-SignScheduleOutput"></a>

### SignScheduleOutput
Block Stream data for a `signSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduled_transaction_id | [TransactionID](#proto-TransactionID) |  | The TransactionID that should be used to query for the receipt or record of the relevant scheduled transaction when the status of the transaction resolves to SUCCESS. |
| schedule_ref | [ScheduleID](#proto-ScheduleID) |  | Reference to the scheduled transaction ID that this transaction record represent. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



