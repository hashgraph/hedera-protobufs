## Table of Contents

- [token_update_nft.proto](#token_update_nft-proto)
    - [TokenUpdateNftTransactionBody](#proto-TokenUpdateNftTransactionBody)
  



<a name="token_update_nft-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_update_nft.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenUpdateNftTransactionBody"></a>

### TokenUpdateNftTransactionBody
At consensus, updates an already created Non Fungible Token to the given values.

If no value is given for a field, that field is left unchanged. For an immutable tokens (that is,
a token without an admin key), only the expiry may be updated. Setting any other field in that
case will cause the transaction status to resolve to TOKEN_IS_IMMUTABLE.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nft_id | [NftID](#proto-NftID) |  | The NftID of the NFT |
| metadata | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | The new metadata of the NFT |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


