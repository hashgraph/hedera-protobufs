## Table of Contents

- [crypto_get_stakers.proto](#crypto_get_stakers-proto)
    - [AllProxyStakers](#proto-AllProxyStakers)
    - [CryptoGetStakersQuery](#proto-CryptoGetStakersQuery)
    - [CryptoGetStakersResponse](#proto-CryptoGetStakersResponse)
    - [ProxyStaker](#proto-ProxyStaker)
  



<a name="crypto_get_stakers-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_stakers.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-AllProxyStakers"></a>

### AllProxyStakers
all of the accounts proxy staking to a given account, and the amounts proxy staked


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID that is being proxy staked to |
| proxyStaker | [ProxyStaker](#proto-ProxyStaker) | repeated | Each of the proxy staking accounts, and the amount they are proxy staking |






<a name="proto-CryptoGetStakersQuery"></a>

### CryptoGetStakersQuery
Get all the accounts that are proxy staking to this account. For each of them, give the amount
currently staked. This is not yet implemented, but will be in a future version of the API.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID for which the records should be retrieved |






<a name="proto-CryptoGetStakersResponse"></a>

### CryptoGetStakersResponse
Response when the client sends the node CryptoGetStakersQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| stakers | [AllProxyStakers](#proto-AllProxyStakers) |  | List of accounts proxy staking to this account, and the amount each is currently proxy staking |






<a name="proto-ProxyStaker"></a>

### ProxyStaker
information about a single account that is proxy staking


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID that is proxy staking |
| amount | [int64](#int64) |  | The number of hbars that are currently proxy staked |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


