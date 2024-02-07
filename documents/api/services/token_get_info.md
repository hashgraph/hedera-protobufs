## Table of Contents

- [token_get_info.proto](#token_get_info-proto)
    - [TokenGetInfoQuery](#proto-TokenGetInfoQuery)
    - [TokenGetInfoResponse](#proto-TokenGetInfoResponse)
    - [TokenInfo](#proto-TokenInfo)
  



<a name="token_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_info.proto
# Get Token Info
Query to retrieve information for a single token.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenGetInfoQuery"></a>

### TokenGetInfoQuery
Request information for a token.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| token | [TokenID](#proto-TokenID) |  | A token identifier. <p> This SHALL identify the token to query.<br/> The identified token MUST exist, and MUST NOT be deleted. |






<a name="proto-TokenGetInfoResponse"></a>

### TokenGetInfoResponse
A response message for the `getTokenInfo` query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| tokenInfo | [TokenInfo](#proto-TokenInfo) |  | The information requested for the identified token. |






<a name="proto-TokenInfo"></a>

### TokenInfo
An Hedera Token Service(HTS) token.

A token SHALL represent a fungible or non-fungible unit of exchange.<br/>
The specified Treasury Account SHALL receive the initial supply of tokens and
SHALL determine distribution of all tokens once minted.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | A unique identifier for this token. |
| name | [string](#string) |  | A human-readable name for this token. <p> This value MAY NOT be unique.<br/> This value SHALL NOT exceed 100 bytes when encoded as UTF-8. |
| symbol | [string](#string) |  | A human-readable symbol for the token. <p> This value SHALL NOT be unique.<br/> This value SHALL NOT exceed 100 bytes when encoded as UTF-8. |
| decimals | [uint32](#uint32) |  | A number of decimal places for this token. <p> If decimals are 8 or 11, then the number of whole tokens can be at most billions or millions, respectively. More decimals allows for a more finely-divided token, but also limits the maximum total supply. <p> Examples <ul> <li>Bitcoin satoshis (21 million whole tokens with 8 decimals).</li> <li>Hedera tinybar (50 billion whole tokens with 8 decimals).</li> <li>Bitcoin milli-satoshis (21 million whole tokens with 11 decimals).</li> <li>Theoretical limit is roughly 92.2 billion with 8 decimals, or 92.2 million with 11 decimals.</li> </ul> All token amounts in the network are stored as integer amounts, with each unit representing 10<sup>-decimals</sup> whole tokens. <p> For tokens with `token_type` set to `NON_FUNGIBLE_UNIQUE` this MUST be 0. |
| totalSupply | [uint64](#uint64) |  | A _current_ total supply of this token, expressed in the smallest unit of the token. <p> The number of _whole_ tokens this represents is (total_supply / 10<sup>decimals</sup>). The value of total supply, MUST be within the positive range of a twos-compliment signed 64-bit integer. The `total_supply`, therefore MUST be between 1, and 9,223,372,036,854,775,807, inclusive. <p> This value SHALL be reduced when a `token_burn` or `token_wipe_account` operation is executed, and SHALL be increased when a `token_mint` operation is executed. |
| treasury | [AccountID](#proto-AccountID) |  | A treasury account identifier for this token. <p> When the token is created, the initial supply given in the token create transaction SHALL be minted and deposited in the treasury account.<br/> All token mint transactions for this token SHALL deposit the new minted tokens in the treasury account.<br/> All token burn transactions for this token SHALL remove the tokens to be burned from the treasury account. |
| adminKey | [Key](#proto-Key) |  | Access control for general modification of this token. <p> This key MUST sign any `token_update` transaction that changes any attribute of the token other than expiration_time. Other attributes of this token MAY be changed by transactions other than `token_update`, and MUST be signed by one of the other purpose-specific keys assigned to the token.<br/> This value can be set during token creation, and SHALL NOT be modified thereafter, unless the update transaction is signed by both the existing `admin_key` and the new `admin_key`.<br/> If the `admin_key` is not set for a token, that token SHALL be immutable. |
| kycKey | [Key](#proto-Key) |  | Access control for KYC for this token. <p> Know Your Customer (KYC) status may be granted for an account by a token grant kyc transaction signed by this key.<br/> If this key is not set, then KYC status cannot be granted to an account for this token, and any `TokenGrantKyc` transaction attempting to grant kyc to an account for this token SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| freezeKey | [Key](#proto-Key) |  | Access control to freeze this token. <p> A token may be frozen for an account, preventing any transaction from transferring that token for that specified account, by a token freeze account transaction signed by this key.<br/> If this key is not set, the token cannot be frozen, and any transaction attempting to freeze the token for an account SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| wipeKey | [Key](#proto-Key) |  | Access control of account wipe for this token. <p> A token may be wiped, removing and burning tokens from a specific account, by a token wipe transaction, which MUST be signed by this key. The `treasury_account` cannot be subjected to a token wipe. A token burn transaction, signed by the `supply_key`, serves to burn tokens held by the `treasury_account` instead.<br/> If this key is not set, the token cannot be wiped, and any transaction attempting to wipe the token from an account SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| supplyKey | [Key](#proto-Key) |  | Access control of token mint/burn for this token. <p> A token mint transaction MUST be signed by this key, and any token mint transaction not signed by the current `supply_key` for that token SHALL NOT succeed.<br/> A token burn transaction MUST be signed by this key, and any token burn transaction not signed by the current `supply_key` for that token SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| defaultFreezeStatus | [TokenFreezeStatus](#proto-TokenFreezeStatus) |  | A flag indicating if accounts associated to this token are frozen by default, not frozen, or freeze is not applicable. <p> Accounts frozen by default and newly associated with this token CANNOT transact in the token until unfrozen.<br/> This SHALL NOT prevent a `tokenReject` transaction to return the tokens from an account to the treasury account. |
| defaultKycStatus | [TokenKycStatus](#proto-TokenKycStatus) |  | A flag indicating if accounts associated with this token are granted KYC by default, revoked by default, or KYC is not applicable. |
| deleted | [bool](#bool) |  | A flag indicating that this token is deleted. <p> A transaction involving a deleted token MUST NOT succeed. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | An identifier for the account (if any) that the network will attempt to charge for this token's auto-renewal upon expiration. <p> This field is OPTIONAL. If it is not set then renewal fees SHALL be charged to the account identified by `treasury`. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | A duration by which the network should automatically extend this token's expiration. <p> If the token has a valid auto-renew account, and is not deleted upon expiration, the network SHALL attempt to automatically renew this token.<br/> The default values for the minimum period and maximum period are 30 days and 90 days, respectively. |
| expiry | [Timestamp](#proto-Timestamp) |  | An expiration time for this token, in seconds since the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| memo | [string](#string) |  | A short description of this token. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| tokenType | [TokenType](#proto-TokenType) |  | A type for this token. <p> A token SHALL be either `FUNGIBLE_COMMON` or `NON_FUNGIBLE_UNIQUE`.<br/> If this value was omitted during token creation, `FUNGIBLE_COMMON` SHALL be used.<br/> The value `FUNGIBLE_COMMON` SHALL represent a fungible/common token. The value `NON_FUNGIBLE_UNIQUE` SHALL represent a non-fungible/unique token. |
| supplyType | [TokenSupplyType](#proto-TokenSupplyType) |  | A supply type for this token. <p> A token SHALL have either `INFINITE` or `FINITE` supply type.<br/> If this value was omitted during token creation, the value `INFINITE` SHALL be used. |
| maxSupply | [int64](#int64) |  | A maximum supply of this token.<br/> This is the maximum number of tokens of this type that may be issued. <p> This limit SHALL apply regardless of `token_type`.<br/> If `supply_type` is `INFINITE` then this value MUST be 0.<br/> If `supply_type` is `FINITE`, then this value MUST be greater than 0. |
| fee_schedule_key | [Key](#proto-Key) |  | Access control of the `custom_fees` field for this token. <p> The token custom fee schedule may be changed, modifying the fees charged for transferring that token, by a token update transaction, which MUST be signed by this key.<br/> If this key is not set, the token custom fee schedule cannot be changed, and any transaction attempting to change the custom fee schedule for this token SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| custom_fees | [CustomFee](#proto-CustomFee) | repeated | A custom fee schedule for this token. |
| pause_key | [Key](#proto-Key) |  | Access control of pause/unpause for this token. <p> A token may be paused, preventing any transaction from transferring that token, by a token update transaction signed by this key.<br/> If this key is not set, the token cannot be paused, and any transaction attempting to pause the token SHALL NOT succeed.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |
| pause_status | [TokenPauseStatus](#proto-TokenPauseStatus) |  | A flag indicating that this token is paused.<br/> A token may be paused, unpaused, or pause not applicable. <p> A transaction involving a paused token, other than token_unpause, MUST NOT succeed. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response.<br/> This is originally defined in `HIP-198` and depends on network configuration.<br/> The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |
| metadata | [bytes](#bytes) |  | A Token "Metadata". <p> This value, if set, SHALL NOT exceed 100 bytes. |
| metadata_key | [Key](#proto-Key) |  | Access Control of metadata update for this token. <p> A transaction to update the `metadata` field of this token MUST be signed by this key.<br/> If this token is a non-fungible/unique token type, a transaction to update the `metadata` field of any individual serialized unique token of this type MUST be signed by this key.<br/> If this key is not set, the token metadata SHALL NOT be changed after it is created.<br/> If this key is not set, the metadata for any individual serialized token of this type SHALL NOT be changed after it is created.<br/> This key MAY be set when the token is created, and MAY be set or modified via a token update transaction signed by the `admin_key`.<br/> If `admin_key` is not set, this value, whether set or unset, SHALL be immutable. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



