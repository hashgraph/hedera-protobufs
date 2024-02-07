## Table of Contents

- [state/blockrecords/running_hashes.proto](#state_blockrecords_running_hashes-proto)
    - [RunningHashes](#proto-RunningHashes)
  



<a name="state_blockrecords_running_hashes-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/blockrecords/running_hashes.proto
# Running Hashes
The running hash values for the record stream, including current and
three(3) previous values.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-RunningHashes"></a>

### RunningHashes
The running hash of transaction records and the previous `3` running hashes.

All hashes are 48 byte SHA384 hash values. If the running hashes do not
exist yet (for example, at genesis) then each not-yet-available value SHALL
be empty (zero-length) bytes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| running_hash | [bytes](#bytes) |  | A running hash of all record stream items. |
| n_minus_1_running_hash | [bytes](#bytes) |  | The previous running hash of all record stream items. |
| n_minus_2_running_hash | [bytes](#bytes) |  | The previous, previous running hash of all record stream items. |
| n_minus_3_running_hash | [bytes](#bytes) |  | The previous, previous, previous running hash of all record stream items. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


