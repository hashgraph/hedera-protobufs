## Table of Contents

- [token_get_nft_info.proto](#token_get_nft_info-proto)
    - [TokenGetNftInfoQuery](#proto-TokenGetNftInfoQuery)
    - [TokenGetNftInfoResponse](#proto-TokenGetNftInfoResponse)
    - [TokenNftInfo](#proto-TokenNftInfo)
  



<a name="token_get_nft_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_nft_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenGetNftInfoQuery"></a>

### TokenGetNftInfoQuery
Applicable only to tokens of type NON_FUNGIBLE_UNIQUE. Gets info on a NFT for a given TokenID (of
type NON_FUNGIBLE_UNIQUE) and serial number


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| nftID | [NftID](#proto-NftID) |  | The ID of the NFT |






<a name="proto-TokenGetNftInfoResponse"></a>

### TokenGetNftInfoResponse
UNDOCUMENTED


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| nft | [TokenNftInfo](#proto-TokenNftInfo) |  | The information about this NFT |






<a name="proto-TokenNftInfo"></a>

### TokenNftInfo
UNDOCUMENTED


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nftID | [NftID](#proto-NftID) |  | The ID of the NFT |
| accountID | [AccountID](#proto-AccountID) |  | The current owner of the NFT |
| creationTime | [Timestamp](#proto-Timestamp) |  | The effective consensus timestamp at which the NFT was minted |
| metadata | [bytes](#bytes) |  | Represents the unique metadata of the NFT |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| spender_id | [AccountID](#proto-AccountID) |  | If an allowance is granted for the NFT, its corresponding spender account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


