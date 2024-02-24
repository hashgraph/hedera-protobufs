## Table of Contents

- [contract_create.proto](#contract_create-proto)
    - [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody)
  



<a name="contract_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_create.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractCreateTransactionBody"></a>

### ContractCreateTransactionBody
Start a new smart contract instance. After the instance is created, the ContractID for it is in
the receipt, and can be retrieved by the Record or with a GetByKey query. The instance will run
the bytecode, either stored in a previously created file or in the transaction body itself for
small contracts.


The constructor will be executed using the given amount of gas, and any unspent gas will be
refunded to the paying account. Constructor inputs come from the given constructorParameters.
 - The instance will exist for autoRenewPeriod seconds. When that is reached, it will renew
   itself for another autoRenewPeriod seconds by charging its associated cryptocurrency account
   (which it creates here). If it has insufficient cryptocurrency to extend that long, it will
   extend as long as it can. If its balance is zero, the instance will be deleted.

 - A smart contract instance normally enforces rules, so "the code is law". For example, an
   ERC-20 contract prevents a transfer from being undone without a signature by the recipient of
   the transfer. This is always enforced if the contract instance was created with the adminKeys
   being null. But for some uses, it might be desirable to create something like an ERC-20
   contract that has a specific group of trusted individuals who can act as a "supreme court"
   with the ability to override the normal operation, when a sufficient number of them agree to
   do so. If adminKeys is not null, then they can sign a transaction that can change the state of
   the smart contract in arbitrary ways, such as to reverse a transaction that violates some
   standard of behavior that is not covered by the code itself. The admin keys can also be used
   to change the autoRenewPeriod, and change the adminKeys field itself. The API currently does
   not implement this ability. But it does allow the adminKeys field to be set and queried, and
   will in the future implement such admin abilities for any instance that has a non-null
   adminKeys.

 - If this constructor stores information, it is charged gas to store it. There is a fee in hbars
   to maintain that storage until the expiration time, and that fee is added as part of the
   transaction fee.

 - An entity (account, file, or smart contract instance) must be created in a particular realm.
   If the realmID is left null, then a new realm will be created with the given admin key. If a
   new realm has a null adminKey, then anyone can create/modify/delete entities in that realm.
   But if an admin key is given, then any transaction to create/modify/delete an entity in that
   realm must be signed by that key, though anyone can still call functions on smart contract
   instances that exist in that realm. A realm ceases to exist when everything within it has
   expired and no longer exists.

 - The current API ignores shardID, realmID, and newRealmAdminKey, and creates everything in
   shard 0 and realm 0, with a null key. Future versions of the API will support multiple realms
   and multiple shards.

 - The optional memo field can contain a string whose length is up to 100 bytes. That is the size
   after Unicode NFD then UTF-8 conversion. This field can be used to describe the smart contract.
   It could also be used for other purposes. One recommended purpose is to hold a hexadecimal
   string that is the SHA-384 hash of a PDF file containing a human-readable legal contract. Then,
   if the admin keys are the public keys of human arbitrators, they can use that legal document to
   guide their decisions during a binding arbitration tribunal, convened to consider any changes
   to the smart contract in the future. The memo field can only be changed using the admin keys.
   If there are no admin keys, then it cannot be changed after the smart contract is created.

<b>Signing requirements:</b> If an admin key is set, it must sign the transaction. If an
auto-renew account is set, its key must sign the transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file containing the smart contract initcode. A copy will be made and held by the contract instance, and have the same expiration time as the instance. |
| initcode | [bytes](#bytes) |  | The bytes of the smart contract initcode. This is only useful if the smart contract init is less than the hedera transaction limit. In those cases fileID must be used. |
| adminKey | [Key](#proto-Key) |  | the state of the instance and its fields can be modified arbitrarily if this key signs a transaction to modify it. If this is null, then such modifications are not possible, and there is no administrator that can override the normal operation of this smart contract instance. Note that if it is created with no admin keys, then there is no administrator to authorize changing the admin keys, so there can never be any admin keys for that instance. |
| gas | [int64](#int64) |  | gas to run the constructor |
| initialBalance | [int64](#int64) |  | initial number of tinybars to put into the cryptocurrency account associated with and owned by the smart contract |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] ID of the account to which this account is proxy staked. If proxyAccountID is null, or is an invalid account, or is an account that isn't a node, then this account is automatically proxy staked to a node chosen by the network, but without earning payments. If the proxyAccountID account refuses to accept proxy staking , or if it is not currently running a node, then it will behave as if proxyAccountID was null. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | the instance will charge its account every this many seconds to renew for this long |
| constructorParameters | [bytes](#bytes) |  | parameters to pass to the constructor |
| shardID | [ShardID](#proto-ShardID) |  | shard in which to create this |
| realmID | [RealmID](#proto-RealmID) |  | realm in which to create this (leave this null to create a new realm) |
| newRealmAdminKey | [Key](#proto-Key) |  | if realmID is null, then this the admin key for the new realm that will be created |
| memo | [string](#string) |  | the memo that was submitted as part of the contract (max 100 bytes) |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that this contract can be automatically associated with (i.e., receive air-drops from). |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | An account to charge for auto-renewal of this contract. If not set, or set to an account with zero hbar balance, the contract's own hbar balance will be used to cover auto-renewal fees. |
| staked_account_id | [AccountID](#proto-AccountID) |  | ID of the account to which this contract is staking. |
| staked_node_id | [int64](#int64) |  | ID of the node this contract is staked to. |
| decline_reward | [bool](#bool) |  | If true, the contract declines receiving a staking reward. The default value is false. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


