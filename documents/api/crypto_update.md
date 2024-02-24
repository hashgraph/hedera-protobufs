## Table of Contents

- [crypto_update.proto](#crypto_update-proto)
    - [CryptoUpdateTransactionBody](#proto-CryptoUpdateTransactionBody)
  



<a name="crypto_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoUpdateTransactionBody"></a>

### CryptoUpdateTransactionBody
Change properties for the given account. Any null field is ignored (left unchanged). This
transaction must be signed by the existing key for this account. If the transaction is changing
the key field, then the transaction must be signed by both the old key (from before the change)
and the new key. The old key must sign for security. The new key must sign as a safeguard to
avoid accidentally changing to an invalid key, and then having no way to recover.
If the update transaction sets the <tt>auto_renew_account</tt> field to anything other
than the sentinel <tt>0.0.0</tt>, the key of the referenced account must sign.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountIDToUpdate | [AccountID](#proto-AccountID) |  | The account ID which is being updated in this transaction |
| key | [Key](#proto-Key) |  | The new key |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] ID of the account to which this account is proxy staked. If proxyAccountID is null, or is an invalid account, or is an account that isn't a node, then this account is automatically proxy staked to a node chosen by the network, but without earning payments. If the proxyAccountID account refuses to accept proxy staking , or if it is not currently running a node, then it will behave as if proxyAccountID was null. |
| proxyFraction | [int32](#int32) |  | **Deprecated.** [Deprecated]. Payments earned from proxy staking are shared between the node and this account, with proxyFraction / 10000 going to this account |
| sendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The new threshold amount (in tinybars) for which an account record is created for any send/withdraw transaction |
| sendRecordThresholdWrapper | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | **Deprecated.** [Deprecated]. The new threshold amount (in tinybars) for which an account record is created for any send/withdraw transaction |
| receiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The new threshold amount (in tinybars) for which an account record is created for any receive/deposit transaction. |
| receiveRecordThresholdWrapper | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | **Deprecated.** [Deprecated]. The new threshold amount (in tinybars) for which an account record is created for any receive/deposit transaction. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The duration in which it will automatically extend the expiration period. If it doesn't have enough balance, it extends as long as possible. If it is empty when it expires, then it is deleted. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The new expiration time to extend to (ignored if equal to or before the current one) |
| receiverSigRequired | [bool](#bool) |  | **Deprecated.** [Deprecated] Do NOT use this field to set a false value because the server cannot distinguish from the default value. Use receiverSigRequiredWrapper field for this purpose. |
| receiverSigRequiredWrapper | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | If true, this account's key must sign any transaction depositing into this account (in addition to all withdrawals) |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, the new memo to be associated with the account (UTF-8 encoding max 100 bytes) |
| max_automatic_token_associations | [google.protobuf.Int32Value](#google-protobuf-Int32Value) |  | The maximum number of tokens that an Account can be implicitly associated with. Up to a 1000 including implicit and explicit associations. |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the new account to which this account is staking. If set to the sentinel <tt>0.0.0</tt> AccountID, this field removes this account's staked account ID. |
| staked_node_id | [int64](#int64) |  | ID of the new node this account is staked to. If set to the sentinel <tt>-1</tt>, this field removes this account's staked node ID. |
| decline_reward | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | If true, the account declines receiving a staking reward. The default value is false. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


