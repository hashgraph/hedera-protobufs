## Table of Contents

- [contract_update.proto](#contract_update-proto)
    - [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody)
  



<a name="contract_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_update.proto
# Contract Update
Modify a smart contract. Any change other than updating the expiration time
requires that the contract be modifiable (has a valid `adminKey`) and that
the transaction be signed by the `adminKey`

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ContractUpdateTransactionBody"></a>

### ContractUpdateTransactionBody
Modify the current state of a smart contract.

### Requirements
- The `adminKey` MUST sign all contract update transactions except one
  that only updates the `expirationTime`.
- A transaction that modifies any field other than `expirationTime` for
  a contract without a valid `adminKey` set SHALL fail with response
  code `MODIFYING_IMMUTABLE_CONTRACT`.
- Fields set to non-default values in this transaction SHALL be updated on
  success. Fields not set to non-default values SHALL NOT be
  updated on success.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The contact ID that identifies the smart contract to be updated.<br/> This field MUST be set, and MUST NOT be a default ID (`0.0.0`). |
| expirationTime | [Timestamp](#proto-Timestamp) |  | If set, modify the time at which this contract will expire.<br/> An expired contract requires a rent payment to "renew" the contract. A transaction to update this field is how that rent payment is made. <p> This value MUST NOT be less than the current `expirationTime` of the contract. If this value is earlier than the current value, the transaction SHALL fail with response code `EXPIRATION_REDUCTION_NOT_ALLOWED`. |
| adminKey | [Key](#proto-Key) |  | If set, modify the key that authorizes updates to the contract. <p> If this field is set to a valid Key, this key and the previously set key MUST both sign this transaction.<br/> If this value is an empty `KeyList`, the prior key MUST sign this transaction, and the smart contract SHALL be immutable after this transaction completes, except for expiration and renewal.<br/> If this value is not an empty `KeyList`, but does not contain any cryptographic keys, or is otherwise malformed, this transaction SHALL fail with response code `INVALID_ADMIN_KEY`. |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** Replaced with `staked_id` alternatives. This field is unused and SHALL NOT modify the contract state.<br/> The id of an account to which the contract is proxy staked |
| autoRenewPeriod | [Duration](#proto-Duration) |  | If set, modify the duration added to expiration time by each auto-renewal to this value. |
| fileID | [FileID](#proto-FileID) |  | **Deprecated.** This field is unused and SHALL NOT modify the contract state.<br/> Previously, an ID of a file containing the bytecode of the Solidity transaction that created this contract. |
| memo | [string](#string) |  | **Deprecated.** This value could not accurately distinguish unset or deliberately empty. memoWrapper should be used instead.<br/> |
| memoWrapper | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, modify the short memo for this smart contract.<br/> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| max_automatic_token_associations | [google.protobuf.Int32Value](#google-protobuf-Int32Value) |  | If set, modify the maximum number of tokens that can be auto-associated with the contract. <p> If this is set and less than or equal to `used_auto_associations`, or 0, then this contract MUST manually associate with a token before transacting in that token.<br/> This value MAY also be `-1` to indicate no limit.<br/> This value MUST NOT be less than `-1`. |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | If set, modify the account, in the same shard and realm as this smart contract, that has agreed to allow the network to use its balance, when needed, to automatically extend this contract's expiration time. <p> If this field is set to a non-default value, that Account MUST sign this transaction.<br/> If this field is set to a default AccountID value (`0.0.0`), any pre-existing `auto_renew_account_id` value SHALL be removed on success. |
| staked_account_id | [AccountID](#proto-AccountID) |  | An account identifier.<br/> A staked account acts as a proxy, and this contract effectively nominates the same node as the identified account. <p> If set, modify this smart contract such that it SHALL stake its HBAR to the same node as the identified account.<br/> If this field is set to a default AccountID value (`0.0.0`), any pre-existing `staked_account_id` value SHALL be removed on success. |
| staked_node_id | [int64](#int64) |  | A node identifier.<br/> A staked node identifier indicates the consensus node that this account nominates for staking. <p> If set, modify this smart contract such that it SHALL stake its HBAR to this node. If set to a the value `-1` any pre-existing `staked_node_id` value SHALL be removed on success. <p> <blockquote>Note: node IDs do fluctuate as node operators change. Most contracts are immutable, and a contract staking to an invalid node ID SHALL NOT participate in staking. Immutable contracts may find it more reliable to use a proxy account for staking (via `staked_account_id`) to enable updating the _effective_ staking node ID when necessary through updating the proxy account.</blockquote> |
| decline_reward | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | A flag indicating if staking rewards are declined.<br/> If set, modify the flag indicating if this contract declines to accept rewards for staking its HBAR to secure the network. <p> If set to true, this smart contract SHALL NOT receive any reward for staking its HBAR balance to help secure the network, regardless of staking configuration, but MAY stake HBAR to support the network without reward. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



