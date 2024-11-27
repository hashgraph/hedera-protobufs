## Table of Contents

- [transaction.proto](#transaction-proto)
    - [Transaction](#proto-Transaction)
  



<a name="transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction.proto
# Transaction
A (mostly legacy) wrapper around the bytes of a
serialized `SignedTransaction` message.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Transaction"></a>

### Transaction
A wrapper around signed transaction bytes.<br/>
This was originally a transaction with body, signatures, and/or bytes,
but is not only a wrapper around a byte array containing signed transction
bytes.

The `signedTransactionBytes` field is REQUIRED and MUST contain a valid,
serialized, `SignedTransaction` message.<br/>
All other fields are deprecated and MUST NOT be set.

#### Additional Notes
The four deprecated fields will be removed and reserved in a future release.


| Field | Type | Description |
| ----- | ---- | ----------- |
| body | [TransactionBody](#proto-TransactionBody) | **Deprecated.** Replaced with `signedTransactionBytes`.<br/> The body of the transaction. |
| sigs | [SignatureList](#proto-SignatureList) | **Deprecated.** Replaced with `signedTransactionBytes`.<br/> The signatures on the body. |
| sigMap | [SignatureMap](#proto-SignatureMap) | **Deprecated.** Replaced with `signedTransactionBytes`.<br/> The signatures on the body with a newer format. |
| bodyBytes | [bytes](#bytes) | **Deprecated.** Replaced with `signedTransactionBytes`.<br/> TransactionBody serialized into bytes. |
| signedTransactionBytes | [bytes](#bytes) | A valid, serialized, `SignedTransaction` message. <p> This field MUST be present. This field MUST NOT exceed the current network transaction size limit (currently 6144 bytes). |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



