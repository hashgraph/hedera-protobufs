## Table of Contents

- [stream/event_metadata.proto](#stream_event_metadata-proto)
    - [ConsensusData](#com-hedera-hapi-block-stream-ConsensusData)
    - [EventDescriptor](#com-hedera-hapi-block-stream-EventDescriptor)
    - [EventMetadata](#com-hedera-hapi-block-stream-EventMetadata)
  



<a name="stream_event_metadata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/event_metadata.proto
# Event Metadata
Messages for Event block items.
NOTE: This may need to change substantially as platform creates the event protobufs for gossip.


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-ConsensusData"></a>

### ConsensusData
The consensus data calculated for an event.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| consensusTimestamp | [proto.Timestamp](#proto-Timestamp) |  | The consensus timestamp for this event. |
| round | [uint64](#uint64) |  | The round in which this event reached consensus. |
| order | [uint64](#uint64) |  | The consensus order of this event. The first event ever to reach consensus has an order of 0. This number increases monotonically. |






<a name="com-hedera-hapi-block-stream-EventDescriptor"></a>

### EventDescriptor
An abbreviated version of an event used to describe an event's parents as claimed by the child event.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hash | [bytes](#bytes) |  | The hash of the parent event. The hash algorithm is specified in the BlockHeader. |
| creator_id | [uint64](#uint64) |  | The ID of the node that created the parent event. |
| generation | [uint64](#uint64) |  | The generation of the parent event as claimed by the child event. |
| birth_round | [uint64](#uint64) |  | The birth round of the parent event as claimed by the child event. |






<a name="com-hedera-hapi-block-stream-EventMetadata"></a>

### EventMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| software_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | The software version of the node that created this event. |
| creator_id | [uint64](#uint64) |  | ID of this event's creator (translated before sending). |
| generation | [uint64](#uint64) |  | The generation of this event. |
| birth_round | [uint64](#uint64) |  | The birth round of this event, the round that has most recently reached consensus on the creating node when the event was created. |
| self_parent | [EventDescriptor](#com-hedera-hapi-block-stream-EventDescriptor) |  | A descriptor that describes this event's self parent as claimed by the event creator. |
| other_parents | [EventDescriptor](#com-hedera-hapi-block-stream-EventDescriptor) | repeated | A list of descriptors that describe this event's other parent(s) as claimed by the event creator. |
| time_created | [proto.Timestamp](#proto-Timestamp) |  | Creation time, as claimed by its creator. |
| hash | [bytes](#bytes) |  | The event creator's hash of this event. |
| signature | [bytes](#bytes) |  | The event creator's signature of this event. |
| consensus_data | [ConsensusData](#com-hedera-hapi-block-stream-ConsensusData) |  | The consensus data for this event. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



