## Table of Contents

- [response_header.proto](#response_header-proto)
    - [ResponseHeader](#proto-ResponseHeader)
  



<a name="response_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## response_header.proto
# Response Header
A standard header for all query responses.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ResponseHeader"></a>

### ResponseHeader
A standard header returned with every query response.

The fields for `cost` or `stateProof` MAY be unset if the requested
`ResponseType` does not request those values.<br/>
The `responseType` SHALL match the request response type.<br/>
The `nodeTransactionPrecheckCode` field SHALL contain the result code
for the query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nodeTransactionPrecheckCode | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | The result code for this query. <p> This value SHALL indicate either success or the reason for failure. |
| responseType | [ResponseType](#proto-ResponseType) |  | The response type requested for this query. <p> This SHALL be the response type requested in the query header. |
| cost | [uint64](#uint64) |  | Requested cost estimate.<br/> This is the fee that _would be_ charged if the query was executed. <p> This value SHALL be set if the response type requested requires cost information, and SHALL NOT be set otherwise.<br/> This value SHALL include the query fee, but SHALL NOT include the transfer fee required to execute the fee payment transaction. |
| stateProof | [bytes](#bytes) |  | A state proof for the information requested.

This field SHALL NOT be set if the response type does not require a state proof.<br/> This field SHALL NOT be set if a state proof is not available for the query type.<br/> This field SHALL be set if the response type requested a state proof and a state proof is available. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



