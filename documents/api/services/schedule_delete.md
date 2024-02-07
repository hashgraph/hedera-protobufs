## Table of Contents

- [schedule_delete.proto](#schedule_delete-proto)
    - [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody)
  



<a name="schedule_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_delete.proto
# Schedule Delete
A transaction body for a `scheduleDelete` transaction.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ScheduleDeleteTransactionBody"></a>

### ScheduleDeleteTransactionBody
Mark a schedule in the network state as deleted.

This transaction MUST be signed by the `adminKey` for the
identified schedule.<br/>
If a schedule does not have `adminKey` set or if `adminKey` is an empty
`KeyList`, that schedule SHALL be immutable and MUST NOT be deleted.<br/>
A deleted schedule SHALL not be executed.<br/>
A deleted schedule MUST NOT be the subject of a subsequent
`scheduleSign` transaction.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | A schedule identifier. <p> This MUST identify the schedule which SHALL be deleted. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



