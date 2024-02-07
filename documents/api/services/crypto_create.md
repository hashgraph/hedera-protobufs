## Table of Contents

- [crypto_create.proto](#crypto_create-proto)
    - [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody)
  



<a name="crypto_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_create.proto
# Crypto Create
Messages to create a new end-user account within the distributed ledger.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoCreateTransactionBody"></a>

### CryptoCreateTransactionBody
Create a new account.

If the auto_renew_account field is set, the key of the referenced account
MUST sign this transaction.<br/>
Current limitations REQUIRE that `shardID` and `realmID` both MUST be `0`.
This is expected to change in the future.

### Block Stream Effects
The account identifier for the newly created account SHALL be in the
transaction receipt.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [Key](#proto-Key) |  | The identifying key for this account. This key represents the account owner, and is required for most actions involving this account that do not modify the account itself. This key may also identify the account for smart contracts. <p> This field is REQUIRED. This `Key` MUST NOT be an empty `KeyList` and MUST contain at least one "primitive" (i.e. cryptographic) key value. |
| initialBalance | [uint64](#uint64) |  | An amount, in tinybar, to deposit to the newly created account. <p> The deposited amount SHALL be debited to the "payer" account for this transaction. |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** Use `staked_id` instead.<br/> An account identifier for a staking proxy. |
| sendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> An amount below which record stream records would not be created for a transaction that reduces this account balance. |
| receiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Removed prior to the first available history, and may be related to an early design dead-end.<br/> An amount below which record stream records would not be created for a transaction that increases this account balance. |
| receiverSigRequired | [bool](#bool) |  | A flag indicating the account holder must authorize all incoming token transfers. <p> If this flag is set then any transaction that would result in adding hbar or other tokens to this account balance MUST be signed by the identifying key of this account (that is, the `key` field).<br/> If this flag is set, then the account key (`key` field) MUST sign this create transaction, in addition to the transaction payer. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The duration between account automatic renewals.<br/> All entities in state may be charged "rent" occasionally (typically every 90 days) to prevent unnecessary growth of the ledger. This value sets the interval between such events for this account. <p> If the account balance (in HBAR) is insufficient to pay the full renewal fee, the entire HBAR balance SHALL be consumed and the expiration for the account SHALL be extended as far as the available balance can support.<br/> If the account HBAR balance is `0` when the account must be renewed, then the account SHALL be deleted, and subsequently removed from state. |
| shardID | [ShardID](#proto-ShardID) |  | The shard in which this account is created <p> Currently, this MUST be `0`.<br/> If the desired shard is `0`, this SHOULD NOT be set. |
| realmID | [RealmID](#proto-RealmID) |  | The realm in which this account is created. <p> The shard number for this realm MUST match the value in `shardID`.<br/> Currently, this MUST be `0` for both fields.<br/> If the desired realm is `0.0`, this SHOULD NOT be set. |
| newRealmAdminKey | [Key](#proto-Key) |  | **Deprecated.** If realmID is null, then this the admin key for the new realm that will be created <blockquote>Should this be deprecated?<blockquote> The "create realm" was never enabled, and probably should not be possible on account creation. </blockquote></blockquote> Added deprecated tag 2024-05 based on above. |
| memo | [string](#string) |  | A short description of this Account. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| max_automatic_token_associations | [int32](#int32) |  | A maximum number of tokens that can be auto-associated with this account.<br/> By default this value is 0 for all accounts except for automatically created accounts (i.e smart contracts) which default to -1. <p> If this value is `0`, then this account MUST manually associate to a token before holding or transacting in that token.<br/> This value MAY also be `-1` to indicate no limit.<br/> This value MUST NOT be less than `-1`. |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the account to which this account is staking its balances. <p> If this account is not currently staking its balances, then this field, if set, MUST be the sentinel value of `0.0.0`. |
| staked_node_id | [int64](#int64) |  | ID of the node this account is staked to. <p> If this account is not currently staking its balances, then this field, if set, SHALL be the sentinel value of `-1`.<br/> Wallet software SHOULD surface staking issues to users and provide a simple mechanism to update staking to a new node ID in the event the prior staked node ID ceases to be valid. |
| decline_reward | [bool](#bool) |  | A boolean indicating that this account has chosen to decline rewards for staking its balances. <p> This account MAY still stake its balances, but SHALL NOT receive reward payments for doing so, if this value is set. |
| alias | [bytes](#bytes) |  | Bytes to be used as the account's alias. <p> This value, if set, MUST be one of the following values.<br/> <ul> <li>The 32-byte serialized form of the ED25519 account key.</li> <li>The 33-byte _compressed_ serialized form of the ECDSA(secp256k1) account key.</li> <li>The 20-byte EVM address derived from a keccak-256 hash of the ECDSA(secp256k1) account key</li> </ul> All aliases within the network MUST be unique. If this value matches an existing account alias, this `create` transaction SHALL fail.<br/> If an account exists with a particular alias value, any transaction to transfer value _to_ that alias SHALL deposit the transferred value in the existing account, and SHALL NOT assess an account creation fee.<br/> Once set, an account alias is immutable and MUST NOT be changed. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



