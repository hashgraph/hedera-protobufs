## Table of Contents

- [token_update_nfts.proto](#token_update_nfts-proto)
    - [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody)
  



<a name="token_update_nfts-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_update_nfts.proto
# Token Update NFTs
Given a token identifier and a metadata block, change the metadata for
one or more non-fungible/unique token instances.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenUpdateNftsTransactionBody"></a>

### TokenUpdateNftsTransactionBody
Modify the metadata field for an individual non-fungible/unique token (NFT).

Updating the metadata of an NFT SHALL NOT affect ownership or
the ability to transfer that NFT.<br/>
This transaction SHALL affect only the specific serial numbered tokens
identified.
This transaction SHALL modify individual token metadata.<br/>
This transaction MUST be signed by the token `metadata_key`.<br/>
The token `metadata_key` MUST be a valid `Key`.<br/>
The token `metadata_key` MUST NOT be an empty `KeyList`.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | A token identifier.<br/> This is the token type (i.e. collection) for which to update NFTs. <p> This field is REQUIRED.<br/> The identified token MUST exist, MUST NOT be paused, MUST have the type non-fungible/unique, and MUST have a valid `metadata_key`. |
| serial_numbers | [int64](#int64) | repeated | A list of serial numbers to be updated. <p> This field is REQUIRED.<br/> This list MUST have at least one(1) entry.<br/> This list MUST NOT have more than ten(10) entries. |
| metadata | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A new value for the metadata. <p> If this field is not set, the metadata SHALL NOT change.<br/> This value, if set, MUST NOT exceed 100 bytes. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



