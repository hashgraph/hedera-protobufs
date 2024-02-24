## Table of Contents

- [freeze_service.proto](#freeze_service-proto)
    - [FreezeService](#proto-FreezeService)
  



<a name="freeze_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-FreezeService"></a>

### FreezeService
The request and responses for freeze service.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| freeze | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Freezes the nodes by submitting the transaction. The grpc server returns the TransactionResponse |

 <!-- end services -->


