## Table of Contents

- [transaction_response.proto](#transaction_response-proto)
    - [TransactionResponse](#proto-TransactionResponse)
  



<a name="transaction_response-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_response.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionResponse"></a>

### TransactionResponse
When the client sends the node a transaction of any kind, the node replies with this, which
simply says that the transaction passed the precheck (so the node will submit it to the network)
or it failed (so it won't). If the fee offered was insufficient, this will also contain the
amount of the required fee. To learn the consensus result, the client should later obtain a
receipt (free), or can buy a more detailed record (not free).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nodeTransactionPrecheckCode | [ResponseCodeEnum](#proto-ResponseCodeEnum) |  | The response code that indicates the current status of the transaction. |
| cost | [uint64](#uint64) |  | If the response code was INSUFFICIENT_TX_FEE, the actual transaction fee that would be required to execute the transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


