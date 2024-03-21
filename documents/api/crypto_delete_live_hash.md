## Table of Contents

- [crypto_delete_live_hash.proto](#crypto_delete_live_hash-proto)
    - [CryptoDeleteLiveHashTransactionBody](#proto-CryptoDeleteLiveHashTransactionBody)
  



<a name="crypto_delete_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete_live_hash.proto
# Delete Live Hash
Dissociate a specific live hash from a specified account.

> Important
>> This transaction is obsolete and not supported.<br/>
>> Any transaction of this type that is submitted SHALL fail with a `PRE_CHECK` result
>> of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoDeleteLiveHashTransactionBody"></a>

### CryptoDeleteLiveHashTransactionBody
Delete a specific live hash associated to a given account.

This transaction MUST be signed by either the key of the associated account, or at least one
of the keys listed in the live hash.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountOfLiveHash | [AccountID](#proto-AccountID) |  | An account associated to a live hash. |
| liveHashToDelete | [bytes](#bytes) |  | The SHA-384 value of a specific live hash to delete. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


