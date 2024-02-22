## Table of Contents

- [state/token/nft.proto](#state_token_nft-proto)
    - [Nft](#proto-Nft)
  



<a name="state_token_nft-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/nft.proto
# NFT.
This is a single, whole, unique, non-fungible token within the Hedera network.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Nft"></a>

### Nft
An Hedera Token Service non-fungible token (NFT).<br/>
Every NFT is a unique instance of a token with non-fungible type.<br/>
The NFT SHALL be identified by token ID and serial number.<br/>
The token treasury account SHALL own all minted NFTs of that token type initially.<br/>
NFTs owned by the token treasury SHALL NOT be linked into that account's virtual linked list of NFTs.<br/>
NFTs not owned by the token treasury SHALL be linked into the owner account's virtual linked list of NFTs.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nft_id | [NftID](#proto-NftID) |  | The id of this NFT, consisting of a Token ID and serial number. |
| owner_id | [AccountID](#proto-AccountID) |  | The account or contract id that owns this NFT.<br/> If this NFT is owned by its token type's current treasury account, this value SHALL be zero. |
| spender_id | [AccountID](#proto-AccountID) |  | The account or contract id approved to spend this NFT.<br/> If there is no approved spender, this value SHALL be zero. |
| mint_time | [Timestamp](#proto-Timestamp) |  | The consensus time of the TokenMint that created this NFT as offset from the epoch.<br/> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| metadata | [bytes](#bytes) |  | The metadata bytes for this NFT. This is often a URI value.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| owner_previous_nft_id | [NftID](#proto-NftID) |  | The NFT ID of the previous entry in the current owner's "virtual double-linked list" of owned NFTs. If the owner of this NFT is the token treasury, this SHALL be unset. |
| owner_next_nft_id | [NftID](#proto-NftID) |  | The NFT ID of the next entry in the current owner's "virtual double-linked list" of owned NFTs. If the owner of this NFT is the token treasury, this SHALL be unset. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


