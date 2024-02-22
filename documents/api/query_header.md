## Table of Contents

- [query_header.proto](#query_header-proto)
    - [QueryHeader](#proto-QueryHeader)
  
    - [ResponseType](#proto-ResponseType)
  



<a name="query_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query_header.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-QueryHeader"></a>

### QueryHeader
Each query from the client to the node will contain the QueryHeader, which gives the requested
response type, and includes a payment transaction that will compensate the node for responding to
the query. The payment can be blank if the query is free.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payment | [Transaction](#proto-Transaction) |  | A signed CryptoTransferTransaction to pay the node a fee for handling this query |
| responseType | [ResponseType](#proto-ResponseType) |  | The requested response, asking for cost, state proof, both, or neither |





 <!-- end messages -->


<a name="proto-ResponseType"></a>

### ResponseType
The client uses the ResponseType to indicate that it desires the node send just the answer, or
both the answer and a state proof. It can also ask for just the cost and not the answer itself
(allowing it to tailor the payment transaction accordingly). If the payment in the query fails
the precheck, then the response may have some fields blank. The state proof is only available for
some types of information. It is available for a Record, but not a receipt. It is available for
the information in each kind of *GetInfo request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ANSWER_ONLY | 0 | Response returns answer |
| ANSWER_STATE_PROOF | 1 | (NOT YET SUPPORTED) Response returns both answer and state proof |
| COST_ANSWER | 2 | Response returns the cost of answer |
| COST_ANSWER_STATE_PROOF | 3 | (NOT YET SUPPORTED) Response returns the total cost of answer and state proof |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


