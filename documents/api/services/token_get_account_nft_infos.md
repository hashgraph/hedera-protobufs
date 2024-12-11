## Table of Contents

- [token_get_account_nft_infos.proto](#token_get_account_nft_infos-proto)
    - [TokenGetAccountNftInfosQuery](#proto-TokenGetAccountNftInfosQuery)
    - [TokenGetAccountNftInfosResponse](#proto-TokenGetAccountNftInfosResponse)
  



<a name="token_get_account_nft_infos-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_account_nft_infos.proto
# Get Account NFT Infos
Deprecated and permanently disabled

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenGetAccountNftInfosQuery"></a>

### TokenGetAccountNftInfosQuery
Deleted and unsupported.

This query is not implemented and any query of this type submitted
SHALL return a `NOT_SUPPORTED` response code.


| Field | Type | Description |
| ----- | ---- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) | The Account for which information is requested |
| start | [int64](#int64) | Specifies the start index (inclusive) of the range of NFTs to query for. Value must be in the range [0; ownedNFTs-1] |
| end | [int64](#int64) | Specifies the end index (exclusive) of the range of NFTs to query for. Value must be in the range (start; ownedNFTs] |






<a name="proto-TokenGetAccountNftInfosResponse"></a>

### TokenGetAccountNftInfosResponse
Deleted and unsupported.


| Field | Type | Description |
| ----- | ---- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| nfts | [TokenNftInfo](#proto-TokenNftInfo) | List of NFTs associated to the account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



