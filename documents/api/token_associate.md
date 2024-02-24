## Table of Contents

- [token_associate.proto](#token_associate-proto)
    - [TokenAssociateTransactionBody](#proto-TokenAssociateTransactionBody)
  



<a name="token_associate-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_associate.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenAssociateTransactionBody"></a>

### TokenAssociateTransactionBody
Associates the provided account with the provided tokens. Must be signed by the provided
Account's key.
If the provided account is not found, the transaction will resolve to INVALID_ACCOUNT_ID.
If the provided account has been deleted, the transaction will resolve to ACCOUNT_DELETED.
If any of the provided tokens is not found, the transaction will resolve to INVALID_TOKEN_REF.
If any of the provided tokens has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If an association between the provided account and any of the tokens already exists, the
transaction will resolve to TOKEN_ALREADY_ASSOCIATED_TO_ACCOUNT.
If the provided account's associations count exceed the constraint of maximum token associations
per account, the transaction will resolve to TOKENS_PER_ACCOUNT_LIMIT_EXCEEDED.
On success, associations between the provided account and tokens are made and the account is
ready to interact with the tokens.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account | [AccountID](#proto-AccountID) |  | The account to be associated with the provided tokens |
| tokens | [TokenID](#proto-TokenID) | repeated | The tokens to be associated with the provided account. In the case of NON_FUNGIBLE_UNIQUE Type, once an account is associated, it can hold any number of NFTs (serial numbers) of that token type |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


