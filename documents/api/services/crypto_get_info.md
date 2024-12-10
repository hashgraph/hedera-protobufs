## Table of Contents

- [crypto_get_info.proto](#crypto_get_info-proto)
    - [CryptoGetInfoQuery](#proto-CryptoGetInfoQuery)
    - [CryptoGetInfoResponse](#proto-CryptoGetInfoResponse)
    - [CryptoGetInfoResponse.AccountInfo](#proto-CryptoGetInfoResponse-AccountInfo)
  



<a name="crypto_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_info.proto
# Get Account Information
A standard query to inspect the full detail of an account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoGetInfoQuery"></a>

### CryptoGetInfoQuery
A query to read information for an account.

The returned information SHALL include balance.<br/>
The returned information SHALL NOT include allowances.<br/>
The returned information SHALL NOT include token relationships.<br/>
The returned information SHALL NOT include account records.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The account ID for which information is requested |






<a name="proto-CryptoGetInfoResponse"></a>

### CryptoGetInfoResponse
Response when the client sends the node CryptoGetInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| accountInfo | [CryptoGetInfoResponse.AccountInfo](#proto-CryptoGetInfoResponse-AccountInfo) |  | Details of the account. <p> A state proof MAY be generated for this field. |






<a name="proto-CryptoGetInfoResponse-AccountInfo"></a>

### CryptoGetInfoResponse.AccountInfo
Information describing A single Account in the Hedera distributed ledger.

#### Attributes
Each Account may have a unique three-part identifier, a Key, and one or
more token balances. Accounts also have an alias, which has multiple
forms, and may be set automatically. Several additional items are
associated with the Account to enable full functionality.

#### Expiration
Accounts, as most items in the network, have an expiration time, recorded
as a `Timestamp`, and must be "renewed" for a small fee at expiration.
This helps to reduce the amount of inactive accounts retained in state.
Another account may be designated to pay any renewal fees and
automatically renew the account for (by default) 30-90 days at a time as
a means to optionally ensure important accounts remain active.

### Staking
Accounts may participate in securing the network by "staking" the account
balances to a particular network node, and receive a portion of network
fees as a reward. An account may optionally decline these rewards but
still stake its balances.

#### Transfer Restrictions
An account may optionally require that inbound transfer transactions be
signed by that account as receiver (in addition to any other signatures
required, including sender).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | a unique identifier for this account. <p> An account identifier, when assigned to this field, SHALL be of the form `shard.realm.number`. |
| contractAccountID | [string](#string) |  | A Solidity ID. <p> This SHALL be populated if this account is a smart contract, and SHALL NOT be populated otherwise.<br/> This SHALL be formatted as a string according to Solidity ID standards. |
| deleted | [bool](#bool) |  | A boolean indicating that this account is deleted. <p> Any transaction involving a deleted account SHALL fail. |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** Replaced by StakingInfo.<br/> ID of the account to which this account is staking its balances. If this account is not currently staking its balances, then this field, if set, SHALL be the sentinel value of `0.0.0`. |
| proxyReceived | [int64](#int64) |  | The total amount of tinybar proxy staked to this account. |
| key | [Key](#proto-Key) |  | The key to be used to sign transactions from this account, if any. <p> This key SHALL NOT be set for hollow accounts until the account is finalized.<br/> This key SHALL be set on all other accounts, except for certain immutable accounts (0.0.800 and 0.0.801) necessary for network function and otherwise secured by the governing council. |
| balance | [uint64](#uint64) |  | The HBAR balance of this account, in tinybar (10<sup>-8</sup> HBAR). <p> This value SHALL always be a whole number. |
| generateSendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Obsolete and unused.<br/> The threshold amount, in tinybars, at which a record was created for any transaction that decreased the balance of this account. |
| generateReceiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** Obsolete and unused.<br/> The threshold amount, in tinybars, at which a record was created for any transaction that increased the balance of this account. |
| receiverSigRequired | [bool](#bool) |  | A boolean indicating that the account requires a receiver signature for inbound token transfer transactions. <p> If this value is `true` then a transaction to transfer tokens to this account SHALL NOT succeed unless this account has signed the transfer transaction. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The current expiration time for this account. <p> This account SHALL be due standard renewal fees when the network consensus time exceeds this time.<br/> If rent and expiration are enabled for the network, and automatic renewal is enabled for this account, renewal fees SHALL be charged after this time, and, if charged, the expiration time SHALL be extended for another renewal period.<br/> This account MAY be expired and removed from state at any point after this time if not renewed.<br/> An account holder MAY extend this time by submitting an account update transaction to modify expiration time, subject to the current maximum expiration time for the network. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | A duration to extend this account's expiration. <p> The network SHALL extend the account's expiration by this duration, if funds are available, upon automatic renewal.<br/> This SHALL NOT apply if the account is already deleted upon expiration.<br/> If this is not provided in an allowed range on account creation, the transaction SHALL fail with INVALID_AUTO_RENEWAL_PERIOD. The default values for the minimum period and maximum period are currently 30 days and 90 days, respectively. |
| liveHashes | [LiveHash](#proto-LiveHash) | repeated | All of the livehashes attached to the account (each of which is a hash along with the keys that authorized it and can delete it) <blockquote>REVIEW NOTE<blockquote> Should this be deprecated? Live hashes do not appear to be available any longer.</blockquote></blockquote> |
| tokenRelationships | [TokenRelationship](#proto-TokenRelationship) | repeated | **Deprecated.** As of `HIP-367`, which enabled unlimited token associations, the potential scale for this value requires that users consult a mirror node for this information. |
| memo | [string](#string) |  | A short description of this account. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| ownedNfts | [int64](#int64) |  | The total number of non-fungible/unique tokens owned by this account. |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that can be auto-associated with the account. <p> If this is less than or equal to `used_auto_associations` (or 0), then this account MUST manually associate with a token before transacting in that token.<br/> Following HIP-904 This value may also be `-1` to indicate no limit.<br/> This value MUST NOT be less than `-1`. |
| alias | [bytes](#bytes) |  | An account EVM alias.<br/> This is a value used in some contexts to reference an account when the tripartite account identifier is not available. <p> This field, when set to a non-default value, is immutable and SHALL NOT be changed. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response.<br/> This is originally defined in `HIP-198` and depends on network configuration.<br/> The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |
| ethereum_nonce | [int64](#int64) |  | The ethereum transaction nonce associated with this account. |
| staking_info | [StakingInfo](#proto-StakingInfo) |  | Staking information for this account. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



