## Table of Contents

- [state/consensus/topic.proto](#state_consensus_topic-proto)
    - [Topic](#proto-Topic)
  



<a name="state_consensus_topic-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/consensus/topic.proto
# HCS Topic Information
The current network state of an Hedera Consensus Service (HCS) Topic.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-Topic"></a>

### Topic
Representation of an Hedera Consensus Service(HCS) topic.

As with all network entities, a topic has a unique entity number, which is
usually given along with the network's shard and realm in the form of a
shard.realm.number id.<br/>
An HCS topic is an ordered logical stream of messages united and secured by
a running hash of those messages. The integrity of any message on a topic,
and the topic stream as a whole, can always be ascertained from block stream
data by recomputing the running hash across any subset of messages on the
topic.<br/>
The messages on a topic SHALL NOT be stored in network state, but are
available in the network block stream, and may be queried via the
Mirror Node system.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topic_id | [TopicID](#proto-TopicID) |  | The topic's ID. <p> This value SHALL be unique within the network. |
| sequence_number | [int64](#int64) |  | The number of messages sent to the topic. |
| expiration_second | [int64](#int64) |  | The expiration time for this topic, in seconds since the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| auto_renew_period | [int64](#int64) |  | The number of seconds for which the topic will be automatically renewed upon expiring (if it has a valid auto-renew account). |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | The id of the account (if any) that the network will attempt to charge fees to complete auto-renewal of this topic, upon expiration. |
| deleted | [bool](#bool) |  | A flag indicating that this topic is deleted. |
| running_hash | [bytes](#bytes) |  | The current running hash of this topic. <p/> This 48-byte field is the output of a SHA-384 digest with input data determined by the current version of the running hash algorithm used by the network.<br/> All topics in state SHALL use running hash algorithm version `3`.<br/> The bytes of each uint64 or uint32 encoded for the hash input MUST be in Big-Endian format. <p/> <hr/> If the algorithm version is '3', then the input data to the SHA-384 digest are, in order: <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topicRunningHashVersion` (8 bytes)</li> <li>The payer account's shard (8 bytes)</li> <li>The payer account's realm (8 bytes)</li> <li>The payer account's number (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topicSequenceNumber` (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> <blockquote>Note that older messages on a topic, which are available in the block stream, MAY use older algorithm versions, and the block stream record incorporates a running hash version field to ensure the correct hash calculation for each such historical message.</blockquote> |
| memo | [string](#string) |  | A short description of this topic. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| admin_key | [Key](#proto-Key) |  | Access control for modification of the topic. <p> If this field is set, that key MUST sign each message to update or delete this topic.<br/> A topic without an admin key SHALL be immutable, except for expiration and renewal.<br/> If this field is not set, the `auto_renew_account_id` MUST NOT be set. |
| submit_key | [Key](#proto-Key) |  | Access control for message submission to the topic. <p> If this field is set, that key MUST sign each consensus submit message for this topic. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


