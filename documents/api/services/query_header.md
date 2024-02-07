## Table of Contents

- [query_header.proto](#query_header-proto)
    - [QueryHeader](#proto-QueryHeader)
  
    - [ResponseType](#proto-ResponseType)
  



<a name="query_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## query_header.proto
# Query Header
Messages that comprise a header sent with each query request.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-QueryHeader"></a>

### QueryHeader
A standard query header.<br/>
Each query from the client to the node must contain a QueryHeader, which
specifies the desired response type, and includes a payment transaction
that will compensate the network for responding to the query.
The payment may be blank if the query is free.

The payment transaction MUST be a `cryptoTransfer` from the payer account
to the account of the node where the query is submitted.<br/>
If the payment is sufficient, the network SHALL respond with the response
type requested.<br/>
If the response type is `COST_ANSWER` the payment MUST be unset.
A state proof SHALL be available for some types of information.<br/>
A state proof SHALL be available for a Record, but not a receipt, and the
response entry for each supported "get info" query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payment | [Transaction](#proto-Transaction) |  | A signed `CryptoTransferTransaction` to pay query fees. <p> This MUST transfer HBAR from the "payer" to the responding node account sufficient to pay the query fees. |
| responseType | [ResponseType](#proto-ResponseType) |  | A type of query response requested. |





 <!-- end messages -->


<a name="proto-ResponseType"></a>

### ResponseType
The type of query response.<br/>

This SHALL be answer-only as a default.<br/>
This value SHALL support an "estimated cost" type.<br/>
This value SHOULD support a "state proof" type, when available.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ANSWER_ONLY | 0 | A response with the query answer. |
| ANSWER_STATE_PROOF | 1 | A response with both the query answer and a state proof. |
| COST_ANSWER | 2 | A response with the estimated cost to answer the query. |
| COST_ANSWER_STATE_PROOF | 3 | A response with the estimated cost to answer and a state proof. |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



