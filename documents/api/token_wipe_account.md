## Table of Contents

- [token_wipe_account.proto](#token_wipe_account-proto)
    - [TokenWipeAccountTransactionBody](#proto-TokenWipeAccountTransactionBody)
  



<a name="token_wipe_account-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_wipe_account.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenWipeAccountTransactionBody"></a>

### TokenWipeAccountTransactionBody
Wipes the provided amount of tokens from the specified Account. Must be signed by the Token's
Wipe key.
If the provided account is not found, the transaction will resolve to INVALID_ACCOUNT_ID.
If the provided account has been deleted, the transaction will resolve to ACCOUNT_DELETED.
If the provided token is not found, the transaction will resolve to INVALID_TOKEN_ID.
If the provided token has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If an Association between the provided token and account is not found, the transaction will
resolve to TOKEN_NOT_ASSOCIATED_TO_ACCOUNT.
If Wipe Key is not present in the Token, transaction results in TOKEN_HAS_NO_WIPE_KEY.
If the provided account is the Token's Treasury Account, transaction results in
CANNOT_WIPE_TOKEN_TREASURY_ACCOUNT
On success, tokens are removed from the account and the total supply of the token is decreased by
the wiped amount.

If both amount and serialNumbers get filled, a INVALID_TRANSACTION_BODY response code will be
returned.
If the serialNumbers don't get filled for a non-fungible token type, a INVALID_WIPING_AMOUNT response
code will be returned.
If a zero amount is provided for a fungible token type, it will be treated as a regular transaction.
If the serialNumbers list contains a non-positive integer as a serial number, a INVALID_NFT_ID
response code will be returned.
If the serialNumbers' list count is greater than the batch size limit global dynamic property, a
BATCH_SIZE_LIMIT_EXCEEDED response code will be returned.

The amount provided is in the lowest denomination possible. Example:
Token A has 2 decimals. In order to wipe 100 tokens from account, one must provide amount of
10000. In order to wipe 100.55 tokens, one must provide amount of 10055.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which the account will be wiped. If token does not exist, transaction results in INVALID_TOKEN_ID |
| account | [AccountID](#proto-AccountID) |  | The account to be wiped |
| amount | [uint64](#uint64) |  | Applicable to tokens of type FUNGIBLE_COMMON. The amount of tokens to wipe from the specified account. Amount must be a positive non-zero number in the lowest denomination possible, not bigger than the token balance of the account (0; balance] |
| serialNumbers | [int64](#int64) | repeated | Applicable to tokens of type NON_FUNGIBLE_UNIQUE. The list of serial numbers to be wiped. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


