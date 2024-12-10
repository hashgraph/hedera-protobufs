## Table of Contents

- [state/token/token_relation.proto](#state_token_token_relation-proto)
    - [TokenRelation](#proto-TokenRelation)
  



<a name="state_token_token_relation-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/token_relation.proto
# Token Relationship.
This is a connection between one Account, one _fungible_ Token, and
associated balance within the Hedera network.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenRelation"></a>

### TokenRelation
An Hedera Token Service token relationship.

A token relationship connects an Account with a Token and is necessary for
that Account to transact in that Token. TokenRelationship defines a
connection between one account and one token type.

A TokenRelation SHALL be identified by the combination of token_id and
account_id.<br/>
A TokenRelation SHALL contain, for the referenced token,<br/>
The account's current balance, whether the account has KYC granted,
and whether the assets are frozen.

TokenRelation entries SHALL be connected via a "virtual linked list" with the
next TokenID and previous TokenID stored in the TokenRelation.
These TokenIDs MUST be combined with the AccountID to find the next or
previous relationship in the list.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | A token identifier. <p> This SHALL identify the token involved in this association. |
| account_id | [AccountID](#proto-AccountID) |  | An account identifier. <p> This SHALL identify the account involved in this association. |
| balance | [int64](#int64) |  | The fungible token balance of this token relationship. <p> This MUST be a whole number. |
| frozen | [bool](#bool) |  | A flag indicating that this token relationship is frozen. <p> When a token relationship is frozen the associated account SHALL NOT be permitted to transfer to or from the associated balance. <p> This flag is associated with the Token value `freeze_key`, and any transaction to set this flag MUST be signed by that key. If the Token does not have a `freeze_key` set, then this flag SHALL NOT be set true for relationships between accounts and that token. |
| kyc_granted | [bool](#bool) |  | A flag indicating that this token relationship has been granted KYC status. <p> If the token flag `accounts_kyc_granted_by_default` is set true, then this flag SHALL be set true for all accounts subsequently associated to that token. Otherwise this flag SHALL NOT be set until a transaction is submitted, and signed with the Token `kyc_key` to set the flag true.<br/> If the Token does not have a `kyc_key` set and the token flag `accounts_kyc_granted_by_default` is not set true, then this value MUST be false for all accounts subsequently associated to that token. <p> Typically a transaction to set this value to true is considered equivalent to asserting that the "Know Your Customer" (KYC) requirements have been met for this combination of account and token and the relevant records are available as required. |
| automatic_association | [bool](#bool) |  | A flag indicating that this token relationship was created using automatic association. <p> If this is true then there MUST NOT exist a customer-signed transaction associating this account and token combination and the account `used_auto_associations` SHALL be incremented when this relationship is created. |
| previous_token | [TokenID](#proto-TokenID) |  | The Token ID of the previous entry in the associated Account's "virtual double-linked list" of token relationships. <p> This must be combined with the value of `account_id` to identify the actual `TokenRelation` referenced. |
| next_token | [TokenID](#proto-TokenID) |  | The Token ID of the next entry in the associated Account's "virtual double-linked list" of token relationships. <p> This must be combined with the value of `account_id` to identify the actual `TokenRelation` referenced. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



