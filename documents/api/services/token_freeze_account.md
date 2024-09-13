## Table of Contents

- [token_freeze_account.proto](#token_freeze_account-proto)
    - [TokenFreezeAccountTransactionBody](#proto-TokenFreezeAccountTransactionBody)
  



<a name="token_freeze_account-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_freeze_account.proto
# Token Freeze Account
Freeze all tokens of an identified type for an identified account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenFreezeAccountTransactionBody"></a>

### TokenFreezeAccountTransactionBody
Block transfers of a token type for an account.<br/>
This, effectively, freezes assets of one account with respect to
one token type. While frozen, that account cannot send or receive tokens
of the identified type.

The token MUST have a `freeze_key` set and that key MUST NOT
be an empty `KeyList`.<br/>
The token `freeze_key` MUST sign this transaction.<br/>
The identified token MUST exist, MUST NOT be deleted, MUST NOT be paused,
and MUST NOT be expired.<br/>
The identified account MUST exist, MUST NOT be deleted, and
MUST NOT be expired.<br/>
If the identified account is already frozen with respect to the identified
token, the transaction SHALL succeed, but no change SHALL be made.<br/>
An association between the identified account and the identified
token MUST exist.

### Block Stream Effects
None


| Field | Type | Description |
| ----- | ---- | ----------- |
| token | [TokenID](#proto-TokenID) | A token identifier. <p> This SHALL identify the token type to "freeze".<br/> The identified token MUST exist, MUST NOT be deleted, and MUST be associated to the identified account. |
| account | [AccountID](#proto-AccountID) | An account identifier. <p> This shall identify the account to "freeze".<br/> The identified account MUST exist, MUST NOT be deleted, MUST NOT be expired, and MUST be associated to the identified token.<br/> The identified account SHOULD NOT be "frozen" with respect to the identified token. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



