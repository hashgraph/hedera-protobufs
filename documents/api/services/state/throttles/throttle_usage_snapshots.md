## Table of Contents

- [state/throttles/throttle_usage_snapshots.proto](#state_throttles_throttle_usage_snapshots-proto)
    - [ThrottleUsageSnapshot](#proto-ThrottleUsageSnapshot)
    - [ThrottleUsageSnapshots](#proto-ThrottleUsageSnapshots)
  



<a name="state_throttles_throttle_usage_snapshots-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/throttles/throttle_usage_snapshots.proto
# Throttle Snapshots
Point-in-time information regarding throttle usage.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ThrottleUsageSnapshot"></a>

### ThrottleUsageSnapshot
A single snapshot of the used throttle capacity for a throttle and point in
time.

> Question:
>> What throttle does this apply to? How is that determined?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| used | [int64](#int64) |  | Used throttle capacity. |
| last_decision_time | [Timestamp](#proto-Timestamp) |  | The time at which the this snapshot of capacity was calculated.<br/> Stored as an offset from the `epoch`. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |






<a name="proto-ThrottleUsageSnapshots"></a>

### ThrottleUsageSnapshots
All point-in-time snapshots of throttle usage for TPS and "gas" throttle
values for a given point in time.

> Question:
>> What point in time?  Should this store consensus timestamp here?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tps_throttles | [ThrottleUsageSnapshot](#proto-ThrottleUsageSnapshot) | repeated | A list of snapshots for TPS throttles. <p> <blockquote>Question:<blockquote>What is the order?</blockquote></blockquote> |
| gas_throttle | [ThrottleUsageSnapshot](#proto-ThrottleUsageSnapshot) |  | A single snapshot for the gas throttle. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


