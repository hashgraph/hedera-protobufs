## Table of Contents

- [state/token/token.proto](#state_token_token-proto)
    - [Token](#proto-Token)
  



<a name="state_token_token-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/token.proto
## Token
Tokens represent both fungible and non-fungible units of exchange. The `Token` here represents
a token within the network state.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-Token"></a>

### Token
An Hedera Token Service token; a token represents a fungible or non-fungible unit of exchange.

The specified Treasury Account receives the initial supply of tokens and determines distribution
of all tokens once minted.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The unique identifier for this token. |
| name | [string](#string) |  | The human-readable name for this token. This may not be unique.<br/> The value SHALL be encoded as UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| symbol | [string](#string) |  | The human-readable symbol for the token. This may not be unique.<br/> The value SHALL be encoded as UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| decimals | [int32](#int32) |  | The number of decimal places for this token.<br/> If decimals are 8 or 11, then the number of whole tokens can be at most billions or millions, respectively. More decimals allows for a more finely-divided token, but also limits the maximum total supply. <p> Examples <ul> <li>Bitcoin satoshis (21 million whole tokens with 8 decimals).</li> <li>Hedera tinybar (50 billion whole tokens with 8 decimals).</li> <li>Bitcoin milli-satoshis (21 million whole tokens with 11 decimals).</li> <li>Theoretical limit is roughly 92.2 billion with 8 decimals, or 92.2 million with 11 decimals.</li> </ul> All token amounts in the network are stored as integer amounts, with each unit representing 10<sup>-decimals</sup> whole tokens. <p> For tokens with `token_type` set to `NON_FUNGIBLE_UNIQUE` this MUST be 0. |
| total_supply | [int64](#int64) |  | The _current_ total supply of this token, expressed in the smallest unit of the token.<br/> The number of _whole_ tokens this represents is (total_supply / 10<sup>decimals</sup>). The value of total supply, MUST be within the positive range of a twos-compliment signed 64-bit integer. The `total_supply`, therefore MUST be between 1, and 9,223,372,036,854,775,807, inclusive. <p> This value SHALL be reduced when a `token_burn` or `token_wipe_account` operation is executed, and SHALL be increased when a `token_mint` operation is executed. |
| treasury_account_id | [AccountID](#proto-AccountID) |  | The treasury account id for this token. <p> When the token is created, the initial supply given in the token create transaction SHALL be minted and deposited in the treasury account. <p> All token mint transactions for this token SHALL deposit the new minted tokens in the treasury account. <p> All token burn transactions for this token SHALL remove the tokens to be burned from the treasury account. |
| admin_key | [Key](#proto-Key) |  | Access control for general modification of this token. <p> This key MUST sign any `token_update` transaction that changes any attribute of the token other than expiration_time. Other attributes of this token MAY be changed by transactions other than `token_update`, and MUST be signed by one of the other purpose-specific keys assigned to the token. <p> This value can only be set during token creation, and SHALL NOT be modified thereafter. <p> If the `admin_key` is not set for a token, that token SHALL be immutable. |
| kyc_key | [Key](#proto-Key) |  | Access control for KYC for this token. <p> Know Your Customer (KYC) status may be granted for an account by a token grant kyc transaction signed by this key. <p> If this key is not set, then KYC status cannot be granted to an account for this token, and any `TokenGrantKyc` transaction attempting to grant kyc to an account for this token SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| freeze_key | [Key](#proto-Key) |  | Access control to freeze this token. <p> A token may be frozen for an account, preventing any transaction from transferring that token for that specified account, by a token freeze account transaction signed by this key. <p> If this key is not set, the token cannot be frozen, and any transaction attempting to freeze the token for an account SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| wipe_key | [Key](#proto-Key) |  | Access control of account wipe for this token. <p> A token may be wiped, removing and burning tokens from a specific account, by a token wipe transaction, which MUST be signed by this key. The `treasury_account` cannot be subjected to a token wipe. A token burn transaction, signed by the `supply_key` serves to burn tokens held by the `treasury_account` instead. <p> If this key is not set, the token cannot be wiped, and any transaction attempting to wipe the token from an account SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| supply_key | [Key](#proto-Key) |  | Access control of token mint/burn for this token. <p> A token mint transaction MUST be signed by this key, and any token mint transaction not signed by the current `supply_key` for that token SHALL NOT succeed. <p> A token burn transaction MUST be signed by this key, and any token burn transaction not signed by the current `supply_key` for that token SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| fee_schedule_key | [Key](#proto-Key) |  | Access control of the `custom_fees` field for this token. <p> The token custom fee schedule may be changed, modifying the fees charged for transferring that token, by a token update transaction, which MUST be signed by this key. <p> If this key is not set, the token custom fee schedule cannot be changed, and any transaction attempting to change the custom fee schedule for this token SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| pause_key | [Key](#proto-Key) |  | Access control of pause/unpause for this token. <p> A token may be paused, preventing any transaction from transferring that token, by a token update transaction signed by this key. <p> If this key is not set, the token cannot be paused, and any transaction attempting to pause the token SHALL NOT succeed. <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| last_used_serial_number | [int64](#int64) |  | The last used serial number for this token. This applies only to non-fungible tokens.<br/> When a new NFT is minted, the serial number to apply SHALL be calculated from this value. |
| deleted | [bool](#bool) |  | A flag indicating that this token is deleted.<br/> A transaction involving a deleted token MUST NOT succeed. |
| token_type | [TokenType](#proto-TokenType) |  | The type of this token. A token can be either `FUNGIBLE_COMMON` or `NON_FUNGIBLE_UNIQUE`.<br/> If this value was omitted during token creation, `FUNGIBLE_COMMON` is used. |
| supply_type | [TokenSupplyType](#proto-TokenSupplyType) |  | The supply type for this token. A token can have either `INFINITE` or `FINITE` supply type.<br/> If this value was omitted during token creation, `INFINITE` is used. |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | The id of the account (if any) that the network will attempt to charge for this token's auto-renewal upon expiration. |
| auto_renew_seconds | [int64](#int64) |  | The number of seconds the network should automatically extend this token's expiration by, if the token has a valid auto-renew account, and is not deleted upon expiration.<br/> If this is not provided in an allowed range on token creation, the transaction will fail with `INVALID_AUTO_RENEWAL_PERIOD`. The default values for the minimum period and maximum period are 30 days and 90 days, respectively. |
| expiration_second | [int64](#int64) |  | The expiration time for this token, in seconds since the epoch. |
| memo | [string](#string) |  | A short description of this token.<br/> The value SHALL be encoded as UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| max_supply | [int64](#int64) |  | The maximum supply of this token.<br/> This is the maximum number of tokens of this type that may be issued. This limit applies regardless of `token_type`. <p> If `supply_type` is `INFINITE` then this value MUST be 0. <p> If `supply_type` is `FINITE`, then this value MUST be greater than 0. |
| paused | [bool](#bool) |  | A flag indicating that this token is paused.<br/> A transaction involving a paused token, other than token_unpause, MUST NOT succeed. This SHALL NOT prevent a `tokenReject` transaction to return the tokens from an account to the treasury account. |
| accounts_frozen_by_default | [bool](#bool) |  | A flag indicating that accounts associated to this token are frozen by default.<br/> Accounts newly associated with this token CANNOT transact in the token until unfrozen.<br/> This SHALL NOT prevent a `tokenReject` transaction to return the tokens from an account to the treasury account. |
| accounts_kyc_granted_by_default | [bool](#bool) |  | A flag indicating that accounts associated with this token are granted KYC by default. |
| custom_fees | [CustomFee](#proto-CustomFee) | repeated | A custom fee schedule for this token. |
| metadata | [bytes](#bytes) |  | Token "Metadata".<br/> The value SHALL be encoded as UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| metadata_key | [Key](#proto-Key) |  | Access Control of metadata update for this token.<br/> A transaction to update the `metadata` field of this token MUST be signed by this key.<br/> If this token is a non-fungible/unique token type, a transaction to update the `metadata` field of any individual serialized unique token of this type MUST be signed by this key.<br/> If this key is not set, the token metadata SHALL NOT be changed after it is created.<br/> If this key is not set, the metadata for any individual serialized token of this type SHALL NOT be changed after it is created.<br/> <p> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction, which MUST be signed by the `admin_key`. <p> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


