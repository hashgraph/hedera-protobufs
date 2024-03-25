## Table of Contents

- [stream/consensus_service.proto](#stream_consensus_service-proto)
    - [CreateTopicOutput](#com-hedera-hapi-block-stream-CreateTopicOutput)
    - [DeleteTopicOutput](#com-hedera-hapi-block-stream-DeleteTopicOutput)
    - [SubmitMessageOutput](#com-hedera-hapi-block-stream-SubmitMessageOutput)
    - [UpdateTopicOutput](#com-hedera-hapi-block-stream-UpdateTopicOutput)
  



<a name="stream_consensus_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/consensus_service.proto
# Consensus Service
Block stream messages that report the results of transactions handled by the `Consensus` service.

### Topic Running Hash Calculation
Some messages include a topic running hash. This value has changed over time, with the
known versions listed here.

<hr style="margin: 0.2em -1em 0.2em -1em; height: 0.5em; border-style: solid none solid none; border-width: 2px;"/>

This 48-byte field is the output of a SHA-384 digest with input data determined by the
value of the `topic_running_hash_version` field.<br/>
All new transactions SHALL use `topic_running_hash_version` `3`.<br/>
The bytes of each uint64 or uint32 encoded for the hash input MUST be in Big-Endian format.
---
If the `topic_running_hash_version` is '0' or '1', then the input data to the SHA-384 digest are,
in order:
 1. The previous running hash of the topic (48 bytes)
 1. The topic's shard (8 bytes)
 1. The topic's realm (8 bytes)
 1. The topic's number (8 bytes)
 1. The number of seconds since the epoch when the `ConsensusSubmitMessage` reached
    consensus (8 bytes)
 1. The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached
    consensus (4 bytes)
 1. The `topic_sequence_number` field (8 bytes)
 1. The message bytes from the `ConsensusSubmitMessage` (variable).
---
If the `topic_running_hash_version` is '2', then the input data to the SHA-384 digest are, in
order:
 1. The previous running hash of the topic (48 bytes)
 1. The `topic_running_hash_version` field (8 bytes)
 1. The topic's shard (8 bytes)
 1. The topic's realm (8 bytes)
 1. The topic's number (8 bytes)
 1. The number of seconds since the epoch when the `ConsensusSubmitMessage` reached
    consensus (8 bytes)
 1. The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached
    consensus (4 bytes)
 1. The `topic_sequence_number` field (8 bytes)
 1. The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage`
    (48 bytes)
---
If the `topic_running_hash_version` is '3', then the input data to the SHA-384 digest
are, in order:
 1. The previous running hash of the topic (48 bytes)
 1. The `topic_running_hash_version` field (8 bytes)
 1. The payer account's shard (8 bytes)
 1. The payer account's realm (8 bytes)
 1. The payer account's number (8 bytes)
 1. The topic's shard (8 bytes)
 1. The topic's realm (8 bytes)
 1. The topic's number (8 bytes)
 1. The number of seconds since the epoch when the `ConsensusSubmitMessage` reached
    consensus (8 bytes)
 1. The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached
    consensus (4 bytes)
 1. The `topic_sequence_number` field (8 bytes)
 1. The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage`
    (48 bytes)

<hr style="margin: 0.2em -1em 0.2em -1em; height: 0.5em; border-style: solid none solid none; border-width: 2px;"/>

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-CreateTopicOutput"></a>

### CreateTopicOutput
Block Stream data for a `createTopic` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-DeleteTopicOutput"></a>

### DeleteTopicOutput
Block Stream data for a `deleteTopic` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-SubmitMessageOutput"></a>

### SubmitMessageOutput
Block Stream data for a `submitMessage` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topic_running_hash_version | [uint64](#uint64) |  | The version of inputs to the SHA-384 running hash.<br/> For all current transactions, this value SHALL be `3`. |






<a name="com-hedera-hapi-block-stream-UpdateTopicOutput"></a>

### UpdateTopicOutput
Block Stream data for a `updateTopic` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



