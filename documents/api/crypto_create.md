## Table of Contents

- [crypto_create.proto](#crypto_create-proto)
    - [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody)
  



<a name="crypto_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_create.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoCreateTransactionBody"></a>

### CryptoCreateTransactionBody
Create a new account. After the account is created, the AccountID for it is in the receipt. It
can also be retrieved with a GetByKey query. Threshold values can be defined, and records are
generated and stored for 25 hours for any transfer that exceeds the thresholds. This account is
charged for each record generated, so the thresholds are useful for limiting record generation to
happen only for large transactions.

The Key field is the key used to sign transactions for this account. If the account has
receiverSigRequired set to true, then all cryptocurrency transfers must be signed by this
account's key, both for transfers in and out. If it is false, then only transfers out have to be
signed by it. When the account is created, the payer account is charged enough hbars so that the
new account will not expire for the next autoRenewPeriod seconds. When it reaches the expiration
time, the new account will then be automatically charged to renew for another autoRenewPeriod
seconds. If it does not have enough hbars to renew for that long, then the remaining hbars are
used to extend its expiration as long as possible. If it is has a zero balance when it expires,
then it is deleted. This transaction must be signed by the payer account. If receiverSigRequired
is false, then the transaction does not have to be signed by the keys in the keys field. If it is
true, then it must be signed by them, in addition to the keys of the payer account. If the
auto_renew_account field is set, the key of the referenced account must sign.

An entity (account, file, or smart contract instance) must be created in a particular realm. If
the realmID is left null, then a new realm will be created with the given admin key. If a new
realm has a null adminKey, then anyone can create/modify/delete entities in that realm. But if an
admin key is given, then any transaction to create/modify/delete an entity in that realm must be
signed by that key, though anyone can still call functions on smart contract instances that exist
in that realm. A realm ceases to exist when everything within it has expired and no longer
exists.

The current API ignores shardID, realmID, and newRealmAdminKey, and creates everything in shard 0
and realm 0, with a null key. Future versions of the API will support multiple realms and
multiple shards.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [Key](#proto-Key) |  | The key that must sign each transfer out of the account. If receiverSigRequired is true, then it must also sign any transfer into the account. |
| initialBalance | [uint64](#uint64) |  | The initial number of tinybars to put into the account |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] ID of the account to which this account is proxy staked. If proxyAccountID is null, or is an invalid account, or is an account that isn't a node, then this account is automatically proxy staked to a node chosen by the network, but without earning payments. If the proxyAccountID account refuses to accept proxy staking , or if it is not currently running a node, then it will behave as if proxyAccountID was null. |
| sendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The threshold amount (in tinybars) for which an account record is created for any send/withdraw transaction |
| receiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The threshold amount (in tinybars) for which an account record is created for any receive/deposit transaction |
| receiverSigRequired | [bool](#bool) |  | If true, this account's key must sign any transaction depositing into this account (in addition to all withdrawals) |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The account is charged to extend its expiration date every this many seconds. If it doesn't have enough balance, it extends as long as possible. If it is empty when it expires, then it is deleted. |
| shardID | [ShardID](#proto-ShardID) |  | The shard in which this account is created |
| realmID | [RealmID](#proto-RealmID) |  | The realm in which this account is created (leave this null to create a new realm) |
| newRealmAdminKey | [Key](#proto-Key) |  | If realmID is null, then this the admin key for the new realm that will be created |
| memo | [string](#string) |  | The memo associated with the account (UTF-8 encoding max 100 bytes) |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that an Account can be implicitly associated with. Defaults to 0 and up to a maximum value of 1000. |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the account to which this account is staking. |
| staked_node_id | [int64](#int64) |  | ID of the node this account is staked to. |
| decline_reward | [bool](#bool) |  | If true, the account declines receiving a staking reward. The default value is false. |
| alias | [bytes](#bytes) |  | The bytes to be used as the account's alias. It will be the serialization of a protobuf Key message for an ED25519/ECDSA_SECP256K1 primitive key type. Currently only primitive key bytes are supported as the key for an account with an alias. ThresholdKey, KeyList, ContractID, and delegatable_contract_id are not supported.

May also be the EOA 20-byte address to create that is derived from the keccak-256 hash of a ECDSA_SECP256K1 primitive key.

A given alias can map to at most one account on the network at a time. This uniqueness will be enforced relative to aliases currently on the network at alias assignment.

If a transaction creates an account using an alias, any further crypto transfers to that alias will simply be deposited in that account, without creating anything, and with no creation fee being charged. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


