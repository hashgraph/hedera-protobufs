## Table of Contents

- [token_update_nfts.proto](#token_update_nfts-proto)
    - [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody)
  



<a name="token_update_nfts-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_update_nfts.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenUpdateNftsTransactionBody"></a>

### TokenUpdateNftsTransactionBody
At consensus, updates an already created Non Fungible Token to the given values.

If no value is given for a field, that field is left unchanged.
Only certain fields such as metadata can be updated.

Updating the metadata of an NFT does not affect its ownership or transferability.
This operation is intended for updating attributes of individual NFTs in a collection.

This transaction SHALL update NFT metadata.<br/>
This transaction MUST be signed by the token `metadata_key`.<br/>
The token `metadata_key` MUST be set to a valid `Key`.<br/>
The token `metadata_key` MUST NOT be an empty `KeyList`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which to update NFTs. |
| serial_numbers | [int64](#int64) | repeated | The list of serial numbers to be updated. |
| metadata | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | The new metadata of the NFT(s) |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


