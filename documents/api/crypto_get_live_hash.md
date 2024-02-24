## Table of Contents

- [crypto_get_live_hash.proto](#crypto_get_live_hash-proto)
    - [CryptoGetLiveHashQuery](#proto-CryptoGetLiveHashQuery)
    - [CryptoGetLiveHashResponse](#proto-CryptoGetLiveHashResponse)
  



<a name="crypto_get_live_hash-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_live_hash.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoGetLiveHashQuery"></a>

### CryptoGetLiveHashQuery
Requests a livehash associated to an account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The account to which the livehash is associated |
| hash | [bytes](#bytes) |  | The SHA-384 data in the livehash |






<a name="proto-CryptoGetLiveHashResponse"></a>

### CryptoGetLiveHashResponse
Returns the full livehash associated to an account, if it is present. Note that the only way to
obtain a state proof exhibiting the absence of a livehash from an account is to retrieve a state
proof of the entire account with its list of livehashes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| liveHash | [LiveHash](#proto-LiveHash) |  | The livehash, if present |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


