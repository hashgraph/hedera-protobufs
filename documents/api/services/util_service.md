## Table of Contents

- [util_service.proto](#util_service-proto)
    - [UtilService](#proto-UtilService)
  



<a name="util_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## util_service.proto
# Utility Service
This service provides a transaction to generate a deterministic
pseudo-random value, either a 32-bit integer within a requested range
or a 384-bit byte array.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-UtilService"></a>

### UtilService
The Utility Service provides a pseudo-random number generator.

The single gRPC call defined for this service simply reports a single
pseudo-random number in the transaction record. That value may either
be a 32-bit integer within a requested range, or a 384-bit byte array.

### Block Stream Effects
The requested value is reported exclusively in a `UtilPrngOutput` message.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| prng | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Generate a pseudo-random value. <p> The request body MUST be a [UtilPrngTransactionBody](#proto.UtilPrngTransactionBody) |

 <!-- end services -->



