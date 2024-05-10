## Table of Contents

- [stream/util_service.proto](#stream_util_service-proto)
    - [UtilPrngOutput](#com-hedera-hapi-block-stream-UtilPrngOutput)
  



<a name="stream_util_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/util_service.proto
# Util Service
Block stream messages that report the results of transactions handled by
the `Util` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-UtilPrngOutput"></a>

### UtilPrngOutput
Block data produced by `prng` transactions submitted to the `Util` service.

The `entropy` reported in this block stream message is deterministically
produced, but has high dispersion and is very difficult to predict.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| prng_bytes | [bytes](#bytes) |  | A deterministic pseudo-random sequence of 48 bytes. <p> This value SHALL be the result of a corresponding `UtilService` `prng` transaction. |
| prng_number | [uint32](#uint32) |  | A deterministic pseudo-random number generated within a specified range. <p> This value SHALL be the result of a corresponding `UtilService` `prng` transaction.<br/> Note that the transaction only permits a non-negative range, the output SHALL always be a whole number. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



