## Table of Contents

- [stream/output/state_changes.proto](#stream_output_state_changes-proto)
    - [MapChangeKey](#com-hedera-hapi-block-stream-output-MapChangeKey)
    - [MapChangeValue](#com-hedera-hapi-block-stream-output-MapChangeValue)
    - [MapDeleteChange](#com-hedera-hapi-block-stream-output-MapDeleteChange)
    - [MapUpdateChange](#com-hedera-hapi-block-stream-output-MapUpdateChange)
    - [NewStateChange](#com-hedera-hapi-block-stream-output-NewStateChange)
    - [QueuePopChange](#com-hedera-hapi-block-stream-output-QueuePopChange)
    - [QueuePushChange](#com-hedera-hapi-block-stream-output-QueuePushChange)
    - [RemovedStateChange](#com-hedera-hapi-block-stream-output-RemovedStateChange)
    - [SingletonUpdateChange](#com-hedera-hapi-block-stream-output-SingletonUpdateChange)
    - [StateChange](#com-hedera-hapi-block-stream-output-StateChange)
    - [StateChanges](#com-hedera-hapi-block-stream-output-StateChanges)
  
    - [NewStateType](#com-hedera-hapi-block-stream-output-NewStateType)
    - [StateIdentifier](#com-hedera-hapi-block-stream-output-StateIdentifier)
  



<a name="stream_output_state_changes-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/state_changes.proto
# State Changes
Serialization of change records which describe the mutation of state
during a block.

The _ordered_ application of all `StateChanges` in a block to an initial
state that matches network state at the beginning of that block MUST produce
a resultant state that matches the network state at the end of that block.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-MapChangeKey"></a>

### MapChangeKey
A key identifying a specific entry in a key-value "virtual map".


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id_key | [proto.AccountID](#proto-AccountID) |  | A key for a change affecting a map keyed by an Account identifier. |
| token_relationship_key | [proto.TokenAssociation](#proto-TokenAssociation) |  | A change to the token relationships virtual map.<br/> This map is keyed by the pair of account identifier and token identifier. |
| entity_number_key | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | A change to a map keyed by an EntityNumber (which is a whole number). <p> This SHOULD NOT be used. Virtual maps SHOULD be keyed to full identifiers that include shard and realm information. |
| file_id_key | [proto.FileID](#proto-FileID) |  | A change to a virtual map keyed by File identifier. |
| nft_id_key | [proto.NftID](#proto-NftID) |  | A change to a virtual map keyed by NFT identifier. |
| proto_bytes_key | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A change to a virtual map keyed by a byte array. |
| proto_long_key | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  | A change to a virtual map keyed by an int64 value. |
| proto_string_key | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A change to a virtual map keyed by a string value. |
| schedule_id_key | [proto.ScheduleID](#proto-ScheduleID) |  | A change to a virtual map keyed by a Schedule identifier. |
| slot_key_key | [proto.SlotKey](#proto-SlotKey) |  | A change to the EVM storage "slot" virtual map. |
| token_id_key | [proto.TokenID](#proto-TokenID) |  | A change to a virtual map keyed by a Token identifier. |
| topic_id_key | [proto.TopicID](#proto-TopicID) |  | A change to a virtual map keyed by a Topic identifier. |
| contract_id_key | [proto.ContractID](#proto-ContractID) |  | A change to a virtual map keyed by contract id identifier. |
| pending_airdrop_id_key | [proto.PendingAirdropId](#proto-PendingAirdropId) |  | A change to a virtual map keyed by pending airdrop id identifier. |






<a name="com-hedera-hapi-block-stream-output-MapChangeValue"></a>

### MapChangeValue
A value updated in, or added to, a virtual map.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_value | [proto.Account](#proto-Account) |  | An account value. |
| account_id_value | [proto.AccountID](#proto-AccountID) |  | An account identifier.<br/> In some cases a map is used to connect a value or identifier to another identifier. |
| bytecode_value | [proto.Bytecode](#proto-Bytecode) |  | Compiled EVM bytecode. |
| file_value | [proto.File](#proto-File) |  | An Hedera "file" value. <p> <blockquote>REVIEW NOTE<blockquote> A file can become quite large (up to 1048576 bytes).<br/> Do we want to structure file changes separately?<br/> Perhaps a file metadata update and a separate byte array for just the bytes appended (or initial bytes on create). We only allow create/append/delete, so the separate byte array would work and keep the size below 6K per state change. </blockquote></blockquote> |
| nft_value | [proto.Nft](#proto-Nft) |  | A non-fungible/unique token value. |
| proto_string_value | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A string value. |
| schedule_value | [proto.Schedule](#proto-Schedule) |  | A scheduled transaction value. |
| schedule_list_value | [proto.ScheduleList](#proto-ScheduleList) |  | A list of scheduled transactions.<br/> An example for this value is the map of consensus second to scheduled transactions that expire at that consensus time. |
| slot_value_value | [proto.SlotValue](#proto-SlotValue) |  | An EVM storage slot value. |
| staking_node_info_value | [proto.StakingNodeInfo](#proto-StakingNodeInfo) |  | An updated set of staking information for all nodes in the address book. |
| token_value | [proto.Token](#proto-Token) |  | An HTS token value. |
| token_relation_value | [proto.TokenRelation](#proto-TokenRelation) |  | A token relationship value.<br/> These values track which accounts are willing to transact in specific HTS tokens. |
| topic_value | [proto.Topic](#proto-Topic) |  | An HCS topic value. |
| node_value | [com.hedera.hapi.node.state.addressbook.Node](#com-hedera-hapi-node-state-addressbook-Node) |  | An network node value. |
| account_pending_airdrop_value | [proto.AccountPendingAirdrop](#proto-AccountPendingAirdrop) |  | A pending airdrop value. |






<a name="com-hedera-hapi-block-stream-output-MapDeleteChange"></a>

### MapDeleteChange
A removal of a single item from a `VirtualMap`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [MapChangeKey](#com-hedera-hapi-block-stream-output-MapChangeKey) |  | A key in a virtual map. <p> This key SHALL be removed.<br/> The mapped value SHALL also be removed.<br/> This field is REQUIRED. |






<a name="com-hedera-hapi-block-stream-output-MapUpdateChange"></a>

### MapUpdateChange
An update to a single item in a `VirtualMap`.<br/>
Each update consists of a "key" and a "value".
Keys are often identifiers or scalar values.
Values are generally full messages or byte arrays.

The key presented here is not mutable, we do not update map keys.<br/>
The value associated to the key provided is updated, or the value is
added and associated with that key.<br/>
A change of key would be expressed as removal of the prior key and
an addition for the new key.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [MapChangeKey](#com-hedera-hapi-block-stream-output-MapChangeKey) |  | A key in a virtual map. <p> This key MUST be mapped to the value added or updated.<br/> This field is REQUIRED. |
| value | [MapChangeValue](#com-hedera-hapi-block-stream-output-MapChangeValue) |  | A value in a virtual map. <p> This value MUST correctly represent the state of the map entry _after_ the asserted update.<br/> This value MAY be reduced to only transmit fields that differ from the prior state.<br/> This field is REQUIRED. |






<a name="com-hedera-hapi-block-stream-output-NewStateChange"></a>

### NewStateChange
An addition of a new named state.

Adding a new named state SHALL only require the name and type.<br/>
The content of the new state SHALL be filled in via subsequent
state change items specific to the type of state
(e.g. SingletonUpdateChange or MapUpdateChange).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_type | [NewStateType](#com-hedera-hapi-block-stream-output-NewStateType) |  | The type (e.g. Singleton, Virtual Map, Queue) of state to add. |






<a name="com-hedera-hapi-block-stream-output-QueuePopChange"></a>

### QueuePopChange
Removal of an item from a `Queue` state.<br/>

The item removed SHALL be the current "front" (or "head") of the queue.<br/>
Removing from a queue "head" does not, currently, require additional
information beyond the state name common to all state changes.






<a name="com-hedera-hapi-block-stream-output-QueuePushChange"></a>

### QueuePushChange
Addition of an item to a `Queue` state.<br/>

The new item SHALL be added after the current "last" element in the
queue.<br/>
The new item MUST be the same type of value as all other items in the queue.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| proto_bytes_element | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A byte array added to the queue state. |
| proto_string_element | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A string added to the queue state. |
| transaction_record_entry_element | [proto.TransactionRecordEntry](#proto-TransactionRecordEntry) |  | A transaction record entry added to queue state. <p> <blockquote>REVIEW NOTE<blockquote> Do we really intend to push `transaction records` as state changes in the block stream? I would think that any queue holding transaction records is temporary storage (e.g. record cache) and will be removed or replaced with a block item queue as part of the change over to block stream. </blockquote></blockquote> |






<a name="com-hedera-hapi-block-stream-output-RemovedStateChange"></a>

### RemovedStateChange
A removal of a named state.

Removing a named state does not, currently, require additional
information beyond the state name common to all state changes.<br/>
A named state, other than a singleton, SHOULD be empty before it is removed.






<a name="com-hedera-hapi-block-stream-output-SingletonUpdateChange"></a>

### SingletonUpdateChange
An update to a `Singleton` state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_info_value | [proto.BlockInfo](#proto-BlockInfo) |  | A change to the block info singleton. <p> The `BlockInfo` SHALL be updated at the end of every block and SHALL store, among other fields, the last 256 block hash values. <blockquote>REVIEW NOTE<blockquote> The full BlockInfo will be in the state proof, and may not be necessary here.</blockquote></blockquote> |
| congestion_level_starts_value | [proto.CongestionLevelStarts](#proto-CongestionLevelStarts) |  | A change to the congestion level starts singleton. <p> This change SHALL be present if congestion level pricing for general fees or gas fees started during the current block. |
| entity_number_value | [google.protobuf.UInt64Value](#google-protobuf-UInt64Value) |  | A change to the Entity Identifier singleton. <p> The Entity Identifier singleton SHALL track the highest entity identifier used for the current shard and realm and SHALL be used to issue new entity numbers. |
| exchange_rate_set_value | [proto.ExchangeRateSet](#proto-ExchangeRateSet) |  | A change to the exchange rates singleton. <p> This change SHALL be present if the <tt>HBAR&lt;=&gt;USD</tt> exchange rate, as stored in the "midnight rates" singleton changed during the current block. |
| network_staking_rewards_value | [proto.NetworkStakingRewards](#proto-NetworkStakingRewards) |  | A change to the network staking rewards singleton. <p> Network staking rewards SHALL be updated for every non-empty block. |
| bytes_value | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A change to a raw byte array singleton. <p> This change SHALL present a change made to a raw byte array singleton.<br/> The "upgrade file hash" state is an example of a raw byte array singleton. |
| string_value | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A change to a raw string singleton. <p> <dl><dt>Note</dt><dd>There are no current examples of a raw string singleton state.</dd></dl> |
| running_hashes_value | [proto.RunningHashes](#proto-RunningHashes) |  | A change to the running hashes singleton. <p> Running hashes SHALL be updated for each transaction. <p> <blockquote>REVIEW NOTE<blockquote> Running hashes is a record stream item. Can it be elided from the block stream? It's not written to the record stream, as far as I can tell. If we do write this it's adding over 144 bytes for every transaction. It's also not clear how we'll calculate this, as it's a hash of the records currently, so it would have to be a hash of the block items, including this one... </blockquote></blockquote> |
| throttle_usage_snapshots_value | [proto.ThrottleUsageSnapshots](#proto-ThrottleUsageSnapshots) |  | A change to the throttle usage snapshots singleton. <p> Throttle usage snapshots SHALL be updated for _every transaction_ to reflect the amount used for each tps throttle and for the gas throttle. |
| timestamp_value | [proto.Timestamp](#proto-Timestamp) |  | A change to a raw `Timestamp` singleton.<br/> An example of a raw `Timestamp` singleton is the "network freeze time" singleton state, which, if set, stores the time for the next scheduled freeze. |
| block_stream_info_value | [com.hedera.hapi.node.state.blockstream.BlockStreamInfo](#com-hedera-hapi-node-state-blockstream-BlockStreamInfo) |  | A change to the block stream status singleton. <p> This MUST be updated at the beginning of a block, with the information for the immediately prior block. |






<a name="com-hedera-hapi-block-stream-output-StateChange"></a>

### StateChange
A change to any item in the merkle tree.

A State change SHALL represent one mutation of the network state merkle
tree. The state changes published in the block stream MAY be combined
into an ordered set of state mutations that transform the tree from any
initial state to a destination state.<br/>
When the full set of state change items from the block stream for a round
is applied to the network state at the start of that round the result
SHALL match the network state at the end of the round.
TODO: Need documentation for how the merkle tree is constructed.
      Need to reference that document, stored in platform docs?, here.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_id | [uint32](#uint32) |  | A state identifier.<br/> The reason we use an integer field here, and not an enum field is to better support forward compatibility. There will be many cases when a block node or other client (such as a dApp) with HAPI version N wants to process blocks from HAPI version N+1, for example. If we use a protobuf enum then when that is mapped Java or Rust it would not be parsed as an enum value because those languages do not support unknown enum values. ProtoC has a workaround for this but it is complex and requires non-deterministic parsing. Our solution to create an integer field and provide an enumeration for mapping that integer is intended as an acceptable compromise solution. <p> This number SHALL identify the merkle subtree "state" to be modified and often corresponds to a `VirtualMap` identifier. This number SHALL be a valid value for the `StateIdentifier` enum. |
| state_add | [NewStateChange](#com-hedera-hapi-block-stream-output-NewStateChange) |  | Addition of a new state.<br/> This may be a singleton, virtual map, or queue state. |
| state_remove | [RemovedStateChange](#com-hedera-hapi-block-stream-output-RemovedStateChange) |  | Removal of an existing state.<br/> The entire singleton, virtual map, or queue state is removed, and not just the contents. |
| singleton_update | [SingletonUpdateChange](#com-hedera-hapi-block-stream-output-SingletonUpdateChange) |  | An add or update to a `Singleton` state. |
| map_update | [MapUpdateChange](#com-hedera-hapi-block-stream-output-MapUpdateChange) |  | An add or update to a single item in a `VirtualMap`. |
| map_delete | [MapDeleteChange](#com-hedera-hapi-block-stream-output-MapDeleteChange) |  | A removal of a single item from a `VirtualMap`. |
| queue_push | [QueuePushChange](#com-hedera-hapi-block-stream-output-QueuePushChange) |  | Addition of an item to a `Queue` state. |
| queue_pop | [QueuePopChange](#com-hedera-hapi-block-stream-output-QueuePopChange) |  | Removal of an item from a `Queue` state. |






<a name="com-hedera-hapi-block-stream-output-StateChanges"></a>

### StateChanges
A set of state changes.

Each set of changes in the network deterministically mutates the
current state to a new state, and all nodes MUST apply the same
changes in the same order.<br/>
Each change set described in the block stream SHALL describe an
ordered set of mutations which mutate the previous valid state to
produce a new valid state.<br/>
The order of state change sets SHALL be determined by the
`consensus_timestamp`, which is a strictly ascending value
determined by network consensus.

### Consensus Timestamp
This value enables a consumer of the block stream to order state
changes by a consistent ascending value that is determined by network
consensus. A primary use case would be to enter state changes in a
time-series database.<br/>
This value depends on the cause of the state change.
 1. For transactions, this is the transaction consensus timestamp.
 1. For events without transactions, this is the consensus timestamp of
    the event (round?).
 1. For changes that are not the result of a transaction, but still follow
    a transaction within an event, this is the consensus timestamp of the
    preceding transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| consensus_timestamp | [proto.Timestamp](#proto-Timestamp) |  | The consensus timestamp of this set of changes. <p> This value SHALL be deterministic with the cause of the state change. |
| state_changes | [StateChange](#com-hedera-hapi-block-stream-output-StateChange) | repeated | An ordered list of individual changes. <p> These changes MUST be applied in the order listed to produce a correct modified state. |





 <!-- end messages -->


<a name="com-hedera-hapi-block-stream-output-NewStateType"></a>

### NewStateType
An enumeration of the types of named states.<br/>
The default, Singleton, is the type of state most frequently
added and removed.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SINGLETON | 0 |  |
| VIRTUAL_MAP | 1 |  |
| QUEUE | 2 |  |



<a name="com-hedera-hapi-block-stream-output-StateIdentifier"></a>

### StateIdentifier
An informational enumeration of all known states.
This enumeration is included here So that people know the mapping from
integer to state "name".

State changes are expressed in terms of changes to named states at the
high level conceptual model of the state type like map key/values or
queue appends. To say which state the change is on we will include an
`integer` number for the state name. This is done for performance and
efficiency as there will be 10s of thousands of state changes in a block.

We use an integer, and provide this enumeration, for the following reasons.
- If we have a extra 8-10 bytes per state change at 40-50K state changes
  per second then that is an extra 2.5-4 megabits of bandwidth. Compression
  should help a lot but that is not guaranteed.
- When the state name is used as part of complex key in the big state
  merkle map. The smaller the key is, in bytes, the more efficient the
  database is, because more keys can fit in a single disk page.
- When parsing keys, parsing a UTF-8 string to a Java String is a many
  times more expensive than parsing a VARINT to an integer.

Note: This enumeration is never transmitted directly in the block stream.
This enumeration is provided for clients to _interpret_ the value
of the `StateChange`.`state_id` field.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STATE_ID_TOPICS | 0 | A state identifier for the Topics state. |
| STATE_ID_ENTITY_ID | 1 | A state identifier for the next entity Identifier. |
| STATE_ID_ACCOUNTS | 2 | A state identifier for the Accounts state. |
| STATE_ID_ALIASES | 3 | A state identifier for account aliases. |
| STATE_ID_CONTRACT_STORAGE | 4 | A state identifier for contract storage slots. |
| STATE_ID_CONTRACT_BYTECODE | 5 | A state identifier for contract bytecode. |
| STATE_ID_FILES | 6 | A state identifier for Hedera File Service (HFS). |
| STATE_ID_TOKENS | 7 | A state identifier for Hedera Token Service (HTS). |
| STATE_ID_NFTS | 8 | A state identifier for non-fungible/unique tokens. |
| STATE_ID_TOKEN_RELATIONS | 9 | A state identifier for token relationships. |
| STATE_ID_STAKING_INFO | 10 | A state identifier for network staking information. |
| STATE_ID_NETWORK_REWARDS | 11 | A state identifier for network staking rewards. |
| STATE_ID_THROTTLE_USAGE | 12 | A state identifier for throttle usage. |
| STATE_ID_CONGESTION_STARTS | 13 | A state identifier for network congestion start times. |
| STATE_ID_SCHEDULES_BY_ID | 14 | A state identifier for scheduled transactions. |
| STATE_ID_SCHEDULES_BY_EXPIRY | 15 | A state identifier for scheduled transaction expiration. |
| STATE_ID_SCHEDULES_BY_EQUALITY | 16 | A state identifier for scheduled transaction deduplication. |
| STATE_ID_MIDNIGHT_RATES | 17 | A state identifier for conversion rate updates. |
| STATE_ID_RUNNING_HASHES | 18 | A state identifier for the network running hash(es). |
| STATE_ID_BLOCK_INFO | 19 | A state identifier for network block information. |
| STATE_ID_NODES | 20 | A state identifier for address book nodes. |
| STATE_ID_UPGRADE_FILE | 21 | A state identifier for the next "upgrade" file. |
| STATE_ID_UPGRADE_FILE_HASH | 22 | A state identifier for the hash of the next "upgrade" file. |
| STATE_ID_FREEZE_TIME | 23 | A state identifier for the next network freeze time. |
| STATE_ID_BLOCK_STREAM_INFO | 24 | A state identifier for the block stream status singleton. |
| STATE_ID_PENDING_AIRDROPS | 25 | A state identifier for pending airdrops. |
| STATE_ID_RECORD_QUEUE | 126 | A state identifier for the record cache. |
| STATE_ID_UPGRADE_DATA_150 | 10001 | A state for the `150` upgrade file data |
| STATE_ID_UPGRADE_DATA_151 | 10002 | A state for the `151` upgrade file data |
| STATE_ID_UPGRADE_DATA_152 | 10003 | A state for the `152` upgrade file data |
| STATE_ID_UPGRADE_DATA_153 | 10004 | A state for the `153` upgrade file data |
| STATE_ID_UPGRADE_DATA_154 | 10005 | A state for the `154` upgrade file data |
| STATE_ID_UPGRADE_DATA_155 | 10006 | A state for the `155` upgrade file data |
| STATE_ID_UPGRADE_DATA_156 | 10007 | A state for the `156` upgrade file data |
| STATE_ID_UPGRADE_DATA_157 | 10008 | A state for the `157` upgrade file data |
| STATE_ID_UPGRADE_DATA_158 | 10009 | A state for the `158` upgrade file data |
| STATE_ID_UPGRADE_DATA_159 | 10010 | A state for the `159` upgrade file data |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



