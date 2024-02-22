## Table of Contents

- [transaction.proto](#transaction-proto)
    - [Transaction](#proto-Transaction)
  



<a name="transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Transaction"></a>

### Transaction
A single signed transaction, including all its signatures. The SignatureList will have a
Signature for each Key in the transaction, either explicit or implicit, in the order that they
appear in the transaction. For example, a CryptoTransfer will first have a Signature
corresponding to the Key for the paying account, followed by a Signature corresponding to the Key
for each account that is sending or receiving cryptocurrency in the transfer. Each Transaction
should not have more than 50 levels.
The SignatureList field is deprecated and succeeded by SignatureMap.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| body | [TransactionBody](#proto-TransactionBody) |  | **Deprecated.** The body of the transaction, which needs to be signed |
| sigs | [SignatureList](#proto-SignatureList) |  | **Deprecated.** The signatures on the body, to authorize the transaction; deprecated and to be succeeded by SignatureMap field |
| sigMap | [SignatureMap](#proto-SignatureMap) |  | **Deprecated.** The signatures on the body with the new format, to authorize the transaction |
| bodyBytes | [bytes](#bytes) |  | **Deprecated.** TransactionBody serialized into bytes, which needs to be signed |
| signedTransactionBytes | [bytes](#bytes) |  | SignedTransaction serialized into bytes |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


