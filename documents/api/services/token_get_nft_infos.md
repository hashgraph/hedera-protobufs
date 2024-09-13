## Table of Contents

- [token_get_nft_infos.proto](#token_get_nft_infos-proto)
    - [TokenGetNftInfosQuery](#proto-TokenGetNftInfosQuery)
    - [TokenGetNftInfosResponse](#proto-TokenGetNftInfosResponse)
  



<a name="token_get_nft_infos-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_nft_infos.proto
# Token Get NFT Infos
Deprecated and permanently disabled

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenGetNftInfosQuery"></a>

### TokenGetNftInfosQuery
Deleted and unsupported.

This query is not implemented and any query of this type submitted
SHALL return a `NOT_SUPPORTED` response code.


| Field | Type | Description |
| ----- | ---- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| tokenID | [TokenID](#proto-TokenID) | A token identifier. <p> This SHALL identify the token to query.<br/> The identified token MUST exist, MUST NOT be deleted, and MUST be a non-fungible/unique type. |
| start | [int64](#int64) | Specifies the start index (inclusive) of the range of NFTs to query for. Value must be in the range [0; mintedNFTs-1] |
| end | [int64](#int64) | Specifies the end index (exclusive) of the range of NFTs to query for. Value must be in the range (start; mintedNFTs] |






<a name="proto-TokenGetNftInfosResponse"></a>

### TokenGetNftInfosResponse
Deleted and unsupported.


| Field | Type | Description |
| ----- | ---- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| tokenID | [TokenID](#proto-TokenID) | A token identifier. <p> This SHALL identify the token type to query.<br/> The identified token MUST exist, and MUST NOT be deleted. The identified token MUST be a non-fungible/unique type. |
| nfts | [TokenNftInfo](#proto-TokenNftInfo) | A list of messages, each of which describes one NFT. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



