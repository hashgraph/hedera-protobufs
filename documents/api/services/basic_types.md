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
    - [PendingAirdropId](#proto-PendingAirdropId)
    - [PendingAirdropValue](#proto-PendingAirdropValue)
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
  
    - [BlockHashAlgorithm](#proto-BlockHashAlgorithm)
    - [HederaFunctionality](#proto-HederaFunctionality)
    - [SubType](#proto-SubType)
    - [TokenFreezeStatus](#proto-TokenFreezeStatus)
    - [TokenKeyValidation](#proto-TokenKeyValidation)
    - [TokenKycStatus](#proto-TokenKycStatus)
    - [TokenPauseStatus](#proto-TokenPauseStatus)
    - [TokenSupplyType](#proto-TokenSupplyType)
    - [TokenType](#proto-TokenType)
  



<a name="basic_types-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## basic_types.proto
# Basic Types
Fundamental message types used across transactions and state as field types.

### Requirements for identifier values
- Most entities in the network SHALL be identified by a multi-part
  identifier. These identifier values SHALL consist of a shard, a realm, and
  an entity identifier.
- Shard, Realm, and Entity Number MUST all be whole numbers.
- A Shard SHALL be globally unique.
- A Realm MAY be reused between shards, but SHALL be unique within a shard.
- An Entity Number MAY be reused between shards and realms, but SHALL be
  unique within each combination of shard and realm.
- Every object (e.g. account, file, token, etc...) SHALL be scoped to exactly
  one realm and shard. Thus a File has a FileID, a numeric triplet, such as
  0.0.2 for shard 0, realm 0, entity 2.
- Identifier values SHOULD use an Entity Number as the third component of the
  identifier. Some, however, MAY use alternative or composite values for the
  Entity portion of the three part identifier. Any such alternative or
  composite value MUST be unique within that shard and realm combination.
- The entity portion of the identifier, regardless of type, MUST be unique
  within that realm and shard combination and MAY be globally unique.
- The triplet of shard.realm.entity MUST be globally unique, even across
  different identifier types.
- Each realm SHALL maintain a single counter for entity numbers, so if there
  is an identifier with value 0.1.2, then there MUST NOT be an identifier
  with value 0.1.2 for any other object.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-AccountAmount"></a>

### AccountAmount
An account, and the amount that it sends or receives during a token transfer.

This message is only relevant to fungible/common token transfers.
Non-fungible/unique (NFT) token transfers MUST use the NftTransfer message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| accountID | [AccountID](#proto-AccountID) | An account identifier that will send or receive token(s). |
| amount | [sint64](#sint64) | An amount to send (negative) or receive (positive). <p> This amount MUST be denominated in the smallest unit of the relevant token.<br/> For HBAR this SHALL be tinybar (10<sup>-8</sup> HBAR).<br/> For other fungible/common tokens this SHALL depend on the value of `decimals` for that token. |
| is_approval | [bool](#bool) | An approved allowance flag.<br/> If true then the transfer is expected to be an approved allowance. <p> If set, `accountID` SHALL be the owner that previously approved the allowance.<br/> The default value SHALL be false (unset). |






<a name="proto-AccountID"></a>

### AccountID
A unique identifier for an Hedera account.

An account identifier is of the form `shard.realm.[number|alias]`.<br/>
The identifier MAY use the alias form when transferring HBAR to a public key
before the account for that key is created, when only the alias value is
known, or in some smart contracts that use the EVM address style alias to
refer to Accounts.<br/>
When the account entry is completed, the alias SHALL be stored separately in
the Account record, and the identifier in the Account SHALL use the
`accountNum` form.

---
### Additional Notes

#### Alias
There is considerable complexity with `alias` (aka `evm_address`) for
Accounts. Much of this comes from the existence of a "hidden" alias for
almost all accounts, and the reuse of the alias field for both EVM reference
and "automatic" account creation.<br/>
For the purposes of this specification, we will use the following terms for
clarity.
  - `key_alias`<br/>
     The account public key as a protobuf serialized message and used for
     auto-creation and subsequent lookup. This is only valid if the account
     key is a single `primitive` key, either Ed25519 or ECDSA_SECP256K1.
  - `evm_address`<br/>
    Exists for every account and is one of
     - `contract_address`<br/>
       The 20 byte EVM address prescribed by `CREATE` or `CREATE2`
     - `evm_key_address`<br/>
       An arbitrary 20 byte EVM address that, for a usable externally owned
       account (EOA) SHALL be the rightmost 20 bytes of the Keccak-256 hash
       of a ECDSA_SECP256K1 key.<br/>
       Such accounts may be created in one of three ways:
       - Sending hbar or fungible tokens to an unused
         ECDSA_SECP256K1 key alias.
       - Sending hbar or fungible tokens to an unassigned 20-byte
         EVM address.
       - Submitting a `CryptoCreate` signed with the corresponding
         private key.
     - `long_zero`<br/>
       A synthetic 20 byte address inferred for "normally" created accounts.
       It is constructed from the "standard" AccountID as follows.
        1. 4 byte big-endian shard number
        1. 8 byte big-endian realm number
        1. 8 byte big-endian entity number<br/>

The `alias` field in the `Account` message SHALL contain one of four values
for any given account.
  - The `key_alias`, if the account was created by transferring HBAR to the
    `key_alias` public key value.
  - The `evm_key_address` if the account was created from an EVM public key
  - The `contract_address` if the account belongs to an EVM contract
  - Not-Set/null/Bytes.EMPTY (collectively `null`) if the account was
    created normally

If the `alias` field of an `Account` is any form of `null`, then the account
MAY be referred to by `alias` in an `AccountID` by using the `long_zero`
address for the account.<br/>
This "hidden default" alias SHALL NOT be stored, but is synthesized by the
node software as needed, and may be synthesized by an EVM contract or client
software as well.

---

#### Alias forms
An `AccountID` in a transaction MAY reference an `Account` with
`shard.realm.alias`.<br/>
If the account `alias` field is set for an Account, that value SHALL be the
account alias.<br/>
If the account `alias` field is not set for an Account, the `long_zero` alias
SHALL be the account alias.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |
| accountNum | [int64](#int64) | A whole number account number, unique within its realm and shard. <p> For any AccountID fields in the query response, transaction records, transaction receipts, or block stream `accountNum` MUST be used. |
| alias | [bytes](#bytes) | An alias value.<br/> Alias is a value used in some contexts to refer to an account when account number is not available, and may be an alias public key, or an EVM address. |






<a name="proto-ContractID"></a>

### ContractID
An identifier for a smart contract within the network.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |
| contractNum | [int64](#int64) | A whole number contract identifier, unique within its realm and shard. |
| evm_address | [bytes](#bytes) | A 20-byte EVM address of the contract to call. <p> A contract created via a HAPI `ContractCreate` call SHALL have an EVM address determined by its `shard.realm.num` identifier.<br/> This address is as follows <ol> <li>4 byte big-endian shard number</li> <li>8 byte big-endian realm number</li> <li>8 byte big-endian contract number</li> </ol> This address is not stored in state, but is computed when needed. <p> Contracts created by any other means, including a HAPI `EthereumTransaction` whose `to` address is the zero address, SHALL have the EVM address prescribed by the `CREATE` or `CREATE2` opcode, as applicable. |






<a name="proto-CurrentAndNextFeeSchedule"></a>

### CurrentAndNextFeeSchedule
The "current" fee schedule and the "next" fee schedule.

The current fee schedule is the schedule that SHALL apply to the current
transaction.<br/>
The next fee schedule is the schedule that SHALL apply after the current
schedule expires.<br/>
We store both to avoid a condition where transactions are processed very
near the time when a fee schedule expires and it might be indeterminate
which fees to apply. With both current and next fee schedule the network
can deterministically apply the correct fee schedule based on consensus
timestamp for each transaction.


| Field | Type | Description |
| ----- | ---- | ----------- |
| currentFeeSchedule | [FeeSchedule](#proto-FeeSchedule) | A current, unexpired, fee schedule. |
| nextFeeSchedule | [FeeSchedule](#proto-FeeSchedule) | A future fee schedule to use when the current schedule expires. |






<a name="proto-FeeComponents"></a>

### FeeComponents
A set of values the nodes use in determining transaction and query fees, and
constants involved in fee calculations.

Nodes SHALL multiply the amount of "resources" allocated to a transaction or
query by the corresponding price to calculate the appropriate fee. Units are
one-thousandth of a `tinyCent`. The "resource" allocations SHALL be estimated
based on transaction characteristics and current network state, and MAY be
further adjusted based on network load and congestion.

This SHALL be used, in different contexts, for the cost _factors_ used to
calculate charged amounts, for the resource accumulation, and for actual
amounts to be charged.<br/>
Amounts recorded here MUST be converted to tinybar according to the
current active `ExchangeRate` for the network.


| Field | Type | Description |
| ----- | ---- | ----------- |
| min | [int64](#int64) | Base: "minimum total fee". <p> The calculated fee MUST be greater than this value. |
| max | [int64](#int64) | Base: "maximum total fee". <p> The calculated fee MUST be less than this value. |
| constant | [int64](#int64) | Base: "constant fee".<br/> A baseline constant contribution to total fee. |
| bpt | [int64](#int64) | Bandwidth: "bytes per transaction".<br/> The fee for bandwidth consumed by a transaction, measured in bytes |
| vpt | [int64](#int64) | Signatures: "validations per transaction".<br/> The fee for signature verifications required by a transaction |
| rbh | [int64](#int64) | Memory: "RAM byte-hours".<br/> The fee for RAM required to process a transaction, measured in byte-hours |
| sbh | [int64](#int64) | Disk: "storage byte-hours".<br/> The fee for storage required by a transaction, measured in byte-hours |
| gas | [int64](#int64) | Compute: Ethereum term for a derivative EVM compute resource.<br/> The fee of computation for a smart contract transaction. The value of gas is set by a conversion rate, and is regularly updated to reflect reasonable and customary costs. |
| tv | [int64](#int64) | Ad valorem: "transferred value".<br/> The fee for HBAR transferred by a transaction. |
| bpr | [int64](#int64) | Response memory: "bytes per response".<br/> The fee for data retrieved from memory to deliver a response, measured in bytes |
| sbpr | [int64](#int64) | Response disk: "storage bytes per response".<br/> The fee for data retrieved from disk to deliver a response, measured in bytes |






<a name="proto-FeeData"></a>

### FeeData
A total fee, in component amounts charged for a transaction.

Total fees are composed of three sets of components.
- Node data, components that compensate the specific node that submitted
  the transaction.
- Network data, components that compensate the Hedera network for gossiping
  the transaction and determining the consensus timestamp.
- Service data, components that compensate the Hedera network for the ongoing
  maintenance and operation of the network, as well as ongoing development
  of network services.

Fee components are recorded in thousandths of a tiny cent, and the network
exchange rate converts these to tinybar amounts, which are what the network
charges for transactions and what the network reports in the record stream.


| Field | Type | Description |
| ----- | ---- | ----------- |
| nodedata | [FeeComponents](#proto-FeeComponents) | Fee components to be paid to the submitting node. |
| networkdata | [FeeComponents](#proto-FeeComponents) | Fee components to be paid to the network for bringing a transaction to consensus. |
| servicedata | [FeeComponents](#proto-FeeComponents) | Fee components to be paid to the network for providing the immediate and ongoing services associated with executing the transaction, maintaining the network, and developing the network software. |
| subType | [SubType](#proto-SubType) | A sub-type distinguishing between different types of `FeeData` that may apply to the same base transaction type (associated with an `HederaFunctionality`). |






<a name="proto-FeeSchedule"></a>

### FeeSchedule
A set of fee schedules covering all transaction types and query types, along
with a specific time at which this fee schedule will expire.

Nodes SHALL use the most recent unexpired fee schedule to determine the fees
for all transactions based on various resource components imputed to each
transaction.


| Field | Type | Description |
| ----- | ---- | ----------- |
| transactionFeeSchedule | [TransactionFeeSchedule](#proto-TransactionFeeSchedule) | Sets of fee coefficients for various transaction or query types. |
| expiryTime | [TimestampSeconds](#proto-TimestampSeconds) | A time, in seconds since the `epoch`, when this fee schedule will expire. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |






<a name="proto-FileID"></a>

### FileID
An identifier for a File within the network.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |
| fileNum | [int64](#int64) | A whole number file identifier, unique within its realm and shard. |






<a name="proto-Fraction"></a>

### Fraction
A rational number.<br/>
A common use is to set the amount of a value transfer to collect as a
custom fee.

It is RECOMMENDED that both numerator and denominator be no larger than
necessary to express the required fraction. A very large numerator, in
particular, may not be reliable.
Both fields are REQUIRED and SHOULD be positive integers.


| Field | Type | Description |
| ----- | ---- | ----------- |
| numerator | [int64](#int64) | A fractional number's numerator. |
| denominator | [int64](#int64) | A fractional number's denominator. <p> A zero value SHALL fail with response code `FRACTION_DIVIDES_BY_ZERO`. |






<a name="proto-Key"></a>

### Key
A Key is an entity representing one or more cryptographic public/private key
pairs and, optionally, the structure for how multiple signatures may be
composed to meet complex multiple-signature authorization requirements.

A Key can be a public key from either the Ed25519 or ECDSA(secp256k1)
signature schemes. In the ECDSA(secp256k1) case we require the 33-byte
compressed form of the public key. For simplicity, we call these
cryptographic public keys `primitive` keys.<br/>
If an entity has a primitive key associated to it, then the corresponding
private key must sign any transaction to send tokens or perform other
actions requiring authorization.

A Key can also be the ID of a smart contract, which SHALL authorize that
contract to execute any system contract with signing requirements that are
met by the key.<br/>
> Example
>> If account `0.0.A` has a threshold key whose threshold is satisfied
>> by a contract ID key for contract `0.0.C`, then when `0.0.C` is called,
>> it is authorized to use system contracts to manage any asset owned by
>> `0.0.A`. If the contract ID key is "delegatable", then `0.0.C` can even
>> perform these actions when running code accessed via `DELEGATECALL`.

A Key can be a "threshold key", which is a list of N keys, any M of which
may sign in order for the signature to be considered valid. The value of
M for a given threshold key MUST be less than or equal to N. A threshold
key is sometimes called a "M-of-N" key.

A Key can be a "key list" where all keys in the list must sign unless
specified otherwise in the documentation for a specific transaction
type (e.g. FileDeleteTransactionBody).<br/>
This implies that the use of a key list is dependent on context. For
example, an Hedera file that is created with a list of keys, SHALL require
that all of those keys must sign a transaction to create or modify the file,
but only one key from that list MUST sign a transaction to delete the file.
So it is a single list that sometimes acts as a N-of-N threshold key, and
sometimes acts as a 1-of-N threshold key.<br/>
To reduce confusion this may cause, a key list SHALL always be considered
N-of-N, unless specified otherwise in official documentation.<br/>
A key list MAY have repeated primitive public keys, but the signature
requirement for all keys in a repeated set SHALL be satisfied by a single
valid signature. There is no mechanism to require a single key to sign a
single transaction more than once.

Any list or threshold key MAY have nested key lists or threshold keys.
This allows, for example, the keys within a threshold signature to
themselves be threshold, list, contract, or primitive keys. This nesting
structure enables complex asymmetric multi-party signature requirements to
be met.

To ensure adequate performance and transaction security, key nesting is
limited to at most fifteen(15) levels.


| Field | Type | Description |
| ----- | ---- | ----------- |
| contractID | [ContractID](#proto-ContractID) | A smart contract instance that is authorized implicitly. <p> This key type SHALL require that the code in the active message frame belong to the contract with the given id. |
| ed25519 | [bytes](#bytes) | An array of Ed25519 public key bytes. |
| RSA_3072 | [bytes](#bytes) | **Deprecated.** This option is not currently supported.<br/> An array of RSA-3072 public key bytes. |
| ECDSA_384 | [bytes](#bytes) | **Deprecated.** This option is not currently supported.<br/> An array of ECDSA, using the p-384 curve, public key bytes. |
| thresholdKey | [ThresholdKey](#proto-ThresholdKey) | A threshold, M, combined with a list of N keys, any M of which are sufficient to form a valid signature. |
| keyList | [KeyList](#proto-KeyList) | A list of keys. This may be treated like a "N-of-N" threshold key, as a component of another key, or in some other manner as documented. |
| ECDSA_secp256k1 | [bytes](#bytes) | A set of compressed ECDSA(secp256k1) public key bytes.<br/> This is an EVM compatibility format. |
| delegatable_contract_id | [ContractID](#proto-ContractID) | A smart contract that, if the recipient of the active message frame, SHALL be imputed authorization.<br/> Setting this key type is a more permissive version of setting a contractID key. <p> This key form SHALL NOT strictly require that the code being executed in the frame belong to the given contract. The code in frame MAY be running another contract via a `delegatecall`. |






<a name="proto-KeyList"></a>

### KeyList
A list of keys.<br/>
A `KeyList` requires all keys (N-of-N) to sign, unless otherwise
specified in official documentation. A KeyList may contain repeated keys,
but all such repeated keys are considered a single key when determining
signature authorization.

### Additional Notes
1. An empty key list is the "standard" mechanism to represent an
   unassigned key. For example, if the `admin_key` of a token is set
   to the empty key list, then that token has no admin key, and
   functionality that requires an admin key to sign the
   transaction is disabled.


| Field | Type | Description |
| ----- | ---- | ----------- |
| keys | [Key](#proto-Key) | A list of keys. All values in this list SHALL be non-null. <p> |






<a name="proto-NftID"></a>

### NftID
An identifier for a unique token (or "NFT"), used by both contract
and token services.


| Field | Type | Description |
| ----- | ---- | ----------- |
| token_ID | [TokenID](#proto-TokenID) | A token identifier.<br/> This token represents the collection containing this NFT. |
| serial_number | [int64](#int64) | A unique serial number.<br/> This serial number is unique within its token type. |






<a name="proto-NftTransfer"></a>

### NftTransfer
A NFT transfer.<br/>
This refers to a sender account, a receiver account, and the serial number
of an NFT to transfer from sender to receiver.

Each `NftTransfer` SHALL be contained in another message (typically
`TokenTransferList`) that details which `Token` type applies to this NFT
transfer.


| Field | Type | Description |
| ----- | ---- | ----------- |
| senderAccountID | [AccountID](#proto-AccountID) | An Account identifier for the sender. |
| receiverAccountID | [AccountID](#proto-AccountID) | An Account identifier for the receiver. |
| serialNumber | [int64](#int64) | A serial number for the NFT to transfer. |
| is_approval | [bool](#bool) | An approved allowance flag.<br/> If true then the transfer is expected to be an approved allowance. <p> If set, `senderAccountID` SHALL be the owner that previously approved the allowance.<br/> If set, the `senderAccountID` MUST be the "payer" account for the transaction <br/> The default value SHALL be false (unset). |






<a name="proto-NodeAddress"></a>

### NodeAddress
The data about a node, including its service endpoints and the Hedera account
to be paid for services provided by the node (that is, queries answered and
transactions submitted).

All active fields are populated in the `0.0.102` address book file.<br/>
Only fields documented with "`0.0.101` field" are populated in the 0.0.101
address book file.

This message MAY be superseded by messages in state/addressbook/node.proto
and node_get_info.proto.


| Field | Type | Description |
| ----- | ---- | ----------- |
| ipAddress | [bytes](#bytes) | **Deprecated.** ServiceEndpoint is now used to retrieve a node's list of IP addresses and ports.<br/> The IP address of the Node, as a string, encoded in UTF-8.<br/> This value SHALL NOT be populated. |
| portno | [int32](#int32) | **Deprecated.** ServiceEndpoint is now used to retrieve a node's list of IP addresses and ports.<br/> The port number of the grpc server for the node.<br/> This value SHALL NOT be populated. |
| memo | [bytes](#bytes) | **Deprecated.** Description provides short text functionality.<br/> A short description of the node. <p> This field SHALL NOT be populated. |
| RSA_PubKey | [string](#string) | A hexadecimal String encoding of an X509 public key. <p> This X509 RSA _public_ key SHALL be used to verify record stream files (e.g., record stream files).<br/> This field SHALL be a string of hexadecimal characters, encoded UTF-8, which, translated to binary, form the public key DER encoding. |
| nodeId | [int64](#int64) | A numeric identifier for the node. <p> This value SHALL NOT be sequential. <p> A `0.0.101` field |
| nodeAccountId | [AccountID](#proto-AccountID) | An account to be paid the "node" portion of transaction fees.<br/> The "node" fees are paid to the node that submitted the transaction. <p> A `0.0.101` field |
| nodeCertHash | [bytes](#bytes) | A hash of the node's TLS certificate. <p> This field SHALL be a string of hexadecimal characters, encoded UTF-8, which, translated to binary, form a SHA-384 hash of the node's TLS certificate in PEM format. This TLS certificate MUST be encoded UTF-8 and normalized according to the NFKD form prior to computing the hash value.<br/> The value of this field SHALL be used to verify the node TLS certificate when presented during protocol negotiation. <p> A `0.0.101` field |
| serviceEndpoint | [ServiceEndpoint](#proto-ServiceEndpoint) | A node's service IP addresses and TCP ports.<br/> Nodes require multiple endpoints to ensure that inter-node communication (e.g. gossip) is properly separated from client communication to API endpoints. <p> A `0.0.101` field |
| description | [string](#string) | A short description of the node. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8. |
| stake | [int64](#int64) | **Deprecated.** This is replaced by per-account stake tracking and dynamic calculation.<br/> The amount of tinybar staked to the node.<br/> This value SHOULD NOT be populated, and SHALL be ignored. |






<a name="proto-NodeAddressBook"></a>

### NodeAddressBook
A list of nodes and their metadata that contains details of the nodes
running the network.

Used to parse the contents of system files `0.0.101` and `0.0.102`.


| Field | Type | Description |
| ----- | ---- | ----------- |
| nodeAddress | [NodeAddress](#proto-NodeAddress) | Published data for all nodes in the network |






<a name="proto-PendingAirdropId"></a>

### PendingAirdropId
A unique, composite, identifier for a pending airdrop.

Each pending airdrop SHALL be uniquely identified by
a `PendingAirdropId`.<br/>
A `PendingAirdropId` SHALL be recorded when created and MUST be provided in
any transaction that would modify that pending airdrop
(such as a `claimAirdrop` or `cancelAirdrop`).


| Field | Type | Description |
| ----- | ---- | ----------- |
| sender_id | [AccountID](#proto-AccountID) | A sending account. <p> This is the account that initiated, and SHALL fund, this pending airdrop.<br/> This field is REQUIRED. |
| receiver_id | [AccountID](#proto-AccountID) | A receiving account. <p> This is the ID of the account that SHALL receive the airdrop.<br/> This field is REQUIRED. |
| fungible_token_type | [TokenID](#proto-TokenID) | A token identifier.<br/> This is the type of token for a fungible/common token airdrop. <p> This field is REQUIRED for a fungible/common token and MUST NOT be used for a non-fungible/unique token. |
| non_fungible_token | [NftID](#proto-NftID) | The id of a single NFT<br/> This is the type of token for a non-fungible/unique token airdrop and consists of a Token ID and serial number. <p> This field is REQUIRED for a non-fungible/unique token and MUST NOT be used for a fungible/common token. |






<a name="proto-PendingAirdropValue"></a>

### PendingAirdropValue
A single pending airdrop value.

This message SHALL record the airdrop amount for a
fungible/common token.<br/>
This message SHOULD be null for a non-fungible/unique token.<br/>
If a non-null `PendingAirdropValue` is set for a non-fungible/unique
token, the amount field MUST be `0`.

It is RECOMMENDED that implementations store pending airdrop information
as a key-value map from `PendingAirdropId` to `PendingAirdropValue`, with
a `null` value used for non-fungible pending airdrops.


| Field | Type | Description |
| ----- | ---- | ----------- |
| amount | [uint64](#uint64) | An amount to transfer for fungible/common tokens.<br/> This is expressed in the smallest available units for that token (i.e. 10<sup>-`decimals`</sup> whole tokens). <p> This amount SHALL be transferred from the sender to the receiver, if claimed.<br/> If the token is a fungible/common token, this value MUST be strictly greater than `0`.<br/> If the token is a non-fungible/unique token, this message SHOULD NOT be set, and if set, this field MUST be `0`. |






<a name="proto-RealmID"></a>

### RealmID
A realm identifier.<br/>
Within a given shard, every realm has a unique numeric identifier.
Each account, file, and contract instance belongs to exactly one realm.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |






<a name="proto-ScheduleID"></a>

### ScheduleID
An unique identifier for a Schedule


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard |
| realmNum | [int64](#int64) | A whole number realm |
| scheduleNum | [int64](#int64) | A whole number schedule, unique within its realm and shard |






<a name="proto-SemanticVersion"></a>

### SemanticVersion
A software version according to "[semantic versioning](https://semver.org/)"
or "date versioning".

Hedera currently modifies the "typical" semantic versioning somewhat, the
`major` version is always `0`, and each release increments the `minor`
version. The `patch` and `pre` components are used in the typical manner.
The `build` component is not generally used.


| Field | Type | Description |
| ----- | ---- | ----------- |
| major | [int32](#int32) | A major version.<br/> Hedera does not increment this value and retains a `0` value to indicate that API may change for any release. <p> This value SHALL increment for an incompatible API change.<br/> |
| minor | [int32](#int32) | A minor version.<br/> Hedera increments this value with each release.<br/> There may be incompatible API changes in any Hedera Services release. <p> This value SHALL increment for backwards-compatible new functionality. |
| patch | [int32](#int32) | A patch version. <p> This value SHALL increment for backwards-compatible bug fixes. |
| pre | [string](#string) | A pre-release version. <p> This MAY be denoted by appending a hyphen and a series of dot separated identifiers per [Semver Specification](https://semver.org/#spec-item-9); given a string `0.14.0-alpha.1+21AF26D3`, this field would contain 'alpha.1' |
| build | [string](#string) | A build version. <p> Build version MAY be denoted by appending a plus sign and a series of dot separated identifiers immediately following the patch or pre-release version per [Semver Specification](https://semver.org/#spec-item-10); so given a string `0.14.0-alpha.1+21AF26D3`, this field would contain '21AF26D3' |






<a name="proto-ServiceEndpoint"></a>

### ServiceEndpoint
A network node endpoint.<br/>
Each network node in the global address book publishes one or more endpoints
which enable the nodes to communicate both with other nodes, for gossip, and
with clients to receive transaction requests.

This message supports IPv4 with address and TCP port,
and MAY include a FQDN instead of an IP address.<br/>
IPv6 is not currently supported.

When the `domain_name` field is set, the `ipAddressV4` field
MUST NOT be set.<br/>
When the `ipAddressV4` field is set, the `domain_name` field
MUST NOT be set.


| Field | Type | Description |
| ----- | ---- | ----------- |
| ipAddressV4 | [bytes](#bytes) | A 32-bit IPv4 address.<br/> This is the address of the endpoint, encoded in pure "big-endian" (i.e. left to right) order (e.g. `127.0.0.1` has hex bytes in the order `7F`, `00`, `00`, `01`). |
| port | [int32](#int32) | A TCP port to use. <p> This value MUST be between 0 and 65535, inclusive. |
| domain_name | [string](#string) | A node domain name. <p> This MUST be the fully qualified domain name of the node.<br/> This value MUST NOT exceed 253 characters.<br/> When the `domain_name` field is set, the `ipAddressV4` field MUST NOT be set.<br/> When the `ipAddressV4` field is set, the `domain_name` field MUST NOT be set. |






<a name="proto-ServicesConfigurationList"></a>

### ServicesConfigurationList
Setting values representing a source of runtime configuration information.


| Field | Type | Description |
| ----- | ---- | ----------- |
| nameValue | [Setting](#proto-Setting) | A List of `Setting` values, typically read from application properties. |






<a name="proto-Setting"></a>

### Setting
A single runtime configuration setting.

Typically a name-value pair, this may also contain a small amount of
associated data.


| Field | Type | Description |
| ----- | ---- | ----------- |
| name | [string](#string) | A name for this setting property. |
| value | [string](#string) | A value for this setting property. |
| data | [bytes](#bytes) | A small quantity of data associated with this setting. <p> This SHOULD be less than 100 bytes.<br/> If the value is a string, it MUST be encoded UTF-8. |






<a name="proto-ShardID"></a>

### ShardID
A shard identifier.<br/>
A shard is a partition of nodes running the network that processes
transactions separately from other shards. Each shard is effectively an
independent instance of the overall network that shares the same virtual
distributed ledger, and may gossip cross-shard transactions with other
shards to maintain overall correct processing of the ledger.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |






<a name="proto-Signature"></a>

### Signature
This message is deprecated and MUST NOT be used to communicate with
network nodes. It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the `SignaturePair` and `SignatureMap` messages instead of
this message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| contract | [bytes](#bytes) | Smart contract virtual signature (always length zero). |
| ed25519 | [bytes](#bytes) | Ed25519 signature bytes. |
| RSA_3072 | [bytes](#bytes) | RSA-3072 signature bytes. |
| ECDSA_384 | [bytes](#bytes) | ECDSA p-384 signature bytes. |
| thresholdSignature | [ThresholdSignature](#proto-ThresholdSignature) | A list of signatures for a single N-of-M threshold Key. This must be a list of exactly M signatures, at least N of which are non-null. |
| signatureList | [SignatureList](#proto-SignatureList) | A list of M signatures, each corresponding to a Key in a KeyList of the same length. |






<a name="proto-SignatureList"></a>

### SignatureList
This message is deprecated and MUST NOT be used to communicate with network
nodes. It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the `SignaturePair` and `SignatureMap` messages instead of
this message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| sigs | [Signature](#proto-Signature) | Each signature corresponds to a Key in the KeyList. |






<a name="proto-SignatureMap"></a>

### SignatureMap
A set of signatures corresponding to every unique public key that
signed a given transaction.

If any public key matches more than one prefix in the signature map,
the transaction containing that map SHALL fail immediately with the
response code `KEY_PREFIX_MISMATCH`.


| Field | Type | Description |
| ----- | ---- | ----------- |
| sigPair | [SignaturePair](#proto-SignaturePair) | A list of signature pairs for a specific transaction.<br/> Each signature pair represents a single cryptographic (`primitive`) public key identified by a "prefix" value and the cryptographic signature produced for that key. |






<a name="proto-SignaturePair"></a>

### SignaturePair
A public key and signature pair.<br/>
Only Ed25519 and ECDSA(secp256k1) keys and signatures are currently supported
as cryptographic (non-implied) signatures.


| Field | Type | Description |
| ----- | ---- | ----------- |
| pubKeyPrefix | [bytes](#bytes) | Prefix bytes of the public key. <p> The client may use any number of bytes from zero to the whole length of the public key for pubKeyPrefix. If zero bytes are used, then it MUST be true that only one cryptographic key is required to sign the associated transaction.<br/> If the `pubKeyPrefix` is 0 bytes and more than a single cryptographic key is required to sign the transaction, the request SHALL resolve to `INVALID_SIGNATURE`. <blockquote>Important Note<blockquote> In the special case that a signature is provided to authorize a precompiled contract, the `pubKeyPrefix` MUST contain the _entire public key_.<br/> That is, if the key is an Ed25519 key, the `pubKeyPrefix` MUST be 32 bytes long and contain the full public key bytes.<br/> If the key is an ECDSA(secp256k1) key, the `pubKeyPrefix` MUST be 33 bytes long and contain the full _compressed_ form of the public key. </blockquote></blockquote> <p> <dl><dt>Purpose</dt> <dd>The `pubKeyPrefix` exists to save cost. A signed transaction with shorter prefixes will have fewer bytes, and so will have a lower transaction fee. The prefixes, however, MUST be long enough to distinguish between all of the public keys that might be signing the transaction. Therefore, software signing a transaction SHOULD evaluate which keys might possibly be required to sign a transaction, and ensure that the shortest prefix that is sufficient to unambiguously identify the correct key is used. </dd></dl> |
| contract | [bytes](#bytes) | A smart contract virtual signature. <p> This value MUST be length zero, if set. |
| ed25519 | [bytes](#bytes) | An Ed25519 signature. |
| RSA_3072 | [bytes](#bytes) | **Deprecated.** This option is not supported.<br/> A RSA-3072 signature. |
| ECDSA_384 | [bytes](#bytes) | **Deprecated.** This option is not supported.<br/> ECDSA p-384 signature. |
| ECDSA_secp256k1 | [bytes](#bytes) | An ECDSA(secp256k1) signature. |






<a name="proto-StakingInfo"></a>

### StakingInfo
Staking information for an account or a contract.

This is used for responses returned from `CryptoGetInfo` or
`ContractGetInfo` queries.


| Field | Type | Description |
| ----- | ---- | ----------- |
| decline_reward | [bool](#bool) | A flag indicating that the holder of this account has chosen to decline staking rewards. |
| stake_period_start | [Timestamp](#proto-Timestamp) | A `Timestamp` of the start time for the latest active staking period. <p> This MUST be a period during which either the staking settings for this account or contract changed or the account or contract received staking rewards, whichever is later. Examples of a change in staking settings include starting staking or changing the staked_node_id.<br/> If this account or contract is not currently staked to a node, then this field SHALL NOT be set. |
| pending_reward | [int64](#int64) | An amount, in tinybar, to be received in the next reward payout.<br/> Rewards are not paid out immediately; for efficiency reasons rewards are only paid out as part of another transaction involving that account. |
| staked_to_me | [int64](#int64) | A proxy-staked balance.<br/> The total HBAR balance of all accounts that delegate staking to this account or contract. |
| staked_account_id | [AccountID](#proto-AccountID) | A delegated stake. <p> This account delegates to the indicated account for staking purposes. |
| staked_node_id | [int64](#int64) | A direct stake. <p> This accounts stakes its balance to the designated node. |






<a name="proto-ThresholdKey"></a>

### ThresholdKey
A threshold value and a list of public keys that, together, form a threshold
signature requirement. Any subset of the keys in the list may satisfy the
signature requirements of this type of key, provided the number of keys meets
or exceeds the threshold. For example, if a particular key has a threshold of
three(3) and eight(8) keys in the list, then any three(3) signatures, from
the list of eight(8), is sufficient to authorize that key.

For threshold purposes, all signatures from a single `primitive` key are
considered a single signature, so that signature(s) from a single key SHALL
NOT _directly_ meet a threshold greater than one(1).

#### Note
> It is possible to construct a complex key structure that _would_ enable a
> single primitive key to successfully meet a threshold requirement. All
> threshold keys SHOULD be carefully audited to ensure no one `primitive`
> key, or smart contract, has disproportionate capability.


| Field | Type | Description |
| ----- | ---- | ----------- |
| threshold | [uint32](#uint32) | A transaction MUST have valid signatures from at least this number of separate keys, from the `keys` list to be authorized by this key. |
| keys | [KeyList](#proto-KeyList) | A list of the keys that MAY satisfy signature requirements of this key. |






<a name="proto-ThresholdSignature"></a>

### ThresholdSignature
This message is deprecated and MUST NOT be used to communicate with network
nodes. It is retained here only for historical reasons.

Client software MUST NOT include this message in any request. <br/>
Compliant nodes SHALL NOT accept any request containing this message.

Please use the `SignaturePair` and `SignatureMap` messages, in combination
with `ThresholdKey` keys, instead of this message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| sigs | [SignatureList](#proto-SignatureList) | For an N-of-M threshold key, this is a list of M signatures, at least N of which must be non-null. |






<a name="proto-TokenAssociation"></a>

### TokenAssociation
An association between a token and an account.

An account must be associated with a token before that account can transact
in (send or receive) that token.


| Field | Type | Description |
| ----- | ---- | ----------- |
| token_id | [TokenID](#proto-TokenID) | A token identifier for the associated token. |
| account_id | [AccountID](#proto-AccountID) | An account identifier for the associated account. |






<a name="proto-TokenBalance"></a>

### TokenBalance
A number of _transferable units_ of a specified token.

The transferable unit of a token is its smallest denomination, as given by
the token's `decimals` property. Each minted token contains
10<sup>`decimals`</sup> transferable units. For example, we could think of
the cent as the transferable unit of the US dollar (`decimals=2`); and the
tinybar as the transferable unit of HBAR (`decimals=8`).

Transferable units are not directly comparable across different tokens.


| Field | Type | Description |
| ----- | ---- | ----------- |
| tokenId | [TokenID](#proto-TokenID) | A token identifier. |
| balance | [uint64](#uint64) | A number of transferable units of the identified token. <p> For fungible/common tokens this SHALL be the balance, in units of 10<sup>`-decimals`</sup> whole tokens.<br/> For non-fungible/unique tokens, this SHALL be the number of individual unique tokens in this balance. |
| decimals | [uint32](#uint32) | A number of "decimals" precision. <p> This MUST match the `decimals` value for the token identified by the `tokenId` field. |






<a name="proto-TokenBalances"></a>

### TokenBalances
A set of token balance values.

Each entry describes the balance the enclosing account holds for a specific
token. The balance is an amount for a fungible/common token or a count for
a non-fungible/unique token.


| Field | Type | Description |
| ----- | ---- | ----------- |
| tokenBalances | [TokenBalance](#proto-TokenBalance) | A list of token balance values.<br/> Each entry represents a single account balance for a single token. |






<a name="proto-TokenID"></a>

### TokenID
Unique identifier for a token.<br/>
As with all entity identifiers within the network, a token identifier
consists of a combination of shard number, realm number, and entity number.
Each of these numbers is unique within its scope (shard > realm > entity).


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |
| tokenNum | [int64](#int64) | A whole number token identifier. |






<a name="proto-TokenRelationship"></a>

### TokenRelationship
An Hedera Token Service token relationship. A token relationship describes
the connection between an Account and a Token type, including the current
account balance in that token.

A `TokenRelationship` SHALL contain, for the designated token and enclosing
account, The account's current balance, whether the account has KYC granted,
whether the assets are frozen and whether the association was automatic.<br/>
A `TokenRelationship` MAY also contain the `symbol` and `decimals` values
copied from the token.<br/>
`TokenRelationship` entries SHALL be valid only within the context of a
`GetAccountDetails` query response, or other enclosing message, which
specifies the account side of the relationship.


| Field | Type | Description |
| ----- | ---- | ----------- |
| tokenId | [TokenID](#proto-TokenID) | A token identifier. <p> This MUST match an existing token that is not deleted. |
| symbol | [string](#string) | A token symbol. <p> This MUST match an existing token that is not deleted.<br/> This MUST match the value for the token identified in `tokenId`. |
| balance | [uint64](#uint64) | An account balance for this token. <p> For fungible/common tokens this SHALL be the balance that the account holds of that token. The value is provided as an integer amount of the smallest unit of the token (i.e. 10<sup>`-decimals`</sup> whole tokens).<br/> For non-fungible/unique tokens this SHALL be the whole number of unique tokens held by the account for this token type. |
| kycStatus | [TokenKycStatus](#proto-TokenKycStatus) | A KYC status for the account with respect to this token. <p> This may be `KycNotApplicable`, `Granted` or `Revoked` and, if KYC is not supported for this token (e.g. the `kyc_key` of the token is not set), this SHALL be `KycNotApplicable`. |
| freezeStatus | [TokenFreezeStatus](#proto-TokenFreezeStatus) | A Freeze status for the account with respect to this token. <p> This value SHALL be one of `FreezeNotApplicable`, `Frozen` or `Unfrozen`.<br/> If the token cannot freeze account assets (e.g. the `freeze_key` of the token is not set), this SHALL be `FreezeNotApplicable`. |
| decimals | [uint32](#uint32) | A maximum "precision" for this token. <p> This value MUST match the `decimals` field of the token identified in the `tokenId` field.<br/> A single whole token SHALL be divided into at most 10<sup>`decimals`</sup> sub-units. |
| automatic_association | [bool](#bool) | An automatic association flag. <p> This SHALL be set if the relationship was created implicitly (automatically).<br/> This SHALL be unset if the relationship was created explicitly (manually) via a `TokenAssociate` transaction. |






<a name="proto-TokenTransferList"></a>

### TokenTransferList
A list of transfers for a particular (non-HBAR) token type.

A `TokenTransferList` applies to a single token type, but may contain many
individual transfers.<br/>
Each transfer of a fungible/common token MUST specify an `accountID` and
`amount`. Amount SHALL be positive when the account receives tokens, and
SHALL be negative when the account sends tokens. The amount SHOULD NOT be
`0`.<br/>
In a transfer list containing fungible/common tokens in the `transfers`
list, the sum of all such transfers MUST be zero (`0`).
Each transfer of a unique token SHALL specify both sender and receiver, as
well as the serial number transferred.<br/>
A single `TokenTransferList` MUST contain `transfers` or `nftTransfers`,
but MUST NOT contain both.


| Field | Type | Description |
| ----- | ---- | ----------- |
| token | [TokenID](#proto-TokenID) | A token identifier.<br/> This is the token to be transferred. |
| transfers | [AccountAmount](#proto-AccountAmount) | A list of account amounts. <p> Each entry SHALL have an account and amount.<br/> These transfers SHALL be "double-entry" style; the credits (positive amount) and debits (negative amount) MUST sum to 0, unless this transfer list is part of a `mint` or `burn` operation.<br/> This SHALL be be set for fungible/common tokens and MUST be empty otherwise. |
| nftTransfers | [NftTransfer](#proto-NftTransfer) | A list of NftTransfers. <p> Each entry SHALL have a sender and receiver account, and the serial number of the unique token to transfer.<br/> This SHALL be be set for non-fungible/unique tokens and SHALL be empty otherwise. |
| expected_decimals | [google.protobuf.UInt32Value](#google-protobuf-UInt32Value) | An expected decimal precision.<br/> This is the number of decimals a fungible/common token type is _expected_ to have. <p> The transfer SHALL fail with response code `UNEXPECTED_TOKEN_DECIMALS` if this is set and the actual decimals specified for the `Token` differ from this value.<br/> If `nftTransfers` is set, then this value SHOULD NOT be set. |






<a name="proto-TopicID"></a>

### TopicID
An unique identifier for a topic.<br/>
Topics are part of the consensus service, messages are published to a topic.


| Field | Type | Description |
| ----- | ---- | ----------- |
| shardNum | [int64](#int64) | A whole number shard identifier. |
| realmNum | [int64](#int64) | A whole number realm identifier. |
| topicNum | [int64](#int64) | A whole number topic identifier, unique within its realm and shard. |






<a name="proto-TransactionFeeSchedule"></a>

### TransactionFeeSchedule
The fee schedule for a specific transaction or query based on the fee data.


| Field | Type | Description |
| ----- | ---- | ----------- |
| hederaFunctionality | [HederaFunctionality](#proto-HederaFunctionality) | An enumeration for a particular transaction or query.<br/> The functionality type determines the base cost parameters. |
| feeData | [FeeData](#proto-FeeData) | **Deprecated.** Use `fees` instead of this field.<br/> Resource price coefficients. |
| fees | [FeeData](#proto-FeeData) | The resource price coefficients for transaction type and any applicable subtypes.<br/> The multiple entries enable support for subtype price definitions. |






<a name="proto-TransactionID"></a>

### TransactionID
A transaction identifier.<br/>
This is used for retrieving receipts and records for a transaction
and internally by the network for detecting when duplicate transactions are
submitted.

A transaction may be processed more reliably by submitting it to
several nodes, each with a different node account, but all with the same
TransactionID. Then, the transaction will take effect when the first of all
those nodes submits the transaction and it reaches consensus. The other
transactions SHALL NOT be executed (and SHALL result in a
`DUPLICATE_TRANSACTION` response).<br/>
Multiple submission increase reliability on the assumption that an error in,
for example, network connectivity will not affect all nodes equally. Latency
might be slightly lower, if one node is handling intake significantly slower
than others, for example. The base transaction fee is required for each
submission, however, so the total fees charged are significantly higher when
using this approach.

### Requirements
Each transaction identifier MUST be unique.<br/>
Multiple transactions MAY be submitted with the same transaction
identifier, but all except the first SHALL be rejected as duplicate
transactions.<br/>
An identifier MUST specify a `payer` account to be charged all fees
associated with the transaction.<br/>
The `payer` account MUST exist and MUST have sufficient HBAR to pay all
transaction fees.<br/>
An identifier MUST specify a "valid start time".<br/>
The "valid start time" MUST be strictly _earlier_ than the current
network consensus time when submitted.<br/>
The "valid start time" MUST NOT be more than `transaction.maxValidDuration`
seconds before the current network consensus time when submitted.<br/>
A client-submitted transaction MUST NOT set the `scheduled` flag.

### Additional Notes

Additional items applicable to Scheduled Transactions:

 - The ID of a Scheduled Transaction, once executed, SHALL inherit both
   `transactionValidStart` and `accountID` from the `ScheduleCreate`
   transaction that created the schedule.
 - The `scheduled` property SHALL be set for Scheduled Transactions.


| Field | Type | Description |
| ----- | ---- | ----------- |
| transactionValidStart | [Timestamp](#proto-Timestamp) | A timestamp for the transaction start time.<br/> This is the earliest expected start time for this transaction. <p> This value MUST be strictly less than `consensusTimestamp` when the transaction is submitted. |
| accountID | [AccountID](#proto-AccountID) | An Account identifier. <p> The identified account SHALL pay transaction fees for this transaction. |
| scheduled | [bool](#bool) | A scheduled transaction flag.<br/> If set, this transaction represents the execution of a Schedule after all necessary signatures are gathered. <p> This flag MUST NOT be set in a user-submitted transaction. |
| nonce | [int32](#int32) | An identifier for an internal transaction.<br/> An internal transaction is one that was spawned as part of handling a user transaction. These internal transactions share the transactionValidStart and accountID of the user transaction, so a nonce is necessary to give them a unique TransactionID. <p> An example is when a "parent" ContractCreate or ContractCall transaction calls one or more HTS precompiled contracts; each of the "child" transactions spawned for a precompile has a transaction id with a different nonce. <p> This value MUST be unset for user-submitted transactions. |






<a name="proto-TransferList"></a>

### TransferList
A list of accounts and amounts to transfer.

Each `AccountAmount` SHALL specify the account and the amount to
send(negative) or receive(positive).<br/>
Each `TransferList` SHALL be contained in another message that contains
other details required to complete a transfer. This is typically a
`CryptoTransferTransactionBody` or `TransactionRecord`.<br/>
The `TransferList` SHALL only be used for HBAR transfers. Other token types
MUST use the `TokenTransferList` message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| accountAmounts | [AccountAmount](#proto-AccountAmount) | A list of AccountAmount pairs.<br/> Each entry in this list is an account and an amount to transfer into it (positive) or out of it (negative) |





 <!-- end messages -->


<a name="proto-BlockHashAlgorithm"></a>

### BlockHashAlgorithm
A specific hash algorithm.

We did not reuse Record Stream `HashAlgorithm` here because in all cases,
currently, this will be `SHA2_384` and if that is the default value then
we can save space by not serializing it, whereas `HASH_ALGORITHM_UNKNOWN`
is the default for Record Stream `HashAlgorithm`.

Note that enum values here MUST NOT match the name of any other enum value
in the same `package`, as protobuf follows `C++` scope rules and all enum
_names_ are treated as global constants within the `package`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SHA2_384 | 0 | A SHA2 algorithm SHA-384 hash. <p> This is the default value, if a field of this enumerated type is not set, then this is the value that will be decoded when the serialized message is read. |



<a name="proto-HederaFunctionality"></a>

### HederaFunctionality
The transactions and queries supported by Hedera Hashgraph.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NONE | 0 | Unused - The first value is unused because this default value is ambiguous with an "unset" value and therefore should not be used. |
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
| ContractCallLocal | 16 | Execute a local smart contract call.<br/> Used by contracts to call other contracts. |
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
| TokenFreezeAccount | 59 | Freeze a specific account with respect to a specific HTS token. <p> Once this transaction completes that account CANNOT send or receive the specified token. |
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
| TokenGetAccountNftInfos | 74 | Get NFT metadata (information) for a range of NFTs associated to a specific non-fungible/unique HTS token and owned by a specific account. |
| TokenGetNftInfo | 75 | Get metadata (information) for a specific NFT identified by token and serial number. |
| TokenGetNftInfos | 76 | Get NFT metadata (information) for a range of NFTs associated to a specific non-fungible/unique HTS token. |
| TokenFeeScheduleUpdate | 77 | Update a token's custom fee schedule. <p> If a transaction of this type is not signed by the token `fee_schedule_key` it SHALL fail with INVALID_SIGNATURE, or TOKEN_HAS_NO_FEE_SCHEDULE_KEY if there is no `fee_schedule_key` set. |
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
| NodeCreate | 89 | Create a node |
| NodeUpdate | 90 | Update a node |
| NodeDelete | 91 | Delete a node |
| TokenReject | 92 | Transfer one or more token balances held by the requesting account to the treasury for each token type. |
| TokenAirdrop | 93 | Airdrop one or more tokens to one or more accounts. |
| TokenCancelAirdrop | 94 | Remove one or more pending airdrops from state on behalf of the sender(s) for each airdrop. |
| TokenClaimAirdrop | 95 | Claim one or more pending airdrops |
| TssMessage | 96 | A message produced as part of Threshold Signature Scheme (TSS) processing. |
| TssVote | 97 | Submit a vote as part of the Threshold Signature Scheme (TSS) processing. |
| TssShareSignature | 98 | Submit a node signature as part of the Threshold Signature Scheme (TSS) processing. |
| TssEncryptionKey | 99 | Submit a node public tss encryption key as part of the Threshold Signature Scheme (TSS). |
| StateSignatureTransaction | 100 | Submit a signature of a state root hash gossiped to other nodes |



<a name="proto-SubType"></a>

### SubType
A transaction sub type.<br/>
This enumeration enables a set of transaction base fees to be broadly
defined for a type of operation and also be modified, when necessary,
based on specifics of the operation.

### Explanation
The resource cost for a TokenMint operation is different between minting
fungible/common and non-fungible/unique tokens. This `enum` is used to
"mark" a cost as applying to one or the other.<br/>
Similarly, the resource cost for a basic `tokenCreate` without a custom
fee schedule may yield a _base_ fee of $1. The resource cost for a
`tokenCreate` _with_ a custom fee schedule is different and may yield a
_base_ fee of $2 or more.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DEFAULT | 0 | The resource cost for the transaction type has no additional attributes |
| TOKEN_FUNGIBLE_COMMON | 1 | The resource cost for the transaction type includes an operation on a fungible/common token |
| TOKEN_NON_FUNGIBLE_UNIQUE | 2 | The resource cost for the transaction type includes an operation on a non-fungible/unique token |
| TOKEN_FUNGIBLE_COMMON_WITH_CUSTOM_FEES | 3 | The resource cost for the transaction type includes an operation on a fungible/common token with a custom fee schedule |
| TOKEN_NON_FUNGIBLE_UNIQUE_WITH_CUSTOM_FEES | 4 | The resource cost for the transaction type includes an operation on a non-fungible/unique token with a custom fee schedule |
| SCHEDULE_CREATE_CONTRACT_CALL | 5 | The resource cost for the transaction type includes a ScheduleCreate containing a ContractCall. |



<a name="proto-TokenFreezeStatus"></a>

### TokenFreezeStatus
Possible token freeze status values.

This is returned by `TokenGetInfoQuery` or `CryptoGetInfoResponse`
in `TokenRelationship`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FreezeNotApplicable | 0 | The token does not support freeze or cannot be frozen for the designated account.<br/> Typically this indicates that the token does not have a `freeze_key` set. |
| Frozen | 1 | The token is currently frozen for the designated account. |
| Unfrozen | 2 | The token is not currently frozen for the designated account. |



<a name="proto-TokenKeyValidation"></a>

### TokenKeyValidation
Types of validation strategies for token keys.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FULL_VALIDATION | 0 | Perform all token key validations.<br/> This is the default value and behavior. |
| NO_VALIDATION | 1 | Perform no validations at all for all passed token keys. |



<a name="proto-TokenKycStatus"></a>

### TokenKycStatus
Possible token "KYC" status values.

This is returned by `TokenGetInfoQuery` or `CryptoGetInfoResponse`
in `TokenRelationship`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| KycNotApplicable | 0 | The token does not support KYC or cannot grant KYC for the designated account.<br/> Typically this indicates that the token does not have a `kyc_key` set. |
| Granted | 1 | The designated account is currently granted KYC status for the designated token. |
| Revoked | 2 | The designated account is not currently granted KYC status for the designated token. |



<a name="proto-TokenPauseStatus"></a>

### TokenPauseStatus
Possible Pause status values.

This is returned by `TokenGetInfoQuery` in `TokenRelationship`.

| Name | Number | Description |
| ---- | ------ | ----------- |
| PauseNotApplicable | 0 | The token does not support pause or cannot be paused.<br/> Typically this indicates that the token does not have a `pause_key` set. |
| Paused | 1 | The token is currently paused. |
| Unpaused | 2 | The token is not currently paused. |



<a name="proto-TokenSupplyType"></a>

### TokenSupplyType
Possible Token Supply Types (IWA Compatibility).

This `enum` indicates the limit of tokens that can exist during the
lifetime of a token definition. The "infinite" supply is only theoretically
infinite, as it is still limited to the magnitude of a 64-bit signed
integer. A "finite" supply is further limited to a value specified when
the token is created (or updated, if not immutable).

| Name | Number | Description |
| ---- | ------ | ----------- |
| INFINITE | 0 | An unlimited supply.<br/> This indicates that tokens of this type have an upper bound of Long.MAX_VALUE.<br/> The supply is accounted in the smallest units of the token (i.e. 10<sup>-`decimals`</sup> whole tokens) |
| FINITE | 1 | A limited supply.<br/> This indicates that tokens of this type have an upper bound of `maxSupply`.<br/> The maximum supply SHALL be provided on token creation, but MAY be changed thereafter if the token has an `admin_key` set. |



<a name="proto-TokenType"></a>

### TokenType
Possible Token Types (IWA Compatibility).

Apart from fungible and non-fungible, Tokens can have either a common or
unique representation. Furthermore, tokens can have intrinsic or referential
value, and can be whole and indivisible or fractional.<br/>
These distinction might seem subtle, but it is important when considering
how tokens can be traced, used, transferred, and if they can have isolated
unique properties.

A few examples (these may not match enumerations below) using IWA taxonomy.
<dl>
  <dt>fungible, whole, intrinsic, unique</dt>
    <dd>Physical fiat currency</dd>
  <dt>fungible, fractional, intrinsic, common</dt>
    <dd>bank balance fiat currency</dd>
  <dt>non-fungible, fractional, reference, unique</dt>
    <dd>"mutual" collectible/art/property ownership</dd>
  <dt>non-fungible, whole, intrinsic, unique</dt>
    <dd>Physical work of fine art</dd>
  <dt>non-fungible, whole, reference, unique</dt>
    <dd>Registered property title</dd>
</dl>

| Name | Number | Description |
| ---- | ------ | ----------- |
| FUNGIBLE_COMMON | 0 | A fungible/common token.<br/> Tokens of this type are interchangeable with one another, where any quantity of tokens has the same value as another equal quantity, if they are in the same class. Tokens share a single set of properties, and are not distinct from one another. Ownership is represented as a balance or quantity associated to a given account. Tokens may be divided into fractional tokens, within reasonable limits. <p> IWA taxonomy _fungible, fractional, intrinsic, common_ |
| NON_FUNGIBLE_UNIQUE | 1 | A non-fungible/unique token.<br/> Tokens of this type are unique, and are not interchangeable with other tokens of the same type. Each token carries a serial number which is unique for that token, these tokens may have a different trade value for each individual token. The tokens are individually accounted and often carry additional unique properties. Tokens cannot be subdivided, and value is related to what the individual token represents. <p> IWA taxonomy _non-fungible, whole, reference, unique_ |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



