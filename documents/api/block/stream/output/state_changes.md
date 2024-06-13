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
  
    - [NewStateChange.NewStateType](#com-hedera-hapi-block-stream-output-NewStateChange-NewStateType)
    - [StateChangesCause](#com-hedera-hapi-block-stream-output-StateChangesCause)
  



<a name="stream_output_state_changes-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/state_changes.proto
# State Changes
Serialization of change records which describe the mutation of state
during a block.

The _ordered_ application of all `StateChanges` in a block to an initial
state that matches network state at the beginning of that block MUST produce
a resultant state that matches the network state at the end of that block.

> REVIEW NOTE
>> We have quite a few very large bytes values in state (e.g. files,
>> contracts, etc..). Would it be worthwhile to store changes to a bytes
>> value as a simplified difference set? Would it be worthwhile to do the
>> same for repeated items (perhaps only when over some threshold in length)?
>> This might also help with things like the 0.0.98 problem, because we
>> could record an empty difference set for the large repeated items.
>
>> Another thought. Protobuf is pretty good at optimizing a difference/merge
>> entry for a protobuf encoded message. Could we perhaps only write changed
>> fields for state mutations and apply those changed fields to the existing
>> entity to recreate the modified state?


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
| entity_id_pair_key | [proto.EntityIDPair](#proto-EntityIDPair) |  | A change to the token relationships virtual map.<br/> This map is keyed by the pair of account identifier and token identifier. |
| entity_number_key | [proto.EntityNumber](#proto-EntityNumber) |  | A change to a map keyed by an EntityNumber (which is a single int64). <p> This SHOULD NOT be used. Virtual maps SHOULD be keyed to full identifiers that include shard and realm information. |
| filed_id_key | [proto.FileID](#proto-FileID) |  | A change to a virtual map keyed by File identifier. |
| nft_id_key | [proto.NftID](#proto-NftID) |  | A change to a virtual map keyed by NFT identifier. |
| proto_bytes_key | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A change to a virtual map keyed by a byte array. |
| proto_long_key | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  | A change to a virtual map keyed by an int64 value. |
| proto_string_key | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A change to a virtual map keyed by a string value. |
| schedule_id_key | [proto.ScheduleID](#proto-ScheduleID) |  | A change to a virtual map keyed by a Schedule identifier. |
| slot_key_key | [proto.SlotKey](#proto-SlotKey) |  | A change to the EVM storage "slot" virtual map. |
| token_id_key | [proto.TokenID](#proto-TokenID) |  | A change to a virtual map keyed by a Token identifier. |
| topic_id_key | [proto.TopicID](#proto-TopicID) |  | A change to a virtual map keyed by a Topic identifier. |






<a name="com-hedera-hapi-block-stream-output-MapChangeValue"></a>

### MapChangeValue
A value updated in, or added to, a virtual map.

> REVIEW NOTE
>> Should we only set the modified fields here, possibly with a field mask
>> protobuf to tell the recipient which fields are _actually_ set?
>> <p>
>> It is not clear if we can easily detect what to send (perhaps we
>> can during record processing in the consensus node, we just don't
>> currently), though. If we can do that the total data volume would
>> probably shrink quite a lot...<br/>
>> It requires a block node to apply to an existing state copy to create
>> a "materialized" block stream (higher cost?) for many consumers, but
>> could save a ton of cost (and shift more cost to consumers of the block
>> nodes, improving "fairness" by moving cost closer to the demand).


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






<a name="com-hedera-hapi-block-stream-output-MapDeleteChange"></a>

### MapDeleteChange
A removal of a single item from a `VirtualMap`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [MapChangeKey](#com-hedera-hapi-block-stream-output-MapChangeKey) |  | A key in a virtual map. <p> This key SHALL be removed. The mapped value, also, SHALL be removed.<br/> This field is REQUIRED. |






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
| state_type | [NewStateChange.NewStateType](#com-hedera-hapi-block-stream-output-NewStateChange-NewStateType) |  | The type (e.g. Singleton, Virtual Map, Queue) of state to add. |






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
| entity_number_value | [proto.EntityNumber](#proto-EntityNumber) |  | A change to the Entity Identifier singleton. <p> The Entity Identifier singleton SHALL track the highest entity identifier used for the current shard and realm and SHALL be used to issue new entity numbers. |
| exchange_rate_set_value | [proto.ExchangeRateSet](#proto-ExchangeRateSet) |  | A change to the exchange rates singleton. <p> This change SHALL be present if the HBAR`<=>`USD exchange rate, as stored in the "midnight rates" singleton changed during the current block. |
| network_staking_rewards_value | [proto.NetworkStakingRewards](#proto-NetworkStakingRewards) |  | A change to the network staking rewards singleton. <p> Network staking rewards SHALL be updated for every non-empty block. |
| bytes_value | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  | A change to a raw byte array singleton. <p> This change SHALL present a change made to a raw byte array singleton.<br/> The "upgrade file hash" state is an example of a raw byte array singleton. |
| string_value | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | A change to a raw string singleton. <p> <dl><dt>Note</dt><dd>There are no current examples of a raw string singleton state.</dd></dl> |
| running_hashes_value | [proto.RunningHashes](#proto-RunningHashes) |  | A change to the running hashes singleton. <p> Running hashes SHALL be updated for each transaction. <p> <blockquote>REVIEW NOTE<blockquote> Running hashes is a record stream item. Can it be elided from the block stream? It's not written to the record stream, as far as I can tell. If we do write this it's adding over 144 bytes for every transaction. It's also not clear how we'll calculate this, as it's a hash of the records currently, so it would have to be a hash of the block items, including this one... </blockquote></blockquote> |
| throttle_usage_snapshots_value | [proto.ThrottleUsageSnapshots](#proto-ThrottleUsageSnapshots) |  | A change to the throttle usage snapshots singleton. <p> Throttle usage snapshots SHALL be updated for _every transaction_ to reflect the amount used for each tps throttle and for the gas throttle. |
| timestamp_value | [proto.Timestamp](#proto-Timestamp) |  | A change to a raw `Timestamp` singleton.<br/> An example of a raw `Timestamp` singleton is the "network freeze time" singleton state, which, if set, stores the time for the next scheduled freeze. |






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
      Need to reference that document, stored in platform docs, here.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_name | [string](#string) |  | A state name. <p> This name SHALL identify the merkle subtree "state" to be modified and often corresponds to a `VirtualMap` name. |
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


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| cause | [StateChangesCause](#com-hedera-hapi-block-stream-output-StateChangesCause) |  | The proximate source of this state change set. <p> This field describes the source (e.g. user transaction, system "housekeeping", end of block, etc...) of the changes included in this change set. |
| consensus_timestamp | [proto.Timestamp](#proto-Timestamp) |  | The consensus timestamp of this set of changes. <p> This value SHALL be the same value the network used to order events in this block. |
| state_changes | [StateChange](#com-hedera-hapi-block-stream-output-StateChange) | repeated | An ordered list of individual changes. <p> These changes MUST be applied in the order listed to produce a correct modified state. |





 <!-- end messages -->


<a name="com-hedera-hapi-block-stream-output-NewStateChange-NewStateType"></a>

### NewStateChange.NewStateType
An enumeration of the types of named states.<br/>
The default, Singleton, is the type of state most frequently
added and removed.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SINGLETON | 0 |  |
| VIRTUAL_MAP | 1 |  |
| QUEUE | 2 |  |



<a name="com-hedera-hapi-block-stream-output-StateChangesCause"></a>

### StateChangesCause
The "cause" of a state change.

What was the network doing that led to the change in state?<br/>
The most common event is, of course, a user transaction.
Other sources of state changes include end-of-block housekeeping changes,
data migration, and "system" transactions.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STATE_CHANGE_CAUSE_TRANSACTION | 0 | A set of transaction state changes.<br/> This is a deliberate default because this is the most common 'cause' and we wish to minimize serialized size. |
| STATE_CHANGE_CAUSE_SYSTEM | 1 | A system-internal state change.<br/> System-initiated transactions exist to enable the network to maintain state signatures and network communication. |
| STATE_CHANGE_CAUSE_END_OF_BLOCK | 2 | A set of end-of-block state changes.<br/> The network performs certain processes, such as writing to the block stream, updating singleton states, or updating queue states at the end of a block to minimize impacts on consensus nodes. |
| STATE_CHANGE_CAUSE_MIGRATION | 3 | A set of data migration state changes.<br/> Data migration is typically necessary following a network upgrade to make required storage format updates and enable new features. |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



