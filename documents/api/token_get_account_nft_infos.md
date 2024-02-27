## Table of Contents

- [token_get_account_nft_infos.proto](#token_get_account_nft_infos-proto)
    - [TokenGetAccountNftInfosQuery](#proto-TokenGetAccountNftInfosQuery)
    - [TokenGetAccountNftInfosResponse](#proto-TokenGetAccountNftInfosResponse)
  



<a name="token_get_account_nft_infos-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_account_nft_infos.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenGetAccountNftInfosQuery"></a>

### TokenGetAccountNftInfosQuery
Applicable only to tokens of type NON_FUNGIBLE_UNIQUE. Gets info on NFTs N through M owned by the
specified accountId.
Example: If Account A owns 5 NFTs (might be of different Token Entity), having start=0 and end=5
will return all of the NFTs

INVALID_QUERY_RANGE response code will be returned if:
1) Start > End
2) Start and End indices are non-positive
3) Start and End indices are out of boundaries for the retrieved nft list
4) The range between Start and End is bigger than the global dynamic property for maximum query
   range

NOT_SUPPORTED response code will be returned if the queried token is of type FUNGIBLE_COMMON

INVALID_ACCOUNT_ID response code will be returned if the queried account does not exist

ACCOUNT_DELETED response code will be returned if the queried account has been deleted


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The Account for which information is requested |
| start | [int64](#int64) |  | Specifies the start index (inclusive) of the range of NFTs to query for. Value must be in the range [0; ownedNFTs-1] |
| end | [int64](#int64) |  | Specifies the end index (exclusive) of the range of NFTs to query for. Value must be in the range (start; ownedNFTs] |






<a name="proto-TokenGetAccountNftInfosResponse"></a>

### TokenGetAccountNftInfosResponse
UNDOCUMENTED


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| nfts | [TokenNftInfo](#proto-TokenNftInfo) | repeated | List of NFTs associated to the account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


