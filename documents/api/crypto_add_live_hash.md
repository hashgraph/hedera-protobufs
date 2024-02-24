## Table of Contents

- [crypto_add_live_hash.proto](#crypto_add_live_hash-proto)
    - [CryptoAddLiveHashTransactionBody](#proto-CryptoAddLiveHashTransactionBody)
    - [LiveHash](#proto-LiveHash)
  



<a name="crypto_add_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_add_live_hash.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoAddLiveHashTransactionBody"></a>

### CryptoAddLiveHashTransactionBody
At consensus, attaches the given livehash to the given account.  The hash can be deleted by the
key controlling the account, or by any of the keys associated to the livehash.  Hence livehashes
provide a revocation service for their implied credentials; for example, when an authority grants
a credential to the account, the account owner will cosign with the authority (or authorities) to
attach a hash of the credential to the account---hence proving the grant. If the credential is
revoked, then any of the authorities may delete it (or the account owner). In this way, the
livehash mechanism acts as a revocation service.  An account cannot have two identical livehashes
associated. To modify the list of keys in a livehash, the livehash should first be deleted, then
recreated with a new list of keys.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| liveHash | [LiveHash](#proto-LiveHash) |  | A hash of some credential or certificate, along with the keys of the entities that asserted it validity |






<a name="proto-LiveHash"></a>

### LiveHash
A hash---presumably of some kind of credential or certificate---along with a list of keys, each
of which may be either a primitive or a threshold key.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountId | [AccountID](#proto-AccountID) |  | The account to which the livehash is attached |
| hash | [bytes](#bytes) |  | The SHA-384 hash of a credential or certificate |
| keys | [KeyList](#proto-KeyList) |  | A list of keys (primitive or threshold), all of which must sign to attach the livehash to an account, and any one of which can later delete it. |
| duration | [Duration](#proto-Duration) |  | The duration for which the livehash will remain valid |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


