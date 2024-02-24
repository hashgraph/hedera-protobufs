## Table of Contents

- [util_prng.proto](#util_prng-proto)
    - [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody)
  



<a name="util_prng-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## util_prng.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-UtilPrngTransactionBody"></a>

### UtilPrngTransactionBody
Generates a pseudorandom number


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| range | [int32](#int32) |  | If provided and is positive, returns a 32-bit pseudorandom number from the given range in the transaction record. If not set or set to zero, will return a 384-bit pseudorandom number in the record. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


