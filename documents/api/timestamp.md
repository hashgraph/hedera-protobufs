## Table of Contents

- [timestamp.proto](#timestamp-proto)
    - [Timestamp](#proto-Timestamp)
    - [TimestampSeconds](#proto-TimestampSeconds)
  



<a name="timestamp-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## timestamp.proto
# Timestamp
Messages to describe exact date-time values with resolution of seconds or nanoseconds.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Timestamp"></a>

### Timestamp
An exact date and time. This is the same data structure as the protobuf Timestamp.proto (see the
comments in https://github.com/google/protobuf/blob/master/src/google/protobuf/timestamp.proto)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| seconds | [int64](#int64) |  | The number of complete seconds since the start of the epoch. For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| nanos | [int32](#int32) |  | The number of nanoseconds after the start of the second referenced in `seconds`. |






<a name="proto-TimestampSeconds"></a>

### TimestampSeconds
An exact date and time, with a resolution of one second (no nanoseconds).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| seconds | [int64](#int64) |  | The number of complete seconds since the start of the epoch. For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


