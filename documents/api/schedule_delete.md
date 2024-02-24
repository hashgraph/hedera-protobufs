## Table of Contents

- [schedule_delete.proto](#schedule_delete-proto)
    - [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody)
  



<a name="schedule_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ScheduleDeleteTransactionBody"></a>

### ScheduleDeleteTransactionBody
Marks a schedule in the network's action queue as deleted. Must be signed by the admin key of the
target schedule.  A deleted schedule cannot receive any additional signing keys, nor will it be
executed.

Other notable response codes include, <tt>INVALID_SCHEDULE_ID</tt>, <tt>SCHEDULE_PENDING_EXPIRATION</tt>,
<tt>SCHEDULE_ALREADY_DELETED</tt>, <tt>SCHEDULE_ALREADY_EXECUTED</tt>, <tt>SCHEDULE_IS_IMMUTABLE</tt>.
For more information please see the section of this documentation on the <tt>ResponseCode</tt>
enum.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | The ID of the Scheduled Entity |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


