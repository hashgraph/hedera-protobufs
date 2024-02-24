## Table of Contents

- [response_header.proto](#response_header-proto)
    - [ResponseHeader](#proto-ResponseHeader)
  



<a name="response_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## response_header.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ResponseHeader"></a>

### ResponseHeader
Every query receives a response containing the QueryResponseHeader. Either or both of the cost
and stateProof fields may be blank, if the responseType didn't ask for the cost or stateProof.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nodeTransactionPrecheckCode | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | Result of fee transaction precheck, saying it passed, or why it failed |
| responseType | [ResponseType](#proto-ResponseType) |  | The requested response is repeated back here, for convenience |
| cost | [uint64](#uint64) |  | The fee that would be charged to get the requested information (if a cost was requested). Note: This cost only includes the query fee and does not include the transfer fee(which is required to execute the transfer transaction to debit the payer account and credit the node account with query fee) |
| stateProof | [bytes](#bytes) |  | The state proof for this information (if a state proof was requested, and is available) |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


