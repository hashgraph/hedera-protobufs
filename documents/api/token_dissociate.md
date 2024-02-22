## Table of Contents

- [token_dissociate.proto](#token_dissociate-proto)
    - [TokenDissociateTransactionBody](#proto-TokenDissociateTransactionBody)
  



<a name="token_dissociate-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_dissociate.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenDissociateTransactionBody"></a>

### TokenDissociateTransactionBody
Dissociates the provided account with the provided tokens. Must be signed by the provided
Account's key.
If the provided account is not found, the transaction will resolve to INVALID_ACCOUNT_ID.
If the provided account has been deleted, the transaction will resolve to ACCOUNT_DELETED.
If any of the provided tokens is not found, the transaction will resolve to INVALID_TOKEN_REF.
If any of the provided tokens has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If an association between the provided account and any of the tokens does not exist, the
transaction will resolve to TOKEN_NOT_ASSOCIATED_TO_ACCOUNT.
If a token has not been deleted and has not expired, and the user has a nonzero balance, the
transaction will resolve to TRANSACTION_REQUIRES_ZERO_TOKEN_BALANCES.
If a <b>fungible token</b> has expired, the user can disassociate even if their token balance is
not zero.
If a <b>non fungible token</b> has expired, the user can <b>not</b> disassociate if their token
balance is not zero. The transaction will resolve to TRANSACTION_REQUIRED_ZERO_TOKEN_BALANCES.
On success, associations between the provided account and tokens are removed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account | [AccountID](#proto-AccountID) |  | The account to be dissociated with the provided tokens |
| tokens | [TokenID](#proto-TokenID) | repeated | The tokens to be dissociated with the provided account |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


