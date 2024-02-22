## Table of Contents

- [token_burn.proto](#token_burn-proto)
    - [TokenBurnTransactionBody](#proto-TokenBurnTransactionBody)
  



<a name="token_burn-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_burn.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenBurnTransactionBody"></a>

### TokenBurnTransactionBody
Burns tokens from the Token's treasury Account. If no Supply Key is defined, the transaction will
resolve to TOKEN_HAS_NO_SUPPLY_KEY.
The operation decreases the Total Supply of the Token. Total supply cannot go below zero.
The amount provided must be in the lowest denomination possible. Example:
Token A has 2 decimals. In order to burn 100 tokens, one must provide amount of 10000. In order
to burn 100.55 tokens, one must provide amount of 10055.
For non fungible tokens the transaction body accepts serialNumbers list of integers as a parameter.

If the serialNumbers don't get filled for non-fungible token type, a INVALID_TOKEN_BURN_AMOUNT response
code will be returned.
If a zero amount is provided for a fungible token type, it will be treated as a regular transaction.
If both amount and serialNumbers get filled, a INVALID_TRANSACTION_BODY response code will be
returned.
If the serialNumbers' list count is greater than the batch size limit global dynamic property, a
BATCH_SIZE_LIMIT_EXCEEDED response code will be returned.
If the serialNumbers list contains a non-positive integer as a serial number, a INVALID_NFT_ID
response code will be returned.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which to burn tokens. If token does not exist, transaction results in INVALID_TOKEN_ID |
| amount | [uint64](#uint64) |  | Applicable to tokens of type FUNGIBLE_COMMON. The amount to burn from the Treasury Account. Amount must be a positive non-zero number, not bigger than the token balance of the treasury account (0; balance], represented in the lowest denomination. |
| serialNumbers | [int64](#int64) | repeated | Applicable to tokens of type NON_FUNGIBLE_UNIQUE. The list of serial numbers to be burned. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


