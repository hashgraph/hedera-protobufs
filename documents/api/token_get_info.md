## Table of Contents

- [token_get_info.proto](#token_get_info-proto)
    - [TokenGetInfoQuery](#proto-TokenGetInfoQuery)
    - [TokenGetInfoResponse](#proto-TokenGetInfoResponse)
    - [TokenInfo](#proto-TokenInfo)
  



<a name="token_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_get_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenGetInfoQuery"></a>

### TokenGetInfoQuery
Gets information about Token instance


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| token | [TokenID](#proto-TokenID) |  | The token for which information is requested. If invalid token is provided, INVALID_TOKEN_ID response is returned. |






<a name="proto-TokenGetInfoResponse"></a>

### TokenGetInfoResponse
Response when the client sends the node TokenGetInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| tokenInfo | [TokenInfo](#proto-TokenInfo) |  | The information requested about this token instance |






<a name="proto-TokenInfo"></a>

### TokenInfo
The metadata about a Token instance


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | ID of the token instance |
| name | [string](#string) |  | The name of the token. It is a string of ASCII only characters |
| symbol | [string](#string) |  | The symbol of the token. It is a UTF-8 capitalized alphabetical string |
| decimals | [uint32](#uint32) |  | The number of decimal places a token is divisible by. Always 0 for tokens of type NON_FUNGIBLE_UNIQUE |
| totalSupply | [uint64](#uint64) |  | For tokens of type FUNGIBLE_COMMON - the total supply of tokens that are currently in circulation. For tokens of type NON_FUNGIBLE_UNIQUE - the number of NFTs created of this token instance |
| treasury | [AccountID](#proto-AccountID) |  | The ID of the account which is set as Treasury |
| adminKey | [Key](#proto-Key) |  | The key which can perform update/delete operations on the token. If empty, the token can be perceived as immutable (not being able to be updated/deleted) |
| kycKey | [Key](#proto-Key) |  | The key which can grant or revoke KYC of an account for the token's transactions. If empty, KYC is not required, and KYC grant or revoke operations are not possible. |
| freezeKey | [Key](#proto-Key) |  | The key which can freeze or unfreeze an account for token transactions. If empty, freezing is not possible |
| wipeKey | [Key](#proto-Key) |  | The key which can wipe token balance of an account. If empty, wipe is not possible |
| supplyKey | [Key](#proto-Key) |  | The key which can change the supply of a token. The key is used to sign Token Mint/Burn operations |
| defaultFreezeStatus | [TokenFreezeStatus](#proto-TokenFreezeStatus) |  | The default Freeze status (not applicable, frozen or unfrozen) of Hedera accounts relative to this token. FreezeNotApplicable is returned if Token Freeze Key is empty. Frozen is returned if Token Freeze Key is set and defaultFreeze is set to true. Unfrozen is returned if Token Freeze Key is set and defaultFreeze is set to false |
| defaultKycStatus | [TokenKycStatus](#proto-TokenKycStatus) |  | The default KYC status (KycNotApplicable or Revoked) of Hedera accounts relative to this token. KycNotApplicable is returned if KYC key is not set, otherwise Revoked |
| deleted | [bool](#bool) |  | Specifies whether the token was deleted or not |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | An account which will be automatically charged to renew the token's expiration, at autoRenewPeriod interval |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The interval at which the auto-renew account will be charged to extend the token's expiry |
| expiry | [Timestamp](#proto-Timestamp) |  | The epoch second at which the token will expire |
| memo | [string](#string) |  | The memo associated with the token |
| tokenType | [TokenType](#proto-TokenType) |  | The token type |
| supplyType | [TokenSupplyType](#proto-TokenSupplyType) |  | The token supply type |
| maxSupply | [int64](#int64) |  | For tokens of type FUNGIBLE_COMMON - The Maximum number of fungible tokens that can be in circulation. For tokens of type NON_FUNGIBLE_UNIQUE - the maximum number of NFTs (serial numbers) that can be in circulation |
| fee_schedule_key | [Key](#proto-Key) |  | The key which can change the custom fee schedule of the token; if not set, the fee schedule is immutable |
| custom_fees | [CustomFee](#proto-CustomFee) | repeated | The custom fees to be assessed during a CryptoTransfer that transfers units of this token |
| pause_key | [Key](#proto-Key) |  | The Key which can pause and unpause the Token. |
| pause_status | [TokenPauseStatus](#proto-TokenPauseStatus) |  | Specifies whether the token is paused or not. PauseNotApplicable is returned if pauseKey is not set. |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| metadata | [bytes](#bytes) |  | Represents the metadata of the token definition. |
| metadata_key | [Key](#proto-Key) |  | The key which can change the metadata of a token (token definition and individual NFTs). |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


