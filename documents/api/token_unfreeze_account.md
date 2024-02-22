## Table of Contents

- [token_unfreeze_account.proto](#token_unfreeze_account-proto)
    - [TokenUnfreezeAccountTransactionBody](#proto-TokenUnfreezeAccountTransactionBody)
  



<a name="token_unfreeze_account-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_unfreeze_account.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenUnfreezeAccountTransactionBody"></a>

### TokenUnfreezeAccountTransactionBody
Unfreezes transfers of the specified token for the account. Must be signed by the Token's
freezeKey.
If the provided account is not found, the transaction will resolve to INVALID_ACCOUNT_ID.
If the provided account has been deleted, the transaction will resolve to ACCOUNT_DELETED.
If the provided token is not found, the transaction will resolve to INVALID_TOKEN_ID.
If the provided token has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If an Association between the provided token and account is not found, the transaction will
resolve to TOKEN_NOT_ASSOCIATED_TO_ACCOUNT.
If no Freeze Key is defined, the transaction will resolve to TOKEN_HAS_NO_FREEZE_KEY.
Once executed the Account is marked as Unfrozen and will be able to receive or send tokens. The
operation is idempotent.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which this account will be unfrozen. If token does not exist, transaction results in INVALID_TOKEN_ID |
| account | [AccountID](#proto-AccountID) |  | The account to be unfrozen |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


