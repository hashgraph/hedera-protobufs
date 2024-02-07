## Table of Contents

- [timestamp.proto](#timestamp-proto)
    - [Timestamp](#proto-Timestamp)
    - [TimestampSeconds](#proto-TimestampSeconds)
  



<a name="timestamp-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## timestamp.proto
# Timestamp
Messages to describe exact date-time values, with resolution of seconds or
nanoseconds, referenced to the UNIX epoch.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Timestamp"></a>

### Timestamp
An exact date and time.<br/>
This is the same data structure as the Google protobuf Timestamp.proto.

#### Additional Notes
Useful information is present in comments on the
[Google version](https://github.com/google/protobuf/blob/master/src/google/protobuf/timestamp.proto).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| seconds | [int64](#int64) |  | The number of complete seconds since the start of the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`.<br/> This value MUST be greater than 0.<br/> This value SHOULD be strictly greater than `946684800`. |
| nanos | [int32](#int32) |  | The number of nanoseconds after the start of the second referenced in `seconds`. <p> This value MUST be greater than or equal to 0.<br/> This value MUST be strictly less than 1,000,000,000. |






<a name="proto-TimestampSeconds"></a>

### TimestampSeconds
An exact date and time, with a resolution of one second.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| seconds | [int64](#int64) |  | The number of complete seconds since the start of the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`.<br/> This value MUST be greater than 0.<br/> This value SHOULD be strictly greater than `946684800`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



