## Table of Contents

- [consensus_submit_message.proto](#consensus_submit_message-proto)
    - [ConsensusMessageChunkInfo](#proto-ConsensusMessageChunkInfo)
    - [ConsensusSubmitMessageTransactionBody](#proto-ConsensusSubmitMessageTransactionBody)
  



<a name="consensus_submit_message-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_submit_message.proto
# Submit Message
Submit a message to a topic via the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ConsensusMessageChunkInfo"></a>

### ConsensusMessageChunkInfo
Information describing the way in which a message submitted for consensus
is broken into multiple fragments to fit within network transaction
size limits.

The use of multiple message fragments is RECOMMENDED for any message
greater than 4KiB in total size.

### Record Stream Effects
???


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| initialTransactionID | [TransactionID](#proto-TransactionID) |  | The TransactionID of the first chunk. <p> This MUST be set for every chunk in a fragmented message. |
| total | [int32](#int32) |  | The total number of chunks in the message. |
| number | [int32](#int32) |  | The sequence number (from 1 to total) of the current chunk in the message. |






<a name="proto-ConsensusSubmitMessageTransactionBody"></a>

### ConsensusSubmitMessageTransactionBody
Submit a message for consensus.
<p>
Valid and authorized messages on valid topics SHALL be ordered by the
consensus service, published in the block stream, and available to all
subscribers on this topic via the mirror nodes.<br/>
If this transaction succeeds the resulting `TransactionReceipt` SHALL contain
the latest `topicSequenceNumber` and `topicRunningHash` for the topic.<br/>
If the topic `submitKey` is set, and not an empty `KeyList`, then that key
MUST sign this transaction.

### Record Stream Effects
???


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | Topic to submit message to. |
| message | [bytes](#bytes) |  | A message to be submitted. <p> This Transaction (including signatures) MUST be less than 6KiB.<br/> Messages SHOULD be less than 4KiB. A "chunked" message MAY be submitted if a message larger than this is required. |
| chunkInfo | [ConsensusMessageChunkInfo](#proto-ConsensusMessageChunkInfo) |  | Information for the current "chunk" in a fragmented message. <p> This value is REQUIRED if the full `message` is submitted in two or more fragments due to transaction size limits.<br/> If the message is submitted in a single transaction, then this field SHOULD NOT be set. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


