## Table of Contents

- [contract_create.proto](#contract_create-proto)
    - [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody)
  



<a name="contract_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_create.proto
# Smart Contract Create

Create a new smart contract.

## General Comments
 - A smart contract normally enforces rules, so "the code is law".<br/>
   For example, an ERC-20 contract prevents a transfer from being undone without a signature by
   the recipient of the transfer. This characteristic is generally true if the contract instance
   was created without a value for the `adminKey` field.
   For some uses, however, it may be desirable to create something like an ERC-20 contract that
   has a specific group of trusted individuals who can act as a "supreme court" with the ability
   to override the normal operation, when a sufficient number of them agree to do so.
   If `adminKey` is set to a valid Key (which MAY be complex), then a transaction that can change
   the state of the smart contract in arbitrary ways MAY be signed with enough keys to activate
   that Key. Such transactions might reverse a transaction, change the code to close an
   unexpected loophole, remove an exploit, or adjust outputs in ways not covered by the code
   itself. The admin key MAY also be used to change the autoRenewPeriod, and change the
   adminKey field itself (for example, to remove that key after a suitable testing period).
   The API currently does not implement all relevant capabilities. But it does allow the
   `adminKey` field to be set and queried, and MAY implement further administrative capability
   in future releases.
 - The current API ignores shardID, realmID, and newRealmAdminKey, and creates everything in
   shard 0 and realm 0. Future versions of the system MAY support additional shards and realms.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractCreateTransactionBody"></a>

### ContractCreateTransactionBody
Create a new smart contract.<br/>
If this transaction succeeds, the `ContractID` for the new smart contract SHALL be set in the
transaction receipt.<br/>
The contract is defined by the initial bytecode (or `initcode`). The `initcode` SHALL be stored
either in a previously created file, or in the transaction body itself for very small contracts.

As part of contract creation, the constructor defined for the new smart contract SHALL run
with the parameters provided in the `constructorParameters` field.<br/>
The gas to "power" that constructor MUST be provided via the `gas` field, and SHALL be charged
to the payer for this transaction.</br>
If the contract _constructor_ stores information, it is charged gas for that storage.
There is a separate fee in HBAR to maintain that storage until the expiration, and that fee
SHALL be added to this transaction as part of the _transaction fee_, rather than gas.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The source for the smart contract EVM bytecode.<br/> The file containing the smart contract initcode. A copy of the contents SHALL be made and held as `bytes` in smart contract state.<br/> The contract bytecode is limited in size only by the network file size limit. |
| initcode | [bytes](#bytes) |  | The source for the smart contract EVM bytecode.<br/> The bytes of the smart contract initcode. A copy of the contents SHALL be made and held as `bytes` in smart contract state.<br/> This value is limited in length by the network transaction size limit. This entire transaction, including all fields and signatures, MUST be less than the network transaction size limit. |
| adminKey | [Key](#proto-Key) |  | Access control for modification of the smart contract after it is created.<br/> If this field is set, that key MUST sign this transaction.<br/> If this field is set, that key MUST sign each future transaction to update or delete the contract.<br/> An updateContract transaction that _only_ extends the topic expirationTime (a "manual renewal" transaction) SHALL NOT require admin key signature. <p> A contract without an admin key SHALL be immutable, except for expiration and renewal. |
| gas | [int64](#int64) |  | A maximum limit to the amount of gas to use for the constructor call.<br/> The network SHALL charge the greater of the following, but SHALL NOT charge more than the value of this field. <ol> <li>The actual gas consumed by the smart contract constructor call.</li> <li>`80%` of this value.</li> </ol> The `80%` factor encourages reasonable estimation, while allowing for some overage to ensure successful execution. |
| initialBalance | [int64](#int64) |  | The amount of HBAR to use as an initial balance for the account representing the new smart contract.<br/> This value is presented in tinybar (10<sup><strong>-</strong>8</sup> HBAR).<br/> The HBAR provided here will be withdrawn from the payer account that signed this transaction. |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** Proxy account staking is handled via `staked_id`.<br/> Former field to designate a proxy account for HBAR staking. This field MUST NOT be set. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The initial lifetime, in seconds, for the smart contract, and the number of seconds for which the smart contract will be automatically renewed upon expiration.<br/> This value MUST be set.<br/> This value MUST be greater than the configured MIN_AUTORENEW_PERIOD.<br/> This value MUST be less than the configured MAX_AUTORENEW_PERIOD.<br/> |
| constructorParameters | [bytes](#bytes) |  | An array of bytes containing the EVM-encoded parameters to pass to the smart contract constructor defined in the smart contract init code provided. |
| shardID | [ShardID](#proto-ShardID) |  | <blockquote>Review Question<br/> <blockquote>Should this be deprecated?<br/> It's never been used and probably never should be used...<br/> Shard should be determined by the node the transaction is submitted to. </blockquote></blockquote> <p> The shard in which to create the new smart contract.<br/> This value is currently ignored. |
| realmID | [RealmID](#proto-RealmID) |  | <blockquote>Review Question<br/> <blockquote>Should this be deprecated?<br/> It's never been used and probably never should be used...<br/> Realm should be determined by node and network parameters.</blockquote></blockquote> <p> The shard/realm in which to create the new smart contract.<br/> This value is currently ignored. |
| newRealmAdminKey | [Key](#proto-Key) |  | <blockquote>Review Question<br/> <blockquote>Should this be deprecated?<br/> It's never been used and probably never should be used...<br/> If a realm is used, it must already exist; we shouldn't be creating it without a separate transaction.</blockquote></blockquote> <p> This was intended to provide an admin key for any new realm created during the creation of the smart contract. This value is currently ignored. a new realm SHALL NOT be created, regardless of the value of `realmID`. |
| memo | [string](#string) |  | A short memo for this smart contract.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that can be auto-associated with this smart contract.<br/> If this is less than or equal to `used_auto_associations` (or 0), then this contract MUST manually associate with a token before transacting in that token.<br/> Following HIP-904 This value may also be `-1` to indicate no limit.<br/> This value MUST NOT be less than `-1`. |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | The id of an account, in the same shard and realm as this smart contract, that has signed this transaction, allowing the network to use its balance, when needed, to automatically extend this contract's expiration time.<br/> If this field is set, that key MUST sign this transaction.<br/> If this field is set, then the network SHALL deduct the necessary fees from the designated auto renew account, if that account has sufficient balance. If the auto renew account does not have sufficient balance, then the fees for contract renewal SHALL be deducted from the HBAR balance held by the smart contract.<br/> If this field is not set, then all renewal fees SHALL be deducted from the HBAR balance held by this contract. |
| staked_account_id | [AccountID](#proto-AccountID) |  | An account ID.</br> This smart contract SHALL stake its HBAR via this account as proxy. |
| staked_node_id | [int64](#int64) |  | The ID of a network node.<br/> This smart contract SHALL stake its HBAR to this node. <p> <blockquote>Note: node IDs do fluctuate as node operators change. Most contracts are immutable, and a contract staking to an invalid node ID SHALL NOT participate in staking. Immutable contracts MAY find it more reliable to use a proxy account for staking (via `staked_account_id`) to enable updating the _effective_ staking node ID when necessary through updating the proxy account.</blockquote> |
| decline_reward | [bool](#bool) |  | A flag indicating that this smart contract declines to receive any reward for staking its HBAR balance to help secure the network.<br> If set to true, this smart contract SHALL NOT receive any reward for staking its HBAR balance to help secure the network, regardless of staking configuration, but MAY stake HBAR to support the network without reward. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


