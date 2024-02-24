## Table of Contents

- [token_mint.proto](#token_mint-proto)
    - [TokenMintTransactionBody](#proto-TokenMintTransactionBody)
  



<a name="token_mint-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_mint.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenMintTransactionBody"></a>

### TokenMintTransactionBody
Mints tokens to the Token's treasury Account. If no Supply Key is defined, the transaction will
resolve to TOKEN_HAS_NO_SUPPLY_KEY.
The operation increases the Total Supply of the Token. The maximum total supply a token can have
is 2^63-1.
The amount provided must be in the lowest denomination possible. Example:
Token A has 2 decimals. In order to mint 100 tokens, one must provide amount of 10000. In order
to mint 100.55 tokens, one must provide amount of 10055.
If both amount and metadata list get filled, a INVALID_TRANSACTION_BODY response code will be
returned.
If the metadata list contains metadata which is too large, a METADATA_TOO_LONG response code will
be returned.
If the metadata list is not filled for a non-fungible token type, a INVALID_TOKEN_MINT_AMOUNT response
code will be returned.
If a zero amount is provided for a fungible token type, it will be treated as a regular transaction.
If the metadata list count is greater than the batch size limit global dynamic property, a
BATCH_SIZE_LIMIT_EXCEEDED response code will be returned.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which to mint tokens. If token does not exist, transaction results in INVALID_TOKEN_ID |
| amount | [uint64](#uint64) |  | Applicable to tokens of type FUNGIBLE_COMMON. The amount to mint to the Treasury Account. Amount must be a positive non-zero number represented in the lowest denomination of the token. The new supply must be lower than 2^63. |
| metadata | [bytes](#bytes) | repeated | Applicable to tokens of type NON_FUNGIBLE_UNIQUE. A list of metadata that are being created. Maximum allowed size of each metadata is 100 bytes |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


