## Table of Contents

- [token_update.proto](#token_update-proto)
    - [TokenUpdateTransactionBody](#proto-TokenUpdateTransactionBody)
  



<a name="token_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenUpdateTransactionBody"></a>

### TokenUpdateTransactionBody
At consensus, updates an already created token to the given values.

If no value is given for a field, that field is left unchanged. For an immutable tokens (that is,
a token without an admin key), only the expiry may be updated. Setting any other field in that
case will cause the transaction status to resolve to TOKEN_IS_IMMUTABLE.

--- Signing Requirements ---
1. Whether or not a token has an admin key, its expiry can be extended with only the transaction
   payer's signature.
2. Updating any other field of a mutable token requires the admin key's signature.
3. If a new admin key is set, this new key must sign <b>unless</b> it is exactly an empty
   <tt>KeyList</tt>. This special sentinel key removes the existing admin key and causes the
   token to become immutable. (Other <tt>Key</tt> structures without a constituent
   <tt>Ed25519</tt> key will be rejected with <tt>INVALID_ADMIN_KEY</tt>.)
4. If a new treasury is set, the new treasury account's key must sign the transaction.

--- Nft Requirements ---
1. If a non fungible token has a positive treasury balance, the operation will abort with
   CURRENT_TREASURY_STILL_OWNS_NFTS.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The Token to be updated |
| symbol | [string](#string) |  | The new publicly visible token symbol. The token symbol is specified as a Unicode string. Its UTF-8 encoding cannot exceed 100 bytes, and cannot contain the 0 byte (NUL). |
| name | [string](#string) |  | The new publicly visible name of the token. The token name is specified as a Unicode string. Its UTF-8 encoding cannot exceed 100 bytes, and cannot contain the 0 byte (NUL). |
| treasury | [AccountID](#proto-AccountID) |  | The new Treasury account of the Token. If the provided treasury account is not existing or deleted, the response will be INVALID_TREASURY_ACCOUNT_FOR_TOKEN. If successful, the Token balance held in the previous Treasury Account is transferred to the new one. |
| adminKey | [Key](#proto-Key) |  | The new admin key of the Token. If Token is immutable, transaction will resolve to TOKEN_IS_IMMUTABlE. |
| kycKey | [Key](#proto-Key) |  | The new KYC key of the Token. If Token does not have currently a KYC key, transaction will resolve to TOKEN_HAS_NO_KYC_KEY. |
| freezeKey | [Key](#proto-Key) |  | The new Freeze key of the Token. If the Token does not have currently a Freeze key, transaction will resolve to TOKEN_HAS_NO_FREEZE_KEY. |
| wipeKey | [Key](#proto-Key) |  | The new Wipe key of the Token. If the Token does not have currently a Wipe key, transaction will resolve to TOKEN_HAS_NO_WIPE_KEY. |
| supplyKey | [Key](#proto-Key) |  | The new Supply key of the Token. If the Token does not have currently a Supply key, transaction will resolve to TOKEN_HAS_NO_SUPPLY_KEY. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | The new account which will be automatically charged to renew the token's expiration, at autoRenewPeriod interval. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The new interval at which the auto-renew account will be charged to extend the token's expiry. |
| expiry | [Timestamp](#proto-Timestamp) |  | The new expiry time of the token. Expiry can be updated even if admin key is not set. If the provided expiry is earlier than the current token expiry, transaction wil resolve to INVALID_EXPIRATION_TIME |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, the new memo to be associated with the token (UTF-8 encoding max 100 bytes) |
| fee_schedule_key | [Key](#proto-Key) |  | If set, the new key to use to update the token's custom fee schedule; if the token does not currently have this key, transaction will resolve to TOKEN_HAS_NO_FEE_SCHEDULE_KEY |
| pause_key | [Key](#proto-Key) |  | The Key which can pause and unpause the Token. If the Token does not currently have a pause key, transaction will resolve to TOKEN_HAS_NO_PAUSE_KEY |
| metadata | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | Metadata of the created token definition |
| metadata_key | [Key](#proto-Key) |  | The key which can change the metadata of a token (token definition, partition definition, and individual NFTs). If the Token does not have currently a Metadata key, transaction will resolve to TOKEN_HAS_NO_METADATA_KEY |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


