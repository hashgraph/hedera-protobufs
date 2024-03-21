## Table of Contents

- [crypto_get_live_hash.proto](#crypto_get_live_hash-proto)
    - [CryptoGetLiveHashQuery](#proto-CryptoGetLiveHashQuery)
    - [CryptoGetLiveHashResponse](#proto-CryptoGetLiveHashResponse)
  



<a name="crypto_get_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_live_hash.proto
# Get Live Hash
Standard query to inspect associations between content and accounts via SHA-384 hashes.

> Important
>> This query is obsolete and not supported.<br/>
>> Any query of this type that is submitted SHALL fail with a `PRE_CHECK` result
>> of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoGetLiveHashQuery"></a>

### CryptoGetLiveHashQuery
Request detail for a specific live hash associated to a specific account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | An account ID.<br/> The network SHALL return live hash information for this account, if successful. |
| hash | [bytes](#bytes) |  | The specific SHA-384 live hash to inspect |






<a name="proto-CryptoGetLiveHashResponse"></a>

### CryptoGetLiveHashResponse
Return the full live hash associated to an account, if it is present.

> Note that to generate a state proof of the _absence_ of a live hash from an account
> a transaction MUST retrieve a state proof of the `Account` with its list of live hashes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| liveHash | [LiveHash](#proto-LiveHash) |  | The requested live hash, if found. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


