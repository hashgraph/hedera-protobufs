## Table of Contents

- [stream/output/consensus_service.proto](#stream_output_consensus_service-proto)
    - [CreateTopicOutput](#com-hedera-hapi-block-stream-output-CreateTopicOutput)
    - [DeleteTopicOutput](#com-hedera-hapi-block-stream-output-DeleteTopicOutput)
    - [SubmitMessageOutput](#com-hedera-hapi-block-stream-output-SubmitMessageOutput)
    - [UpdateTopicOutput](#com-hedera-hapi-block-stream-output-UpdateTopicOutput)
  
    - [RunningHashVersion](#com-hedera-hapi-block-stream-output-RunningHashVersion)
  



<a name="stream_output_consensus_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/consensus_service.proto
# Consensus Service
Block stream messages that report the results of transactions handled
by the `Consensus` service.

### Topic Running Hash Calculation
Submitted messages include a topic running hash. This value has changed
over time, with the known versions detailed in the `RunningHashVersion`
enumeration.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-CreateTopicOutput"></a>

### CreateTopicOutput
Block Stream data for a `createTopic` transaction.

This message SHALL NOT duplicate information already contained in the
original transaction.






<a name="com-hedera-hapi-block-stream-output-DeleteTopicOutput"></a>

### DeleteTopicOutput
Block Stream data for a `deleteTopic` transaction.

This message SHALL NOT duplicate information already contained in the
original transaction.






<a name="com-hedera-hapi-block-stream-output-SubmitMessageOutput"></a>

### SubmitMessageOutput
Block Stream data for a `submitMessage` transaction.

This message SHALL NOT duplicate information already contained in the
original transaction.<br/>
The actual topic running hash SHALL be present in a `StateChanges` block
item, and is not duplicated here.






<a name="com-hedera-hapi-block-stream-output-UpdateTopicOutput"></a>

### UpdateTopicOutput
Block Stream data for a `updateTopic` transaction.

This message SHALL NOT duplicate information already contained in the
original transaction.





 <!-- end messages -->


<a name="com-hedera-hapi-block-stream-output-RunningHashVersion"></a>

### RunningHashVersion
A version of the topic running hash.

The inputs to the topic running hash have changed over time.
This is tracked in earlier record streams as an integer. For the
block stream we chose to use an enumeration for both efficiency
and clarity. Placing the most recent, and most common/highest
volume, version as `0` reduces the serialized size of this message
by not serializing that default value.

<hr style="margin: 0.2em 5em 0.2em 5em; height: 0.5em;
    border-style: solid none solid none; border-width: 2px;"/>

The topic running hash is a 48-byte value that is the output
of a hash digest with input data determined by the value of
the `topic_running_hash_version` field.<br/>
All new transactions SHALL use `topic_running_hash_version`
`WITH_MESSAGE_DIGEST_AND_PAYER`.<br/>

| Name | Number | Description |
| ---- | ------ | ----------- |
| WITH_MESSAGE_DIGEST_AND_PAYER | 0 | The most recent version. <p> This version SHALL include, in order <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topic_running_hash_version` field (8 bytes)</li> <li>The payer account's shard (8 bytes)</li> <li>The payer account's realm (8 bytes)</li> <li>The payer account's number (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topic_sequence_number` field (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> |
| WITH_MESSAGE_DIGEST | 1 | An earlier version. <p> This version SHALL include, in order <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topic_running_hash_version` field (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topic_sequence_number` field (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> |
| WITH_FULL_MESSAGE | 2 | The original version, used at genesis. <p> This version SHALL include, in order <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topic_sequence_number` field (8 bytes)</li> <li>The message bytes from the `ConsensusSubmitMessage` (variable)</li> </ol> |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



