## Table of Contents

- [crypto_update.proto](#crypto_update-proto)
    - [CryptoUpdateTransactionBody](#proto-CryptoUpdateTransactionBody)
  



<a name="crypto_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_update.proto
# Crypto Update
Modify a single account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoUpdateTransactionBody"></a>

### CryptoUpdateTransactionBody
Modify the current state of an account.

### Requirements
- The `key` for this account MUST sign all account update transactions.
- If the `key` field is set for this transaction, then _both_ the current
  `key` and the new `key` MUST sign this transaction, for security and to
  prevent setting the `key` field to an invalid value.
- If the `auto_renew_account` field is set for this transaction, the account
  identified in that field MUST sign this transaction.
- Fields set to non-default values in this transaction SHALL be updated on
  success. Fields not set to non-default values SHALL NOT be
  updated on success.
- All fields that may be modified in this transaction SHALL have a
  default value of unset (a.k.a. `null`).

### Block Stream Effects
None

NOTE: Seven deprecated fields should probably be removed and the
      field names reserved.
reserved 4,5,6,7,10,11,12
Also, the `receiverSigRequiredField` oneOf should be removed
around `receiverSigRequiredWrapper` and the field renamed
(both actions are "safe" in protobuf) to `receiver_signature_required`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountIDToUpdate | [AccountID](#proto-AccountID) |  | An account identifier.<br/> This identifies the account which is to be modified in this transaction. <p> This field is REQUIRED. |
| key | [Key](#proto-Key) |  | An account key.<br/> This may be a "primitive" key (a singly cryptographic key), or a composite key. <p> If set, this key MUST be a valid key.<br/> If set, the previous key and new key MUST both sign this transaction. |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** Removed in favor of the `staked_id` oneOf.<br/> An account identifier for a "proxy" account. This account's HBAR are staked to a node selected by the proxy account. |
| proxyFraction | [int32](#int32) |  | **Deprecated.** Removed prior to the first available history.<br/> A fraction to split staking rewards between this account and the proxy account. |
| sendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> The new threshold amount (in tinybars) for which an account record is created for any send/withdraw transaction |
| sendRecordThresholdWrapper | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> The new threshold amount (in tinybars) for which an account record is created for any send/withdraw transaction |
| receiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> The new threshold amount (in tinybars) for which an account record is created for any receive/deposit transaction. |
| receiveRecordThresholdWrapper | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> The new threshold amount (in tinybars) for which an account record is created for any receive/deposit transaction. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | A duration to extend account expiration.<br/> An amount of time, in seconds, to extend the expiration date for this account when _automatically_ renewed. <p> This duration MUST be between the current configured minimum and maximum values defined for the network.<br/> This duration SHALL be applied only when _automatically_ extending the account expiration. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | A new account expiration time, in seconds since the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`.<br/> If set, this value MUST be later than the current consensus time.<br/> If set, this value MUST be earlier than the current consensus time extended by the current maximum expiration time configured for the network. |
| receiverSigRequired | [bool](#bool) |  | **Deprecated.** Removed to distinguish between unset and a default value.<br/> Do NOT use this field to set a false value because the server cannot distinguish from the default value. Use receiverSigRequiredWrapper field for this purpose. |
| receiverSigRequiredWrapper | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | A flag indicating the account holder must authorize all incoming token transfers. <p> If this flag is set then any transaction that would result in adding hbar or other tokens to this account balance MUST be signed by the identifying key of this account (that is, the `key` field). |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A short description of this Account. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| max_automatic_token_associations | [google.protobuf.Int32Value](#google-protobuf-Int32Value) |  | A maximum number of tokens that can be auto-associated with this account.<br/> By default this value is 0 for all accounts except for automatically created accounts (i.e smart contracts) which default to -1. <p> If this value is `0`, then this account MUST manually associate to a token before holding or transacting in that token.<br/> This value MAY also be `-1` to indicate no limit.<br/> If set, this value MUST NOT be less than `-1`.<br/> |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the account to which this account is staking its balances. <p> If this account is not currently staking its balances, then this field, if set, MUST be the sentinel value of `0.0.0`. |
| staked_node_id | [int64](#int64) |  | ID of the node this account is staked to. <p> If this account is not currently staking its balances, then this field, if set, SHALL be the sentinel value of `-1`.<br/> Wallet software SHOULD surface staking issues to users and provide a simple mechanism to update staking to a new node ID in the event the prior staked node ID ceases to be valid. |
| decline_reward | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | A boolean indicating that this account has chosen to decline rewards for staking its balances. <p> This account MAY still stake its balances, but SHALL NOT receive reward payments for doing so, if this value is set, and `true`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



