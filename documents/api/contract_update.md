## Table of Contents

- [contract_update.proto](#contract_update-proto)
    - [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody)
  



<a name="contract_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractUpdateTransactionBody"></a>

### ContractUpdateTransactionBody
At consensus, updates the fields of a smart contract to the given values.

If no value is given for a field, that field is left unchanged on the contract. For an immutable
smart contract (that is, a contract created without an adminKey), only the expirationTime may be
updated; setting any other field in this case will cause the transaction status to resolve to
MODIFYING_IMMUTABLE_CONTRACT.

--- Signing Requirements ---
1. Whether or not a contract has an admin key, its expiry can be extended with only the
   transaction payer's signature.
2. Updating any other field of a mutable contract requires the admin key's signature.
3. If the update transaction includes a new admin key, this new key must also sign <b>unless</b>
   it is exactly an empty <tt>KeyList</tt>. This special sentinel key removes the existing admin
   key and causes the contract to become immutable. (Other <tt>Key</tt> structures without a
   constituent <tt>Ed25519</tt> key will be rejected with <tt>INVALID_ADMIN_KEY</tt>.)
4. If the update transaction sets the AccountID auto_renew_account_id wrapper field to anything
   other than the sentinel <tt>0.0.0</tt> value, then the key of the referenced account must sign.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The id of the contract to be updated |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The new expiry of the contract, no earlier than the current expiry (resolves to EXPIRATION_REDUCTION_NOT_ALLOWED otherwise) |
| adminKey | [Key](#proto-Key) |  | The new key to control updates to the contract |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] The new id of the account to which the contract is proxy staked |
| autoRenewPeriod | [Duration](#proto-Duration) |  | If an auto-renew account is in use, the lifetime to be added by each auto-renewal. |
| fileID | [FileID](#proto-FileID) |  | **Deprecated.** This field is unused and will have no impact on the specified smart contract. |
| memo | [string](#string) |  | **Deprecated.** [Deprecated] If set with a non-zero length, the new memo to be associated with the account (UTF-8 encoding max 100 bytes) |
| memoWrapper | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, the new memo to be associated with the account (UTF-8 encoding max 100 bytes) |
| max_automatic_token_associations | [google.protobuf.Int32Value](#google-protobuf-Int32Value) |  | If set, the new maximum number of tokens that this contract can be automatically associated with (i.e., receive air-drops from). |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | If set to the sentinel <tt>0.0.0</tt> AccountID, this field removes the contract's auto-renew account. Otherwise it updates the contract's auto-renew account to the referenced account. |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the new account to which this contract is staking. If set to the sentinel <tt>0.0.0</tt> AccountID, this field removes the contract's staked account ID. |
| staked_node_id | [int64](#int64) |  | ID of the new node this contract is staked to. If set to the sentinel <tt>-1</tt>, this field removes the contract's staked node ID. |
| decline_reward | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | If true, the contract declines receiving a staking reward. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


