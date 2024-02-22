## Table of Contents

- [crypto_add_live_hash.proto](#crypto_add_live_hash-proto)
    - [CryptoAddLiveHashTransactionBody](#proto-CryptoAddLiveHashTransactionBody)
    - [LiveHash](#proto-LiveHash)
  



<a name="crypto_add_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_add_live_hash.proto
# Add Live Hash
Associate content to an account via a SHA-384 hash.

> Important
>> This transaction is obsolete and not supported.<br/>
>> Any transaction of this type that is submitted SHALL fail with a `PRE_CHECK` result
>> of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoAddLiveHashTransactionBody"></a>

### CryptoAddLiveHashTransactionBody
Add a hash value to the ledger and associate it with an account.

Create an entry in the ledger for a SHA-384 hash of some content, and associate that with a
specific account.  This is sometimes used to associate a credential or certificate with an
account as a public record.<br/>
The entry created is also associated with a list of keys, all of which MUST sign this
transaction.<br/>
The account key for the associated account MUST sign this transaction.<br/>

The live hash, once created, MAY be removed from the ledger with one or more signatures.
- The account key of the account associated to the live hash.
- Any one key from the key list in the live hash entry.
- Any combination of keys from the key list in the live hash entry.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| liveHash | [LiveHash](#proto-LiveHash) |  | A Live Hash to be added to the ledger and associated with the identified account. |






<a name="proto-LiveHash"></a>

### LiveHash
A Live Hash value associating some item of content to an account.

This message represents a desired entry in the ledger for a SHA-384 hash of some content,
an associated specific account, a list of authorized keys, and a duration the
live hash is "valid".


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountId | [AccountID](#proto-AccountID) |  | An account associated via this live hash to the hashed content. |
| hash | [bytes](#bytes) |  | a SHA-384 hash of some content that is associated to the account or account holder. |
| keys | [KeyList](#proto-KeyList) |  | A list of keys, all of which MUST sign the transaction to add the live hash.<br/> Any one of these keys may, however, remove the live hash to revoke the association. |
| duration | [Duration](#proto-Duration) |  | A duration describing how long this Live Hash SHALL remain valid.<br/> A Live Hash SHOULD NOT be relied upon after this duration has elapsed. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


