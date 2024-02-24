## Table of Contents

- [freeze.proto](#freeze-proto)
    - [FreezeTransactionBody](#proto-FreezeTransactionBody)
  



<a name="freeze-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FreezeTransactionBody"></a>

### FreezeTransactionBody
At consensus, sets the consensus time at which the platform should stop creating events and
accepting transactions, and enter a maintenance window.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| startHour | [int32](#int32) |  | **Deprecated.** !! DEPRECATED and REJECTED by nodes The start hour (in UTC time), a value between 0 and 23 |
| startMin | [int32](#int32) |  | **Deprecated.** !! DEPRECATED and REJECTED by nodes The start minute (in UTC time), a value between 0 and 59 |
| endHour | [int32](#int32) |  | **Deprecated.** !! DEPRECATED and REJECTED by nodes The end hour (in UTC time), a value between 0 and 23 |
| endMin | [int32](#int32) |  | **Deprecated.** !! DEPRECATED and REJECTED by nodes The end minute (in UTC time), a value between 0 and 59 |
| update_file | [FileID](#proto-FileID) |  | If set, the file whose contents should be used for a network software update during the maintenance window. |
| file_hash | [bytes](#bytes) |  | If set, the expected hash of the contents of the update file (used to verify the update). |
| start_time | [Timestamp](#proto-Timestamp) |  | The consensus time at which the maintenance window should begin. |
| freeze_type | [FreezeType](#proto-FreezeType) |  | The type of network freeze or upgrade operation to perform. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


