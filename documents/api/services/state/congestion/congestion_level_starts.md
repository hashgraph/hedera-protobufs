## Table of Contents

- [state/congestion/congestion_level_starts.proto](#state_congestion_congestion_level_starts-proto)
    - [CongestionLevelStarts](#proto-CongestionLevelStarts)
  



<a name="state_congestion_congestion_level_starts-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/congestion/congestion_level_starts.proto
# Congestion timestamps
The timestamp values indicating when congestion pricing changed.


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CongestionLevelStarts"></a>

### CongestionLevelStarts
Two lists of congestion pricing level "start" times. Each list details the
start of each time period when the congestion pricing level changed
(increasing, or decreasing, the congestion fee multiplier).

> Review Question
>> What prunes these lists?
>
>> Do these grow indefinitely?
>
>> Are these two lists the same size?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| generic_level_starts | [Timestamp](#proto-Timestamp) | repeated | Timestamps for each point where "entity utilization" congestion pricing levels changed. <p> If congestion pricing has not occurred then this SHALL contain a single timestamp of value 0. |
| gas_level_starts | [Timestamp](#proto-Timestamp) | repeated | Timestamps for each point where "gas utilization" congestion pricing levels changed. <p> If congestion pricing has not occurred then this SHALL contain a single timestamp of value 0. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


