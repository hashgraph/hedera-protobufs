## Table of Contents

- [crypto_delete_live_hash.proto](#crypto_delete_live_hash-proto)
    - [CryptoDeleteLiveHashTransactionBody](#proto-CryptoDeleteLiveHashTransactionBody)
  



<a name="crypto_delete_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete_live_hash.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoDeleteLiveHashTransactionBody"></a>

### CryptoDeleteLiveHashTransactionBody
At consensus, deletes a livehash associated to the given account. The transaction must be signed
by either the key of the owning account, or at least one of the keys associated to the livehash.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountOfLiveHash | [AccountID](#proto-AccountID) |  | The account owning the livehash |
| liveHashToDelete | [bytes](#bytes) |  | The SHA-384 livehash to delete from the account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


