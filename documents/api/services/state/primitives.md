## Table of Contents

- [state/primitives.proto](#state_primitives-proto)
    - [ProtoBoolean](#proto-ProtoBoolean)
    - [ProtoBytes](#proto-ProtoBytes)
    - [ProtoInteger](#proto-ProtoInteger)
    - [ProtoLong](#proto-ProtoLong)
    - [ProtoString](#proto-ProtoString)
  



<a name="state_primitives-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/primitives.proto
# Primitives
Primitive value wrapper messages.

These SHALL be used only for situations where the entire value to be stored
in state is a single primitive. These MUST NOT ever be used as components of
another message; use the protobuf type instead.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ProtoBoolean"></a>

### ProtoBoolean
A single boolean with no particular meaning.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [bool](#bool) |  |  |






<a name="proto-ProtoBytes"></a>

### ProtoBytes
A single byte array with no particular meaning.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [bytes](#bytes) |  |  |






<a name="proto-ProtoInteger"></a>

### ProtoInteger
A single 32-bit number with no particular meaning.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [int32](#int32) |  |  |






<a name="proto-ProtoLong"></a>

### ProtoLong
A single 64-bit number with no particular meaning.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [int64](#int64) |  |  |






<a name="proto-ProtoString"></a>

### ProtoString
A single string with no particular meaning.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [string](#string) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


