## Table of Contents

- [stream/state_changes.proto](#stream_state_changes-proto)
    - [MapDeleteChange](#proto-MapDeleteChange)
    - [MapUpdateChange](#proto-MapUpdateChange)
    - [QueuePopChange](#proto-QueuePopChange)
    - [QueuePushChange](#proto-QueuePushChange)
    - [SingletonDeleteChange](#proto-SingletonDeleteChange)
    - [SingletonUpdateChange](#proto-SingletonUpdateChange)
    - [StateChange](#proto-StateChange)
    - [StateChanges](#proto-StateChanges)
  
    - [StateChangesCause](#proto-StateChangesCause)
  



<a name="stream_state_changes-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/state_changes.proto
# State Changes
Serialization of change records which describe the mutation of state during a block.

The _ordered_ application of all `StateChanges` in a block to an initial state that
matches network state at the beginning of that block MUST produce a resultant state
that matches the network state at the end of that block.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-MapDeleteChange"></a>

### MapDeleteChange



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id_key | [AccountID](#proto-AccountID) |  |  |
| entity_id_pair_key | [EntityIDPair](#proto-EntityIDPair) |  |  |
| entity_number_key | [EntityNumber](#proto-EntityNumber) |  |  |
| filed_id_key | [FileID](#proto-FileID) |  |  |
| nft_id_key | [NftID](#proto-NftID) |  |  |
| proto_bytes_key | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  |  |
| proto_long_key | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  |  |
| proto_string_key | [google.protobuf.StringValue](#google-protobuf-StringValue) |  |  |
| schedule_id_key | [ScheduleID](#proto-ScheduleID) |  |  |
| slot_key_key | [SlotKey](#proto-SlotKey) |  |  |
| token_id_key | [TokenID](#proto-TokenID) |  |  |
| topic_id_key | [TopicID](#proto-TopicID) |  |  |






<a name="proto-MapUpdateChange"></a>

### MapUpdateChange



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id_key | [AccountID](#proto-AccountID) |  |  |
| entity_id_pair_key | [EntityIDPair](#proto-EntityIDPair) |  |  |
| entity_number_key | [EntityNumber](#proto-EntityNumber) |  |  |
| filed_id_key | [FileID](#proto-FileID) |  |  |
| nft_id_key | [NftID](#proto-NftID) |  |  |
| proto_bytes_key | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  |  |
| proto_long_key | [google.protobuf.Int64Value](#google-protobuf-Int64Value) |  |  |
| proto_string_key | [google.protobuf.StringValue](#google-protobuf-StringValue) |  |  |
| schedule_id_key | [ScheduleID](#proto-ScheduleID) |  |  |
| slot_key_key | [SlotKey](#proto-SlotKey) |  |  |
| token_id_key | [TokenID](#proto-TokenID) |  |  |
| topic_id_key | [TopicID](#proto-TopicID) |  |  |
| account_value | [Account](#proto-Account) |  |  |
| account_id_value | [AccountID](#proto-AccountID) |  |  |
| bytecode_value | [Bytecode](#proto-Bytecode) |  |  |
| file_value | [File](#proto-File) |  |  |
| nft_value | [Nft](#proto-Nft) |  |  |
| proto_string_value | [google.protobuf.StringValue](#google-protobuf-StringValue) |  |  |
| schedule_value | [Schedule](#proto-Schedule) |  |  |
| schedule_list_value | [ScheduleList](#proto-ScheduleList) |  |  |
| slot_value_value | [SlotValue](#proto-SlotValue) |  |  |
| staking_node_info_value | [StakingNodeInfo](#proto-StakingNodeInfo) |  |  |
| token_value | [Token](#proto-Token) |  |  |
| token_relation_value | [TokenRelation](#proto-TokenRelation) |  |  |
| topic_value | [Topic](#proto-Topic) |  |  |






<a name="proto-QueuePopChange"></a>

### QueuePopChange
QueuePopChange represents a change to a queue in which an element is removed to the head of the queue, i.e. the
oldest element.

We might want to serialize the popped element here in the future.






<a name="proto-QueuePushChange"></a>

### QueuePushChange
QueuePushChange represents a change to a queue in which an element is added to the end of the queue after its current
last element.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| proto_bytes_element | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  |  |
| proto_string_element | [google.protobuf.StringValue](#google-protobuf-StringValue) |  |  |
| transaction_record_entry_element | [TransactionRecordEntry](#proto-TransactionRecordEntry) |  |  |






<a name="proto-SingletonDeleteChange"></a>

### SingletonDeleteChange
We might want to serialize the deleted element here in the future.






<a name="proto-SingletonUpdateChange"></a>

### SingletonUpdateChange



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_info_value | [BlockInfo](#proto-BlockInfo) |  |  |
| congestion_level_starts_value | [CongestionLevelStarts](#proto-CongestionLevelStarts) |  |  |
| entity_number_value | [EntityNumber](#proto-EntityNumber) |  |  |
| exchange_rate_set_value | [ExchangeRateSet](#proto-ExchangeRateSet) |  |  |
| network_staking_rewards_value | [NetworkStakingRewards](#proto-NetworkStakingRewards) |  |  |
| bytes_value | [google.protobuf.BytesValue](#google-protobuf-BytesValue) |  |  |
| string_value | [google.protobuf.StringValue](#google-protobuf-StringValue) |  |  |
| running_hashes_value | [RunningHashes](#proto-RunningHashes) |  |  |
| throttle_usage_snapshots_value | [ThrottleUsageSnapshots](#proto-ThrottleUsageSnapshots) |  |  |
| timestamp_value | [Timestamp](#proto-Timestamp) |  |  |






<a name="proto-StateChange"></a>

### StateChange



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| merkle_tree_path | [uint64](#uint64) |  | path to change |
| state_name | [string](#string) |  | TODO: We will need a way to initialize new named states. nft, account, etc.. ...maybe we should an enum for which one of the Named States, i.e. what's the table name? |
| singleton_update | [SingletonUpdateChange](#proto-SingletonUpdateChange) |  |  |
| singleton_delete | [SingletonDeleteChange](#proto-SingletonDeleteChange) |  |  |
| map_update | [MapUpdateChange](#proto-MapUpdateChange) |  |  |
| map_delete | [MapDeleteChange](#proto-MapDeleteChange) |  |  |
| queue_push | [QueuePushChange](#proto-QueuePushChange) |  |  |
| queue_pop | [QueuePopChange](#proto-QueuePopChange) |  |  |






<a name="proto-StateChanges"></a>

### StateChanges
A set of state changes.

Each set of changes in the network deterministically mutates the current state to a
new state, and all nodes MUST apply the same changes in the same order.<br/>
Each change set described in the block stream SHALL describe an ordered set of mutations
which mutate the previous valid state to produce a new valid state.<br/>
The order of state change sets SHALL be determined by the `consensus_timestamp`, which is
a strictly ascending value determined by network consensus.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| cause | [StateChangesCause](#proto-StateChangesCause) |  | The proximate source of this state change set.<br/> This field describes the source (e.g. user transaction, system "housekeeping", end of block, etc...) of the changes included in this change set. |
| consensus_timestamp | [Timestamp](#proto-Timestamp) |  | The consensus timestamp of this set of changes.<br/> This value SHALL be the same value the network used to order events in this block. |
| state_changes | [StateChange](#proto-StateChange) | repeated | An ordered list of individual changes.<br/> These changes MUST be applied in the order listed to produce a correct modified state. |





 <!-- end messages -->


<a name="proto-StateChangesCause"></a>

### StateChangesCause


| Name | Number | Description |
| ---- | ------ | ----------- |
| STATE_CHANGE_CAUSE_TRANSACTION | 0 | A set of transaction state changes. This is a deliberate default because this is the most common 'cause' and we wish to minimize serialized size. |
| STATE_CHANGE_CAUSE_SYSTEM | 1 | A system state change. |
| STATE_CHANGE_CAUSE_END_OF_BLOCK | 2 | A set of end-of-block state changes. |
| STATE_CHANGE_CAUSE_MIGRATION | 3 | A set of data migration state changes. |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



