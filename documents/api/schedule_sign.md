## Table of Contents

- [schedule_sign.proto](#schedule_sign-proto)
    - [ScheduleSignTransactionBody](#proto-ScheduleSignTransactionBody)
  



<a name="schedule_sign-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_sign.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ScheduleSignTransactionBody"></a>

### ScheduleSignTransactionBody
Adds zero or more signing keys to a schedule.

If Long Term Scheduled Transactions are enabled and <tt>wait_for_expiry</tt> was set to <tt>true</tt> on the
<tt>ScheduleCreate</tt> then the transaction will always wait till it's `expiration_time` to execute.

Otherwise, if the resulting set of signing keys satisfy the
scheduled transaction's signing requirements, it will be executed immediately after the
triggering <tt>ScheduleSign</tt>.

Upon <tt>SUCCESS</tt>, the receipt includes the <tt>scheduledTransactionID</tt> to use to query
for the record of the scheduled transaction's execution (if it occurs).

Other notable response codes include <tt>INVALID_SCHEDULE_ID</tt>, <tt>SCHEDULE_ALREADY_DELETED</tt>,
<tt>SCHEDULE_PENDING_EXPIRATION</tt>, <tt>SCHEDULE_ALREADY_EXPIRED</tt>,
<tt>INVALID_ACCOUNT_ID</tt>, <tt>UNRESOLVABLE_REQUIRED_SIGNERS</tt>,
<tt>SOME_SIGNATURES_WERE_INVALID</tt>, and <tt>NO_NEW_VALID_SIGNATURES</tt>. For more information
please see the section of this documentation on the <tt>ResponseCode</tt> enum.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduleID | [ScheduleID](#proto-ScheduleID) |  | The id of the schedule to add signing keys to |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


