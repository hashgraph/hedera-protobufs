## Table of Contents

- [util_prng.proto](#util_prng-proto)
    - [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody)
  



<a name="util_prng-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## util_prng.proto
# Utility PRNG query
A query to retrieve a deterministic pseudo-random value.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-UtilPrngTransactionBody"></a>

### UtilPrngTransactionBody
Request a deterministic pseudo-random number.

The value returned SHALL be deterministic, but not easily predicted.
The value returned SHALL NOT be suitable for cryptographic use.

### Block Stream Effects
The result of this transaction is reported in a `UtilPrngOutput` message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| range | [int32](#int32) | A range for the requested value. <p> If this is greater than `0`, the service SHALL return a 32-bit pseudo-random number between 0 and the value provided in the transaction record.<br/> If this is unset, zero, or negative; the service SHALL return a 384-bit unsigned pseudo-random number in the record. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



