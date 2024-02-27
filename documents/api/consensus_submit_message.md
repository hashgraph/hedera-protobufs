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
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ConsensusMessageChunkInfo"></a>

### ConsensusMessageChunkInfo
Information describing the way in which a message submitted for consensus is broken into
multiple fragments to fit within network transaction size limits.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| initialTransactionID | [TransactionID](#proto-TransactionID) |  | The TransactionID of the first chunk. This MUST be set for every chunk in a fragmented message. |
| total | [int32](#int32) |  | The total number of chunks in the message. |
| number | [int32](#int32) |  | The sequence number (from 1 to total) of the current chunk in the message. |






<a name="proto-ConsensusSubmitMessageTransactionBody"></a>

### ConsensusSubmitMessageTransactionBody
Submit a message for consensus.<br/>
Valid and authorized messages on valid topics will be ordered by the consensus service,
published in the block stream, and available to all subscribers on this topic via the mirror
nodes.<br/>
If this transaction succeeds the resulting `TransactionReceipt` SHALL contain the latest
`topicSequenceNumber` and `topicRunningHash` for the topic.<br/>
If the topic has a `submitKey` then that key MUST sign this transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | Topic to submit message to. |
| message | [bytes](#bytes) |  | Message to be submitted. Max size of the Transaction (including signatures) is 6KiB. |
| chunkInfo | [ConsensusMessageChunkInfo](#proto-ConsensusMessageChunkInfo) |  | Optional information of the current chunk in a fragmented message. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


