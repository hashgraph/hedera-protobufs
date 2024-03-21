## Table of Contents

- [basic_types.proto](#basic_types-proto)
    - [AccountAmount](#proto-AccountAmount)
    - [AccountID](#proto-AccountID)
    - [ContractID](#proto-ContractID)
    - [CurrentAndNextFeeSchedule](#proto-CurrentAndNextFeeSchedule)
    - [FeeComponents](#proto-FeeComponents)
    - [FeeData](#proto-FeeData)
    - [FeeSchedule](#proto-FeeSchedule)
    - [FileID](#proto-FileID)
    - [Fraction](#proto-Fraction)
    - [Key](#proto-Key)
    - [KeyList](#proto-KeyList)
    - [NftID](#proto-NftID)
    - [NftTransfer](#proto-NftTransfer)
    - [NodeAddress](#proto-NodeAddress)
    - [NodeAddressBook](#proto-NodeAddressBook)
    - [RealmID](#proto-RealmID)
    - [ScheduleID](#proto-ScheduleID)
    - [SemanticVersion](#proto-SemanticVersion)
    - [ServiceEndpoint](#proto-ServiceEndpoint)
    - [ServicesConfigurationList](#proto-ServicesConfigurationList)
    - [Setting](#proto-Setting)
    - [ShardID](#proto-ShardID)
    - [Signature](#proto-Signature)
    - [SignatureList](#proto-SignatureList)
    - [SignatureMap](#proto-SignatureMap)
    - [SignaturePair](#proto-SignaturePair)
    - [StakingInfo](#proto-StakingInfo)
    - [ThresholdKey](#proto-ThresholdKey)
    - [ThresholdSignature](#proto-ThresholdSignature)
    - [TokenAssociation](#proto-TokenAssociation)
    - [TokenBalance](#proto-TokenBalance)
    - [TokenBalances](#proto-TokenBalances)
    - [TokenID](#proto-TokenID)
    - [TokenRelationship](#proto-TokenRelationship)
    - [TokenTransferList](#proto-TokenTransferList)
    - [TopicID](#proto-TopicID)
    - [TransactionFeeSchedule](#proto-TransactionFeeSchedule)
    - [TransactionID](#proto-TransactionID)
    - [TransferList](#proto-TransferList)
  
    - [HederaFunctionality](#proto-HederaFunctionality)
    - [SubType](#proto-SubType)
    - [TokenFreezeStatus](#proto-TokenFreezeStatus)
    - [TokenKycStatus](#proto-TokenKycStatus)
    - [TokenPauseStatus](#proto-TokenPauseStatus)
    - [TokenSupplyType](#proto-TokenSupplyType)
    - [TokenType](#proto-TokenType)
  



<a name="basic_types-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## basic_types.proto
# Basic Types
Fundamental message types used across transactions and state as field types.

### Requirements for Entity ID values
Most entities in the network are identified by a multi-part ID. These ID values consist of
a shard, a realm, and an entity identifier.

Shard, Realm, and Entity Number are all whole numbers.

A Shard SHALL be globally unique.

A Realm MAY be reused between shards, but SHALL be unique within a shard.

An Entity Number MAY be reused between shards and realms, but SHALL be unique within a realm.

Every object (e.g. account, file, token, etc...) SHALL be scoped to exactly one realm and shard.
Thus a File has a FileID, a numeric triplet, such as 0.0.2 for shard 0, realm 0, entity 2.

ID values SHOULD use an Entity Number as the third component of the ID.
Some, however, MAY use alternative or composite values for the Entity portion of the
three part ID. Any such alternative or composite value MUST be unique within that realm.

The entity portion of the ID, regardless of type, MUST be unique within that realm and MAY be
globally unique.

The triplet of shard.realm.entity MUST be globally unique, even across different ID types.

Each realm SHALL maintain a single counter for entity numbers, so if there is an ID
with value 0.1.2, then there MUST NOT be another ID with value 0.1.2 for any other object.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-AccountAmount"></a>

### AccountAmount
An account, and the amount that it sends or receives during a token transfer.

This message is only relevant to fungible token transfers. Non-fungible (NFT) token
transfers MUST use the NftTransfer message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID that will send or receive token(s). |
| amount | [sint64](#sint64) |  | The amount to send (negative) or receive (positive).<br/> This amount is denominated in the smallest unit of the relevant token.<br/> For HBAR this is tinybar (10<sup>-8</sup> HBAR).<br/> For other fungible tokens this depends on the value of `decimals` for that token. |
| is_approval | [bool](#bool) |  | If true then the transfer is expected to be an approved allowance and the accountID SHALL be the owner that previously approved the allowance.<br/> The default is false (unset). |






<a name="proto-AccountID"></a>

### AccountID
The ID for a cryptocurrency account.

An account ID is of the form `shard.realm.[number|alias]`.<br/>
The <strong>ID</strong> will generally use the alias value when transferring HBAR to a public key
before the account for that key is created, when only the alias value is known, or in some smart
contracts that use the EVM address style alias to reference Accounts.

When the account entry is completed, the alias SHALL be stored separately in the Account record,
and the ID in the Account SHALL use the `accountNum` form.
---
There is considerable complexity with `alias` (aka `evm_address`) for Accounts.
Much of this comes from the existence of a "hidden" alias for almost all accounts, and the
reuse of the alias field for both EVM reference and "automatic" account creation.

For the purposes of this specification, we will use the following terms for clarity.<p>

  - `key_alias` is the account public key as a protobuf serialized message and used for
    auto-creation and subsequent lookup. This is only valid if the account key is a
    single `primitive` key, either Ed25519 or ECDSA_SECP256K1.
  - `evm_address` exists for every account and is one of
     - `contract_address`, which is the 20 byte EVM contract address per EIP-1014
     - `evm_key_address`, which is the keccak-256 hash of a ECDSA_SECP256K1 `primitive` key.
        - This is for accounts lazy-created from EVM public keys, when the corresponding
          ECDSA_SECP256K1 public key is presented in a transaction signed by the
          private key for that public key, the account is created that key assigned, and
          the protobuf-serialized form is set as the account alias.
     - `long_zero`, is a synthetic 20 byte address inferred for "normally" created
       accounts. It is constructed from the "standard" AccountID as follows.
        - 4 byte big-endian shard number
        - 8 byte big-endian realm number
        - 8 byte big-endian entity number<br/>

The `alias` field in the `Account` message SHALL contain one of four values for any given
account.<br>

  - The `key_alias`, if the account was created by transferring HBAR to the account
    referenced by `key_alias`.
  - The `evm_key_address` if the account was created from an EVM public key
  - The `contract_address` if the account belongs to an EVM contract
  - Not-Set/null/Bytes.EMPTY (collectively `null`) if the account was created normally<br/>

If the `alias` field of an `Account` is any form of `null`, then the account MAY be
referenced by `alias` in an `AccountID` by using the `long_zero` address for the account.<br/>
This "hidden default" alias SHALL NOT be stored, but is synthesized by the node software as
needed, and may be synthesized by an EVM contract or client software as well.

>> Note
>> The use and meaning of `alias` is expected to change significantly as a result of HIP-631.

An `AccountID` in a transaction MAY reference an `Account` with `shard.realm.alias`.<br/>
If the account `alias` field is set for an Account, that value SHALL be the account alias.<br/>
If the account `alias` field is not set for an Account, the `long_zero` alias
SHALL be the account alias.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |
| realmNum | [int64](#int64) |  | A whole number realm number |
| accountNum | [int64](#int64) |  | A whole number account number, unique within its realm and shard |
| alias | [bytes](#bytes) |  | Alias is a value used in some contexts to reference an account when account number is not available. |






<a name="proto-ContractID"></a>

### ContractID
The identifier for a smart contract within the network


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |
| realmNum | [int64](#int64) |  | A whole number realm number |
| contractNum | [int64](#int64) |  | A whole number contract number, unique within its realm and shard |
| evm_address | [bytes](#bytes) |  | A 20-byte EVM address of the contract to call. <p> Every contract has an EVM address determined by its `shard.realm.num` id. This address is as follows: <ul> <li>4 byte big-endian shard number</li> <li>8 byte big-endian realm number</li> <li>8 byte big-endian contract number</li> </ul> This address is not stored in state, but is computed when needed. <p> Contracts created via CREATE2 have an <b>additional, primary address</b> that is derived from the <a href="https://eips.ethereum.org/EIPS/eip-1014">EIP-1014</a> specification, and does not have a simple relation to a `shard.realm.num` id. <p> (Note that CREATE2 contracts MAY also be referenced by the three-part EVM address described above.) |






<a name="proto-CurrentAndNextFeeSchedule"></a>

### CurrentAndNextFeeSchedule
The "current" fee schedule and the "next" fee schedule.

The current fee schedule is the schedule to apply to the current transaction.<br/>
The next fee schedule is the schedule that will apply after the current schedule expires.<br/>
We store both to avoid a condition where transactions are processed very near the time when a
fee schedule expires and it might be indeterminate which fees to apply. With both current and
next fee schedule the network can deterministically apply the correct fee schedule based on
consensus timestamp for each transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| currentFeeSchedule | [FeeSchedule](#proto-FeeSchedule) |  | Current unexpired fee schedule. |
| nextFeeSchedule | [FeeSchedule](#proto-FeeSchedule) |  | Next fee schedule to use when current expires. |






<a name="proto-FeeComponents"></a>

### FeeComponents
A set of values the nodes use in determining transaction and query fees, and constants involved
in fee calculations. Nodes multiply the amount of "resources" allocated to a transaction or
query by the corresponding price to calculate the appropriate fee. Units are one-thousandth of a
`tinyCent`. The "resource" allocations are estimated based on transaction characteristics and
current network state, and may be further adjusted based on network load and congestion.

This is used, in different contexts, for the cost _factors_ used to calculate charged amounts,
for the resource accumulation, and for actual amounts to be charged.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| min | [int64](#int64) |  | Minimum fee, the calculated fee must be greater than this value |
| max | [int64](#int64) |  | Maximum fee, the calculated fee must be less than this value |
| constant | [int64](#int64) |  | Constant value. A baseline constant contribution to total fee. |
| bpt | [int64](#int64) |  | Bandwidth: "bytes per transaction".<br/> The fee for bandwidth consumed by a transaction, measured in bytes |
| vpt | [int64](#int64) |  | Signatures: "validations per transaction".<br/> The fee for signature verifications required by a transaction |
| rbh | [int64](#int64) |  | Memory: "RAM byte-hours".<br/> The fee for RAM required to process a transaction, measured in byte-hours |
| sbh | [int64](#int64) |  | Disk: "storage byte-hours".<br/> The fee for storage required by a transaction, measured in byte-hours |
| gas | [int64](#int64) |  | Compute: Ethereum term for a derivative EVM compute resource.<br/> The fee of computation for a smart contract transaction. The value of gas is set by a conversion rate, and is regularly updated to reflect reasonable and customary costs. |
| tv | [int64](#int64) |  | Ad valorem: "transferred value".<br/> The fee for HBAR transferred by a transaction. |
| bpr | [int64](#int64) |  | Response memory: "bytes per response".<br/> The fee for data retrieved from memory to deliver a response, measured in bytes |
| sbpr | [int64](#int64) |  | Response disk: "storage bytes per response".<br/> The fee for data retrieved from disk to deliver a response, measured in bytes |






<a name="proto-FeeData"></a>

### FeeData
The total fee amounts charged for a transaction. Total fees are composed of three sets of
components.<br/>

- Node data, components that compensate the specific node that submitted the transaction.
- Network data, components that compensate the Hedera network for gossiping the transaction and
  determining the consensus timestamp.
- Service data, components that compensate the Hedera network for the ongoing maintenance
  and operation of the network, as well as ongoing development of network services.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nodedata | [FeeComponents](#proto-FeeComponents) |  | Fee components to be paid to the submitting node. |
| networkdata | [FeeComponents](#proto-FeeComponents) |  | Fee components to be paid to the network for bringing a transaction to consensus. |
| servicedata | [FeeComponents](#proto-FeeComponents) |  | Fee components to be paid to the network for providing the immediate and ongoing services associated with executing the transaction, maintaining the network, and developing the network software. |
| subType | [SubType](#proto-SubType) |  | SubType distinguishing between different types of FeeData that may apply to the same base transaction type (associated with an HederaFunctionality). |






<a name="proto-FeeSchedule"></a>

### FeeSchedule
A set of fee schedules covering all transaction types and query types, along with a specific
time at which this fee schedule will expire.

Nodes use the most recent unexpired fee schedule to determine the fees for all transactions
based on various resource components imputed to each transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transactionFeeSchedule | [TransactionFeeSchedule](#proto-TransactionFeeSchedule) | repeated | Sets of price coefficients for various transaction or query types. |
| expiryTime | [TimestampSeconds](#proto-TimestampSeconds) |  | The time, in seconds since the `epoch` when this fee schedule will expire.<br/> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |






<a name="proto-FileID"></a>

### FileID
Identifier for a File within the network


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |
| realmNum | [int64](#int64) |  | A whole number realm number |
| fileNum | [int64](#int64) |  | A whole number File number, unique within its realm and shard |






<a name="proto-Fraction"></a>

### Fraction
A rational number.

A common use is to set the amount of a value transfer to collect as a custom fee.<br/>
It is RECOMMENDED that both numerator and denominator be no larger than necessary to express
the required fraction. A very large numerator, in particular, may not be reliable.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| numerator | [int64](#int64) |  | The fractional number's numerator |
| denominator | [int64](#int64) |  | The fractional number's denominator; a zero value SHALL result in FRACTION_DIVIDES_BY_ZERO. |






<a name="proto-Key"></a>

### Key
A Key is an entity representing one or more cryptographic public/private key pairs and,
optionally, the structure for how multiple signatures may be composed to meet complex multiple-
signature authorization requirements.

A Key can be a public key from either the Ed25519 or ECDSA(secp256k1) signature schemes.
In the ECDSA(secp256k1) case we require the 33-byte compressed form of the public key.
For simplicity, we call these cryptographic public keys `primitive` keys.

If an entity has a primitive key associated to it, then the corresponding private key must sign
any transaction to send tokens or perform other actions requiring authorization.

A Key can also be the ID of a smart contract instance, which is then authorized to perform any
precompiled contract action that requires authorization by that key.<br/>
Note that when a key is a smart contract ID, it SHALL NOT imply that the contract with that ID
will actually create a cryptographic signature. It SHALL signify that when the contract calls a
precompiled contract, the resulting "child transaction" SHALL be implicitly authorized to
perform any action controlled by that key. A contract ID key MAY be "delegatable", which permits
that contract to "authorize" a message frame for which it is recipient, even if the _code_
within that message frame is from a different contract.

A Key can be a "threshold key", which means a list of M keys, any N of which may sign in order
for the signature to be considered valid.

A Key can be a "key list" where all keys in the list must sign unless specified otherwise in the
documentation for a specific transaction type (e.g. FileDeleteTransactionBody).
This implies that the use of a key list is dependent on context. For example, an Hedera file
that is created with a list of keys, SHALL require that all of those keys must sign a
transaction to create or modify the file, but only one key from that list must sign a
transaction to delete the file. So it is a single list that sometimes acts as a M-of-M
threshold key, and sometimes acts as a 1-of-M threshold key.<br/>
To reduce confusion this may cause, a key list SHALL always be considered M-of-M, unless
specified otherwise in official documentation.<br/>
A key list MAY have repeated primitive public keys, but the signature requirement for all keys
in a repeated set SHALL be satisfied by a single valid signature. There is no mechanism to
require a single key to sign a single transaction more than once.

Any list or threshold key MAY have nested key lists or threshold keys. This allows, for example,
the keys within a threshold signature to themselves be threshold, list, contract, or primitive
keys. This nesting structure enables complex asymmetric multi-party signature requirements to
be met.

To ensure adequate performance and transaction security, key nesting is limited to at most
fifteen(15) levels.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract instance that is authorized implicitly.<br/> This key type SHALL require that the code in the active message frame belong to the contract with the given id. |
| ed25519 | [bytes](#bytes) |  | A set of Ed25519 public key bytes. |
| RSA_3072 | [bytes](#bytes) |  | **Deprecated.** This option is not currently supported.<br/> A set of RSA-3072 public key bytes. |
| ECDSA_384 | [bytes](#bytes) |  | **Deprecated.** This option is not currently supported.<br/> A set of ECDSA, using the p-384 curve, public key bytes. |
| thresholdKey | [ThresholdKey](#proto-ThresholdKey) |  | A threshold, N, combined with a list of M keys, any N of which are sufficient to form a valid signature. |
| keyList | [KeyList](#proto-KeyList) |  | A list of keys. This may be treated like a "M-of-M" threshold key, as a component of another key, or in some other manner as documented. |
| ECDSA_secp256k1 | [bytes](#bytes) |  | A set of compressed ECDSA(secp256k1) public key bytes.<br/> This is an EVM compatibility format. |
| delegatable_contract_id | [ContractID](#proto-ContractID) |  | A smart contract that, if the recipient of the active message frame, SHALL be imputed authorization.<br/> This key form SHALL NOT strictly require that the code being executed in the frame belong to the given contract. The code in frame MAY be running another contract via a `delegatecall`.<br/> Setting this key type is a more permissive version of setting a contractID key. |






<a name="proto-KeyList"></a>

### KeyList
A list of keys that requires all keys (M-of-M) to sign, unless otherwise specified in official
documentation. A KeyList may contain repeated keys, but all such repeated keys are considered a
single key when determining signature authorization.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| keys | [Key](#proto-Key) | repeated | A list of keys. All values in this list SHALL be non-null. <p> An empty key list is the "standard" mechanism to represent an unassigned key. For example, if the `admin_key` of an account is set to the empty key list, then that account has no admin key, and functionality that requires an admin key to sign the transaction is disabled. |






<a name="proto-NftID"></a>

### NftID
Identifier for a unique token (or "NFT"), used by both contract and token services.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_ID | [TokenID](#proto-TokenID) |  | The token that represents the collection containing this NFT. |
| serial_number | [int64](#int64) |  | The serial number of this NFT, unique within its token type. |






<a name="proto-NftTransfer"></a>

### NftTransfer
A sender account, a receiver account, and the serial number of an NFT to transfer.

Each `NftTransfer` SHALL be contained in another message (typically `TokenTransferList`) that
details which `Token` type applies to this NFT transfer.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| senderAccountID | [AccountID](#proto-AccountID) |  | The accountID of the sender |
| receiverAccountID | [AccountID](#proto-AccountID) |  | The accountID of the receiver |
| serialNumber | [int64](#int64) |  | The serial number of the NFT |
| is_approval | [bool](#bool) |  | If true then the transfer is expected to be an approved allowance and the senderAccountID SHALL be the owner that approved the allowance. The default is false (unset). |






<a name="proto-NodeAddress"></a>

### NodeAddress
The data about a node, including its service endpoints and the Hedera account to be paid for
services provided by the node (that is, queries answered and transactions submitted.)

This legacy text is uncertain, the node should produce an error if current usage permits.

> If the `serviceEndpoint` list is not set, or empty, then the endpoint given by the
> `ipAddress` and `portno` fields MAY be used, but SHOULD produce an error message.

All active fields are populated in the 0.0.102 address book file.<br/>
Only fields documented with `0.0.101 field` are populated in the 0.0.101 address book file.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ipAddress | [bytes](#bytes) |  | **Deprecated.** ServiceEndpoint is now used to retrieve a node's list of IP addresses and ports.<br/> The IP address of the Node with separator & octets encoded in UTF-8.<br/> This value SHALL NOT be populated. |
| portno | [int32](#int32) |  | **Deprecated.** ServiceEndpoint is now used to retrieve a node's list of IP addresses and ports.<br/> The port number of the grpc server for the node.<br/> This value SHALL NOT be populated. |
| memo | [bytes](#bytes) |  | **Deprecated.** Description provides short text functionality.<br/> A short description of the node.<br/> This field SHALL NOT be populated. |
| RSA_PubKey | [string](#string) |  | The X509 RSA _public_ key this node SHALL be used to sign stream files (e.g., record stream or block stream files). This field SHALL be a string of hexadecimal characters, encoded UTF-8, which, translated to binary, form the public key DER encoding. |
| nodeId | [int64](#int64) |  | `0.0.101 field`<p/> A numeric identifier for the node. This value SHALL be non-sequential. |
| nodeAccountId | [AccountID](#proto-AccountID) |  | `0.0.101 field`<p/> The account to be paid the "node" portion of transaction fees paid for queries and transactions sent to this node. |
| nodeCertHash | [bytes](#bytes) |  | `0.0.101 field`<p/> A hash of the node's TLS certificate.<br/> This field SHALL be a string of hexadecimal characters, encoded UTF-8, which, translated to binary, form a SHA-384 hash of the node's TLS certificate in PEM format. The TLS certificate MUST be encoded UTF-8 and normalized according to the NFKD form prior to computing the hash value. The value of this field SHALL be used to verify the node TLS certificate when presented during protocol negotiation. |
| serviceEndpoint | [ServiceEndpoint](#proto-ServiceEndpoint) | repeated | `0.0.101 field`<p/> A node's service IP addresses and ports. Nodes require multiple endpoints to ensure that inter-node communication (e.g. gossip) is properly separated from client communication to API endpoints. |
| description | [string](#string) |  | A short description of the node.<br/> This value, if set, SHOULD NOT exceed 100 characters. |
| stake | [int64](#int64) |  | **Deprecated.** This is replaced by per-account stake tracking and dynamic calculation.<br/> The amount of tinybar staked to the node.<br/> This value SHOULD NOT be populated, and SHALL be ignored. |






<a name="proto-NodeAddressBook"></a>

### NodeAddressBook
A list of nodes and their metadata that contains details of the nodes running the network. Used
to parse the contents of system files `0.0.101` and `0.0.102`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nodeAddress | [NodeAddress](#proto-NodeAddress) | repeated | Metadata of all nodes in the network |






<a name="proto-RealmID"></a>

### RealmID
The ID for a realm. Within a given shard, every realm has a unique ID. Each account, file, and
contract instance belongs to exactly one realm.

Everything is partitioned into realms so that each Solidity smart contract can access everything
in just a single realm, locking all those entities while it's running, but other smart contracts
could potentially run in other realms in parallel. So realms allow Solidity to be parallelized
somewhat, even though the language itself assumes everything is serial.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |
| realmNum | [int64](#int64) |  | A whole number realm number |






<a name="proto-ScheduleID"></a>

### ScheduleID
Unique identifier for a Schedule


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard |
| realmNum | [int64](#int64) |  | A whole number realm |
| scheduleNum | [int64](#int64) |  | A whole number schedule, unique within its realm and shard |






<a name="proto-SemanticVersion"></a>

### SemanticVersion
Hedera follows semantic versioning (https://semver.org/) for both the HAPI protobufs and the
Services software.<br/>
Hedera modifies the "typical" semantic versioning somewhat, the `major` version is always `0`,
and each release increments the `minor` version. The `patch` and `pre` components are used in
the typical manner. The `build` component is not generally used.<p/>

> HIP-851 changes Hedera versioning, and changes the meaning of these fields, but does not
> change the structure or naming.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| major | [int32](#int32) |  | Increases with incompatible API changes.<br/> Hedera does not increment this value and retains a `0` value to indicate that API may change for any release. |
| minor | [int32](#int32) |  | Increases with backwards-compatible new functionality.<br/> Hedera increments this value with each release. There may be incompatible API changes. |
| patch | [int32](#int32) |  | Increases with backwards-compatible bug fixes. |
| pre | [string](#string) |  | A pre-release version MAY be denoted by appending a hyphen and a series of dot separated identifiers (https://semver.org/#spec-item-9); so given a semver 0.14.0-alpha.1+21AF26D3, this field would contain 'alpha.1' |
| build | [string](#string) |  | Build metadata MAY be denoted by appending a plus sign and a series of dot separated identifiers immediately following the patch or pre-release version (https://semver.org/#spec-item-10); so given a semver 0.14.0-alpha.1+21AF26D3, this field would contain '21AF26D3' |






<a name="proto-ServiceEndpoint"></a>

### ServiceEndpoint
A network node endpoint.

Each network node in the global address book publishes one or more endpoints which enable the
nodes to communicate both with other nodes, for gossip, and with clients to receive transaction
requests.

The endpoint incorporates both IP address and port.<br/>
IPv6 is not currently supported.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ipAddressV4 | [bytes](#bytes) |  | The 32-bit IPv4 address of the node encoded in pure "big-endian" (i.e. left to right) order (e.g. `127.0.0.1` has hex bytes in the order `FF`, `00`, `00`, `01`). |
| port | [int32](#int32) |  | The port value as a 32-bit integer between 0 and 65535, inclusive. |






<a name="proto-ServicesConfigurationList"></a>

### ServicesConfigurationList
Setting values representing a source of runtime configuration information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nameValue | [Setting](#proto-Setting) | repeated | A List of `Setting` values, typically read from application properties. |






<a name="proto-Setting"></a>

### Setting
A single runtime configuration setting. Typically a name-value pair, this may also contain
a small amount of associated data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | The name of this setting property. |
| value | [string](#string) |  | The value of this setting property. |
| data | [bytes](#bytes) |  | A small quantity of data associated with this setting. This SHOULD be less than 100 bytes. If the value is a string, it MUST be encoded UTF-8. |






<a name="proto-ShardID"></a>

### ShardID
A shard number. A shard is a partition of nodes running the network that processes transactions
separately from other shards. Each shard is effectively an independent instance of the overall
network that shares the same virtual distributed ledger, and may gossip cross-shard transactions
with other shards to maintain overall correct processing of the ledger.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |






<a name="proto-Signature"></a>

### Signature
This message is deprecated and MUST NOT be used to communicate with network nodes.
It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the SignaturePair and SignatureMap messages instead of this message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contract | [bytes](#bytes) |  | Smart contract virtual signature (always length zero). |
| ed25519 | [bytes](#bytes) |  | Ed25519 signature bytes. |
| RSA_3072 | [bytes](#bytes) |  | RSA-3072 signature bytes. |
| ECDSA_384 | [bytes](#bytes) |  | ECDSA p-384 signature bytes. |
| thresholdSignature | [ThresholdSignature](#proto-ThresholdSignature) |  | A list of signatures for a single N-of-M threshold Key. This must be a list of exactly M signatures, at least N of which are non-null. |
| signatureList | [SignatureList](#proto-SignatureList) |  | A list of M signatures, each corresponding to a Key in a KeyList of the same length. |






<a name="proto-SignatureList"></a>

### SignatureList
This message is deprecated and MUST NOT be used to communicate with network nodes.
It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the SignaturePair and SignatureMap messages instead of this message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sigs | [Signature](#proto-Signature) | repeated | Each signature corresponds to a Key in the KeyList. |






<a name="proto-SignatureMap"></a>

### SignatureMap
A set of signatures corresponding to every unique public key required to sign a given
transaction. If any public key matches more than one prefix in the signature map, the
transaction containing that map SHALL fail immediately with the response code
`KEY_PREFIX_MISMATCH`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sigPair | [SignaturePair](#proto-SignaturePair) | repeated | A list of signature pairs for a specific transaction.<br/> Each signature pair represents a single cryptographic (`primitive`) public key identified by a "prefix" value and the cryptographic signature produced for that key. |






<a name="proto-SignaturePair"></a>

### SignaturePair
A public key and signature pair.<br/>
Only Ed25519 and ECDSA(secp256k1) keys and signatures are currently supported as cryptographic
(non-implied) signatures.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pubKeyPrefix | [bytes](#bytes) |  | Prefix bytes of the public key. <p> The client may use any number of bytes from zero to the whole length of the public key for pubKeyPrefix. If zero bytes are used, then it MUST be true that only one cryptographic key is required to sign the associated transaction.<br/> If the `pubKeyPrefix` is 0 bytes and more than a single cryptographic key is required to sign the transaction, the request SHALL resolve to `INVALID_SIGNATURE`. <h3>Important Note</h3> In the special case that a signature is provided to authorize a precompiled contract, the `pubKeyPrefix` MUST contain the _entire public key_.<br/> That is, if the key is an Ed25519 key, the `pubKeyPrefix` MUST be 32 bytes long and contain the full public key bytes.<br/> If the key is an ECDSA(secp256k1) key, the `pubKeyPrefix` MUST be 33 bytes long and contain the full _compressed_ form of the public key. |
| contract | [bytes](#bytes) |  | A smart contract virtual signature.<br/> This value MUST be length zero, if set. |
| ed25519 | [bytes](#bytes) |  | An Ed25519 signature. |
| RSA_3072 | [bytes](#bytes) |  | **Deprecated.** This option is not currently supported.<br/> A RSA-3072 signature. |
| ECDSA_384 | [bytes](#bytes) |  | **Deprecated.** This option is not currently supported.<br/> ECDSA p-384 signature. |
| ECDSA_secp256k1 | [bytes](#bytes) |  | An ECDSA(secp256k1) signature. |






<a name="proto-StakingInfo"></a>

### StakingInfo
Staking information for an account or a contract.<br/>
This is used for responses returned from CryptoGetInfo or ContractGetInfo queries.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| decline_reward | [bool](#bool) |  | A flag indicating that the holder of this account has chosen to decline staking rewards. |
| stake_period_start | [Timestamp](#proto-Timestamp) |  | A `Timestamp` indicating the start time of the most recent staking period during which either the staking settings for this account or contract changed or the account or contract received staking rewards, whichever is later. Examples of a change in staking settings include starting staking or changing the staked_node_id.<br/> If this account or contract is not currently staked to a node, then this field SHALL NOT be set. |
| pending_reward | [int64](#int64) |  | The amount in tinybars that will be received in the next reward payout. Rewards are not paid out immediately; for efficiency reasons rewards are only paid out as part of another transaction involving that account. |
| staked_to_me | [int64](#int64) |  | The total HBAR balance of all accounts that delegate staking to this account or contract. |
| staked_account_id | [AccountID](#proto-AccountID) |  | Delegated stake. This account delegates to the indicated account for staking purposes. |
| staked_node_id | [int64](#int64) |  | Direct stake. This accounts stakes its balance to the designated node. |






<a name="proto-ThresholdKey"></a>

### ThresholdKey
A threshold value and a list of public keys that, together, form a threshold signature
requirement. Any subset of the keys in the list may satisfy the signature requirements of this
type of key, provided the number of keys meets or exceeds the threshold. For example, if a
particular key has a threshold of three(3) and eight(8) keys in the list, then any three(3)
signatures, from the list of eight(8), is sufficient to authorize that key.

For threshold purposes, all signatures from a single `primitive` key are considered a single
signature, so that signature(s) from a single key SHALL NOT _directly_ meet a threshold
greater than one(1).

> It is possible to construct a complex key structure that _would_ enable a single primitive key
> to successfully meet a threshold requirement. All threshold keys SHOULD be carefully audited
> to ensure no one `primitive` key, or smart contract, has disproportionate capability.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| threshold | [uint32](#uint32) |  | A transaction MUST have valid signatures from at least this number of separate keys, from the `keys` list to be authorized by this key. |
| keys | [KeyList](#proto-KeyList) |  | A list of the keys that MAY satisfy signature requirements of this key. |






<a name="proto-ThresholdSignature"></a>

### ThresholdSignature
This message is deprecated and MUST NOT be used to communicate with network nodes.
It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the SignaturePair and SignatureMap messages instead of this message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sigs | [SignatureList](#proto-SignatureList) |  | For an N-of-M threshold key, this is a list of M signatures, at least N of which must be non-null. |






<a name="proto-TokenAssociation"></a>

### TokenAssociation
An association between a token and an account. An account must be associated with a token before
that account can transact (send or receive) that token.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The ID value for the token associated. |
| account_id | [AccountID](#proto-AccountID) |  | The ID value for the associated account. |






<a name="proto-TokenBalance"></a>

### TokenBalance
A number of _transferable units_ of a specified token.

The transferable unit of a token is its smallest denomination, as given by the token's
`decimals` property. Each minted token contains 10<sup>`decimals`</sup> transferable units.
For example, we could think of the cent as the transferable unit of the US
dollar (`decimals=2`); and the tinybar as the transferable unit of HBAR (`decimals=8`).

Transferable units are not directly comparable across different tokens.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | The unique token ID for the token to be described. |
| balance | [uint64](#uint64) |  | The number of transferable units of the identified token.<br/> For fungible (non-unique) tokens this is the balance, in units of 10<sup>`-decimals`</sup> whole tokens.<br/> For non-fungible (unique) tokens, this is the number of individual unique tokens in this balance. |
| decimals | [uint32](#uint32) |  | Tokens divide into 10<sup>`decimals`</sup> sub-units. |






<a name="proto-TokenBalances"></a>

### TokenBalances
A set of token balance values. Each entry describes the balance the enclosing account holds for
a specific token. The balance is an amount for a fungible (non-unique) token or a count for a
non-fungible (unique) token.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenBalances | [TokenBalance](#proto-TokenBalance) | repeated | A list of token balance values, each represents a single account balance for a single token. |






<a name="proto-TokenID"></a>

### TokenID
Unique identifier for a token


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard number |
| realmNum | [int64](#int64) |  | A whole number realm number |
| tokenNum | [int64](#int64) |  | A whole number token number |






<a name="proto-TokenRelationship"></a>

### TokenRelationship
An Hedera Token Service token relationship. A token relationship describes the connection
between an Account and a Token type, including the current account balance in that token.

A TokenRelationship SHALL contain, for the referenced token and enclosing account,<br/>
The account's current balance, whether the account has KYC granted, whether the assets are frozen
and whether the association was automatic.<br/>
A TokenRelationship MAY also contain the `symbol` and `decimals` values copied from the token.

TokenRelationship entries are only valid within the context of a `GetAccountDetails` query
response, which specifies the account side of the relationship.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | The ID of the token |
| symbol | [string](#string) |  | The Symbol of the token |
| balance | [uint64](#uint64) |  | For fungible (non-unique) tokens this is the balance that the Account holds of that token. The value is provided as an integer amount of the smallest unit of the token (i.e. 10<sup>`-decimals`</sup> whole tokens). <p> For non-fungible (unique) tokens this is the whole number of unique tokens held by the account for this token type. |
| kycStatus | [TokenKycStatus](#proto-TokenKycStatus) |  | The KYC status of the account (`KycNotApplicable`, `Granted` or `Revoked`) with respect to this token. If KYC is not supported for this token (e.g. the `kyc_key` of the token is not set), this will be `KycNotApplicable`. |
| freezeStatus | [TokenFreezeStatus](#proto-TokenFreezeStatus) |  | The Freeze status of the account (FreezeNotApplicable, Frozen or Unfrozen) with respect to this token. If the token cannot freeze account assets (e.g. the `freeze_key` of the token is not set), this will be `FreezeNotApplicable`. |
| decimals | [uint32](#uint32) |  | The maximum "precision" for this token. A single whole token may be divided into at most 10<sup>`decimals`</sup> sub-units. |
| automatic_association | [bool](#bool) |  | Describes whether the relationship was created implicitly (automatically) or explicitly (manually) via a `TokenAssociate` transaction. |






<a name="proto-TokenTransferList"></a>

### TokenTransferList
A list of transfers for a particular (non-HBAR) token type.

A `TokenTransferList` applies to a single token type, but may contain many individual transfers.<br/>
Each transfer of a fungible non-unique token specifies an `accountID` and `amount`. Amount
is positive when the account receives tokens, and negative when the account sends tokens.<br/>
Each transfer of a unique token includes both sender and receiver, as well as the serial
number transferred.<br/>
A single `TokenTransferList` SHALL contain `transfers` OR `nftTransfers`, but not both.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The ID of the token. |
| transfers | [AccountAmount](#proto-AccountAmount) | repeated | List of AccountAmounts; each has an account and amount.<br/> These transfers are "double-entry" style; the credits (positive amount) and debits (negative amount) MUST sum to 0, unless this transfer list is part of a `mint` or `burn` operation. Applicable to tokens of type `FUNGIBLE_COMMON` only. |
| nftTransfers | [NftTransfer](#proto-NftTransfer) | repeated | List of NftTransfers; each has a sender and receiver account, and the serial number of the unique token to transfer.<br/> Applicable to tokens of type `NON_FUNGIBLE_UNIQUE` only. |
| expected_decimals | [google.protobuf.UInt32Value](#google-protobuf-UInt32Value) |  | The number of decimals a fungible token type is _expected_ to have. The transfer SHALL fail with <a href="ResponseCodeEnum#UNEXPECTED_TOKEN_DECIMALS">UNEXPECTED_TOKEN_DECIMALS</a> if this is set and the actual decimals specified for the `Token` differ from this value.<br/> If `nftTransfers` is set, then this value SHOULD NOT be set. |






<a name="proto-TopicID"></a>

### TopicID
Unique identifier for a topic.
Topics are part of the consensus service, messages are published to a topic.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| shardNum | [int64](#int64) |  | A whole number shard |
| realmNum | [int64](#int64) |  | A whole number realm |
| topicNum | [int64](#int64) |  | A whole number topic, unique within its realm and shard |






<a name="proto-TransactionFeeSchedule"></a>

### TransactionFeeSchedule
The fees for a specific transaction or query based on the fee data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hederaFunctionality | [HederaFunctionality](#proto-HederaFunctionality) |  | The enumeration for a particular transaction or query. The functionality type determines the base cost parameters. |
| feeData | [FeeData](#proto-FeeData) |  | **Deprecated.** Use `fees` instead of this field.<br/> Resource price coefficients. |
| fees | [FeeData](#proto-FeeData) | repeated | The resource price coefficients for transaction type and any applicable subtypes.<br/> The multiple entries enable support for subtype price definitions. |






<a name="proto-TransactionID"></a>

### TransactionID
The ID for a transaction. This is used for retrieving receipts and records for a transaction, for
appending to a file after creating it, for instantiating a smart contract with bytecode in
a file just created, and internally by the network for detecting when duplicate transactions are
submitted.

A user might get a transaction processed more reliably by submitting it to several nodes, each
with a different node account, but all with the same TransactionID. Then, the transaction will
take effect when the first of all those nodes submits the transaction and it reaches consensus.
The other transactions will not take effect (and SHALL result in a `DUPLICATE_TRANSACTION`
response).<br/>
Multiple submission increase reliability on the assumption that an error in, for example,
network connectivity will not affect all nodes equally. Latency might be slightly lower, if one
node is handling intake significantly slower than others, for example.
The full transaction fee is required for each submission, however, so the total fees charged are
significantly higher when using this approach.

Additional items applicable to Scheduled Transactions:

 - The ID of a Scheduled Transaction, once executed, SHALL inherit both `transactionValidStart`
   and `accountID` from the `ScheduleCreate` transaction that created the schedule.
 - The `scheduled` property is true for Scheduled Transactions.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transactionValidStart | [Timestamp](#proto-Timestamp) |  | The transaction is invalid if consensusTimestamp < transactionID.transactionStartValid |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID that will pay transaction fees for this transaction. |
| scheduled | [bool](#bool) |  | Whether the transaction represents the execution of a Schedule after all necessary signatures are gathered. |
| nonce | [int32](#int32) |  | The identifier for an internal transaction that was spawned as part of handling a user transaction. (These internal transactions share the transactionValidStart and accountID of the user transaction, so a nonce is necessary to give them a unique TransactionID.) <p> An example is when a "parent" ContractCreate or ContractCall transaction calls one or more HTS precompiled contracts; each of the "child" transactions spawned for a precompile has a transaction id with a different nonce. <p> This value SHALL be unset for user-submitted transactions. |






<a name="proto-TransferList"></a>

### TransferList
A list of accounts and amounts to transfer.<br/>
Each `AccountAmount` specifies the account and the amount to send(negative) or
receive(positive).<br/>
Each `TransferList` SHALL be contained in another message that contains other details required
to complete a transfer.
This is typically a `CryptoTransferTransactionBody` or `TransactionRecord`.<br/>
`TransferList` SHALL only be used for HBAR transfers. Other token types MUST use the
`TokenTransferList` message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountAmounts | [AccountAmount](#proto-AccountAmount) | repeated | Multiple list of AccountAmount pairs, each of which has an account and an amount to transfer into it (positive) or out of it (negative) |





 <!-- end messages -->


<a name="proto-HederaFunctionality"></a>

### HederaFunctionality
The transactions and queries supported by Hedera Hashgraph.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NONE | 0 | Unused - The first value is unused because this first element is ignored and not parsed (0 is ignored by parser) within the intake logic. |
| CryptoTransfer | 1 | Transfer tokens among accounts. |
| CryptoUpdate | 2 | Update an account. |
| CryptoDelete | 3 | Delete an account. |
| CryptoAddLiveHash | 4 | Add a livehash to an account |
| CryptoDeleteLiveHash | 5 | Delete a livehash from an account |
| ContractCall | 6 | Execute a smart contract call. |
| ContractCreate | 7 | Create a smart contract. |
| ContractUpdate | 8 | Update a smart contract. |
| FileCreate | 9 | Create a "file" stored in the ledger. |
| FileAppend | 10 | Append data to a "file" stored in the ledger. |
| FileUpdate | 11 | Update a "file" stored in the ledger. |
| FileDelete | 12 | Delete a "file" stored in the ledger. |
| CryptoGetAccountBalance | 13 | Get the balance for an account. |
| CryptoGetAccountRecords | 14 | Get a full account record. |
| CryptoGetInfo | 15 | Get information about a token. |
| ContractCallLocal | 16 | Execute a local smart contract call (used by contracts to call other contracts). |
| ContractGetInfo | 17 | Get information about a smart contract. |
| ContractGetBytecode | 18 | Get the compiled bytecode that implements a smart contract. |
| GetBySolidityID | 19 | Get a smart contract record by reference to the solidity ID. |
| GetByKey | 20 | Get a smart contract by reference to the contract key. |
| CryptoGetLiveHash | 21 | Get the live hash for an account |
| CryptoGetStakers | 22 | Get the accounts proxy staking to a given account. |
| FileGetContents | 23 | Get the contents of a "file" stored in the ledger. |
| FileGetInfo | 24 | Get the metadata for a "file" stored in the ledger. |
| TransactionGetRecord | 25 | Get transaction record(s) for a specified transaction ID. |
| ContractGetRecords | 26 | Get all transaction records for a specified contract ID in the past 24 hours.<br/> @deprecated since version 0.9.0 |
| CryptoCreate | 27 | Create a new account |
| SystemDelete | 28 | Delete a "system" "file" stored in the ledger.<br/> "System" files are files with special purpose and ID values within a specific range.<br/> These files require additional controls and can only be deleted when authorized by accounts with elevated privilege. |
| SystemUndelete | 29 | Undo the delete of a "system" "file" stored in the ledger.<br/> "System" files are files with special purpose and ID values within a specific range.<br/> These files require additional controls and can only be deleted when authorized by accounts with elevated privilege. This operation allows such files to be restored, within a reasonable timeframe, if deleted improperly. |
| ContractDelete | 30 | Delete a smart contract |
| Freeze | 31 | Stop all processing and "freeze" the entire network.<br/> This is generally sent immediately prior to upgrading the network.<br/> After processing this transactions all nodes enter a quiescent state. |
| CreateTransactionRecord | 32 | Create a Transaction Record.<br/> This appears to be purely internal and unused. |
| CryptoAccountAutoRenew | 33 | Auto-renew an account.<br/> This is used for internal fee calculations. |
| ContractAutoRenew | 34 | Auto-renew a smart contract.<br/> This is used for internal fee calculations. |
| GetVersionInfo | 35 | Get version information for the ledger.<br/> This returns a the version of the software currently running the network for both the protocol buffers and the network services (node). |
| TransactionGetReceipt | 36 | Get a receipt for a specified transaction ID. |
| ConsensusCreateTopic | 50 | Create a topic for the Hedera Consensus Service (HCS). |
| ConsensusUpdateTopic | 51 | Update an HCS topic. |
| ConsensusDeleteTopic | 52 | Delete an HCS topic. |
| ConsensusGetTopicInfo | 53 | Get metadata (information) for an HCS topic. |
| ConsensusSubmitMessage | 54 | Publish a message to an HCS topic. |
| UncheckedSubmit | 55 | Submit a transaction, bypassing intake checking. Only enabled in local-mode. |
| TokenCreate | 56 | Create a token for the Hedera Token Service (HTS). |
| TokenGetInfo | 58 | Get metadata (information) for an HTS token. |
| TokenFreezeAccount | 59 | Freeze a specific account with respect to a specific HTS token.<br/> Once this transaction completes that account cannot send or receive the specified token. |
| TokenUnfreezeAccount | 60 | Remove a "freeze" from an account with respect to a specific HTS token. |
| TokenGrantKycToAccount | 61 | Grant KYC status to an account for a specific HTS token. |
| TokenRevokeKycFromAccount | 62 | Revoke KYC status from an account for a specific HTS token. |
| TokenDelete | 63 | Delete a specific HTS token. |
| TokenUpdate | 64 | Update a specific HTS token. |
| TokenMint | 65 | Mint HTS token amounts to the treasury account for that token. |
| TokenBurn | 66 | Burn HTS token amounts from the treasury account for that token. |
| TokenAccountWipe | 67 | Wipe all amounts for a specific HTS token from a specified account. |
| TokenAssociateToAccount | 68 | Associate a specific HTS token to an account. |
| TokenDissociateFromAccount | 69 | Dissociate a specific HTS token from an account. |
| ScheduleCreate | 70 | Create a scheduled transaction |
| ScheduleDelete | 71 | Delete a scheduled transaction |
| ScheduleSign | 72 | Sign a scheduled transaction |
| ScheduleGetInfo | 73 | Get metadata (information) for a scheduled transaction |
| TokenGetAccountNftInfos | 74 | Get NFT metadata (information) for a range of NFTs associated to a specific non-fungible HTS token and owned by a specific account. |
| TokenGetNftInfo | 75 | Get metadata (information) for a specific NFT identified by token and serial number. |
| TokenGetNftInfos | 76 | Get NFT metadata (information) for a range of NFTs associated to a specific non-fungible HTS token. |
| TokenFeeScheduleUpdate | 77 | Update a token's custom fee schedule.<br/> If a transaction of this type is not signed by the token `fee_schedule_key` it SHALL fail with INVALID_SIGNATURE, or TOKEN_HAS_NO_FEE_SCHEDULE_KEY if there is no `fee_schedule_key` set. |
| NetworkGetExecutionTime | 78 | Get execution time(s) for one or more "recent" TransactionIDs. |
| TokenPause | 79 | Pause a specific HTS token |
| TokenUnpause | 80 | Unpause a paused HTS token. |
| CryptoApproveAllowance | 81 | Approve an allowance for a spender relative to the owner account, which MUST sign the transaction. |
| CryptoDeleteAllowance | 82 | Delete (unapprove) an allowance previously approved for the owner account. |
| GetAccountDetails | 83 | Get all the information about an account, including balance and allowances.<br/> This does not get a list of account records. |
| EthereumTransaction | 84 | Perform an Ethereum (EVM) transaction.<br/> CallData may be inline if small, or in a "file" if large. |
| NodeStakeUpdate | 85 | Used to indicate when the network has updated the staking information at the end of a staking period and to indicate a new staking period has started. |
| UtilPrng | 86 | Generate and return a pseudorandom number based on network state. |
| TransactionGetFastRecord | 87 | Get a record for a "recent" transaction. |
| TokenUpdateNfts | 88 | Update the metadata of one or more NFT's of a specific token type. |



<a name="proto-SubType"></a>

### SubType
A transaction sub type.

This enumeration enables a set of transaction base fees to be broadly defined for a HAPI
operation while taking some specifics of the operation into account.

For example, the resource cost for a TokenMint operation is different between minting fungible
and non-fungible tokens. This enum is used to "mark" a cost as applying to one or the other.<br/>
Similarly, the resource cost for a basic TokenCreate without a custom fee schedule may yield a
base fee of $1. The resource cost for a TokenCreate _with_ a custom fee schedule is different
and may yield a base fee of $2 or more.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DEFAULT | 0 | The resource cost for the transaction type has no additional attributes |
| TOKEN_FUNGIBLE_COMMON | 1 | The resource cost for the transaction type includes an operation on a fungible common token |
| TOKEN_NON_FUNGIBLE_UNIQUE | 2 | The resource cost for the transaction type includes an operation on a non-fungible unique token |
| TOKEN_FUNGIBLE_COMMON_WITH_CUSTOM_FEES | 3 | The resource cost for the transaction type includes an operation on a fungible common token with a custom fee schedule |
| TOKEN_NON_FUNGIBLE_UNIQUE_WITH_CUSTOM_FEES | 4 | The resource cost for the transaction type includes an operation on a non-fungible unique token with a custom fee schedule |
| SCHEDULE_CREATE_CONTRACT_CALL | 5 | The resource cost for the transaction type includes a ScheduleCreate containing a ContractCall. |



<a name="proto-TokenFreezeStatus"></a>

### TokenFreezeStatus
Possible Freeze statuses; returned by `TokenGetInfoQuery` or `CryptoGetInfoResponse` in
`TokenRelationship`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FreezeNotApplicable | 0 | The token does not support freeze or cannot be frozen for the referenced account.<br/> Typically this indicates that the token does not have a `freeze_key` set. |
| Frozen | 1 | The token is currently frozen for the referenced account. |
| Unfrozen | 2 | The token is not currently frozen for the referenced account. |



<a name="proto-TokenKycStatus"></a>

### TokenKycStatus
Possible KYC status values; returned by `TokenGetInfoQuery` or `CryptoGetInfoResponse` in
`TokenRelationship`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| KycNotApplicable | 0 | The token does not support KYC or cannot grant KYC for the referenced account.<br/> Typically this indicates that the token does not have a `kyc_key` set. |
| Granted | 1 | The referenced account is currently granted KYC status for the referenced token. |
| Revoked | 2 | The referenced account is not currently granted KYC status for the referenced token. |



<a name="proto-TokenPauseStatus"></a>

### TokenPauseStatus
Possible Pause status values; returned by `TokenGetInfoQuery`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| PauseNotApplicable | 0 | The token does not support pause or cannot be paused.<br/> Typically this indicates that the token does not have a `pause_key` set. |
| Paused | 1 | The token is currently paused. |
| Unpaused | 2 | The token is not currently paused. |



<a name="proto-TokenSupplyType"></a>

### TokenSupplyType
Possible Token Supply Types (IWA Compatibility).<br/>
Indicates the limit of tokens that can exist during the lifetime of a token definition.

| Name | Number | Description |
| ---- | ------ | ----------- |
| INFINITE | 0 | Indicates that tokens of this type have an upper bound of Long.MAX_VALUE.<br/> This is accounted in the smallest units of the token (i.e. 10<sup>-`decimals`</sup> whole tokens) |
| FINITE | 1 | Indicates that tokens of this type have an upper bound of `maxSupply`.<br/> The maximum supply SHALL be provided on token creation, but MAY be changed thereafter if the token has an `admin_key` set. |



<a name="proto-TokenType"></a>

### TokenType
Possible Token Types (IWA Compatibility).<br/>
Apart from fungible and non-fungible, Tokens can have either a common or unique representation.
Furthermore, tokens may have intrinsic or referential value, and
may be whole and indivisible or fractional.<br/>
These distinction might seem subtle, but it is important when considering how tokens can be
traced, used, transferred, and if they can have isolated unique properties.

A few examples (these may not match enumerations below) using IWA taxonomy.
<dl>
  <dt>fungible, whole, intrinsic, unique</dt><dd>Physical fiat currency</dd>
  <dt>fungible, fractional, intrinsic, common</dt><dd>bank balance fiat currency</dd>
  <dt>non-fungible, fractional, reference, unique</dt><dd>"mutual" collectible/art/property ownership</dd>
  <dt>non-fungible, whole, intrinsic, unique</dt><dd>Physical work of fine art</dd>
  <dt>non-fungible, whole, reference, unique</dt><dd>Registered property title</dd>
</dl>

| Name | Number | Description |
| ---- | ------ | ----------- |
| FUNGIBLE_COMMON | 0 | Interchangeable with one another, where any quantity of them has the same value as another equal quantity if they are in the same class. Share a single set of properties, not distinct from one another. Represented as a balance or quantity associated to a given account. May be divided into fractional tokens (within reasonable limits). <p> IWA taxonomy _fungible, fractional, intrinsic, common_ |
| NON_FUNGIBLE_UNIQUE | 1 | Unique, not interchangeable with other tokens of the same type. Each token carries a serial number which is unique for that token, these tokens may have a different trade value for each individual token. The tokens are individually accounted and often carry additional unique properties. Tokens cannot be subdivided, and value is related to what the individual token represents. <p> IWA taxonomy _non-fungible, whole, reference, unique_ |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


