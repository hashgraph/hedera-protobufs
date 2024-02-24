## Table of Contents

- [throttle_definitions.proto](#throttle_definitions-proto)
    - [ThrottleBucket](#proto-ThrottleBucket)
    - [ThrottleDefinitions](#proto-ThrottleDefinitions)
    - [ThrottleGroup](#proto-ThrottleGroup)
  



<a name="throttle_definitions-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## throttle_definitions.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ThrottleBucket"></a>

### ThrottleBucket
A list of throttle groups that should all compete for the same internal bucket.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | A name for this bucket (primarily for use in logs) |
| burstPeriodMs | [uint64](#uint64) |  | The number of milliseconds required for this bucket to drain completely when full. The product of this number and the least common multiple of the milliOpsPerSec values in this bucket must not exceed 9223372036. |
| throttleGroups | [ThrottleGroup](#proto-ThrottleGroup) | repeated | The throttle groups competing for this bucket |






<a name="proto-ThrottleDefinitions"></a>

### ThrottleDefinitions
A list of throttle buckets which, simultaneously enforced, define the system's throttling policy.
<ol>
<li> When an operation appears in more than one throttling bucket, all its buckets must have room
or it will be throttled.</li>
<li>An operation assigned to no buckets is always throttled.</li>
</ol>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| throttleBuckets | [ThrottleBucket](#proto-ThrottleBucket) | repeated |  |






<a name="proto-ThrottleGroup"></a>

### ThrottleGroup
A set of operations which should be collectively throttled at a given milli-ops-per-second limit.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| operations | [HederaFunctionality](#proto-HederaFunctionality) | repeated | The operations to be throttled |
| milliOpsPerSec | [uint64](#uint64) |  | The number of total operations per second across the entire network, multiplied by 1000. So, to choose 3 operations per second (which on a network of 30 nodes is a tenth of an operation per second for each node), set milliOpsPerSec = 3000. And to choose 3.6 ops per second, use milliOpsPerSec = 3600. Minimum allowed value is 1, and maximum allowed value is 9223372. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


