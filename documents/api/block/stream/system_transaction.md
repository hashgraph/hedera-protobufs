## Table of Contents

- [stream/system_transaction.proto](#stream_system_transaction-proto)
    - [BitsPerSecondSystemTransaction](#proto-BitsPerSecondSystemTransaction)
    - [PingSystemTransaction](#proto-PingSystemTransaction)
    - [StateSignatureSystemTransaction](#proto-StateSignatureSystemTransaction)
    - [SystemTransaction](#proto-SystemTransaction)
  



<a name="stream_system_transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/system_transaction.proto
#


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BitsPerSecondSystemTransaction"></a>

### BitsPerSecondSystemTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| avg_bits_per_sec_sent | [int64](#int64) | repeated |  |






<a name="proto-PingSystemTransaction"></a>

### PingSystemTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| avg_ping_milliseconds | [int32](#int32) | repeated |  |






<a name="proto-StateSignatureSystemTransaction"></a>

### StateSignatureSystemTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_signature | [bytes](#bytes) |  | The signature of the signed state. In the format specified in the BlockHeader. |
| state_hash | [bytes](#bytes) |  | The hash of the signed state. In the format specified in the BlockHeader. |
| epoch_hash | [bytes](#bytes) |  | The hash of the epoch to which this signature corresponds to. In the format specified in the BlockHeader. |
| round | [int64](#int64) |  | Round number of the signed state. |






<a name="proto-SystemTransaction"></a>

### SystemTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_signature | [StateSignatureSystemTransaction](#proto-StateSignatureSystemTransaction) |  |  |
| bits_per_second | [BitsPerSecondSystemTransaction](#proto-BitsPerSecondSystemTransaction) |  |  |
| ping | [PingSystemTransaction](#proto-PingSystemTransaction) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



