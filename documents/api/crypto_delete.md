## Table of Contents

- [crypto_delete.proto](#crypto_delete-proto)
    - [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody)
  



<a name="crypto_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoDeleteTransactionBody"></a>

### CryptoDeleteTransactionBody
Mark an account as deleted, moving all its current hbars to another account. It will remain in
the ledger, marked as deleted, until it expires. Transfers into it a deleted account fail. But a
deleted account can still have its expiration extended in the normal way.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transferAccountID | [AccountID](#proto-AccountID) |  | The account ID which will receive all remaining hbars |
| deleteAccountID | [AccountID](#proto-AccountID) |  | The account ID which should be deleted |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


