## Table of Contents

- [transaction_contents.proto](#transaction_contents-proto)
    - [SignedTransaction](#proto-SignedTransaction)
  



<a name="transaction_contents-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_contents.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-SignedTransaction"></a>

### SignedTransaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| bodyBytes | [bytes](#bytes) |  | TransactionBody serialized into bytes, which needs to be signed |
| sigMap | [SignatureMap](#proto-SignatureMap) |  | The signatures on the body with the new format, to authorize the transaction |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


