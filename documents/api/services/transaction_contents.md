## Table of Contents

- [transaction_contents.proto](#transaction_contents-proto)
    - [SignedTransaction](#proto-SignedTransaction)
  



<a name="transaction_contents-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_contents.proto
# Transaction Contents
The Signed Transaction message which forms the content of a transaction
`signedTransactionBytes`. This message is the result of several changes
to transaction message structure over time.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-SignedTransaction"></a>

### SignedTransaction
A combination transaction bytes and a map of signatures.<br/>
This message contains a serialized `TransactionBody` in a byte array
and a `SignatureMap` that contains all of the signatures offered to
authenticate the transaction.

### Block Stream Effects
This content is recorded in the record stream exactly as received.


| Field | Type | Description |
| ----- | ---- | ----------- |
| bodyBytes | [bytes](#bytes) | A byte array containing a serialized `TransactionBody`. <p> This content is what the signatures in `sigMap` MUST sign. |
| sigMap | [SignatureMap](#proto-SignatureMap) | A set of cryptographic signatures. <p> This set MUST contain all signatures required to authenticate and authorize the transaction.<br/> This set MAY contain additional signatures. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



