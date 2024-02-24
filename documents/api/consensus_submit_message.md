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
UNDOCUMENTED


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| initialTransactionID | [TransactionID](#proto-TransactionID) |  | TransactionID of the first chunk, gets copied to every subsequent chunk in a fragmented message. |
| total | [int32](#int32) |  | The total number of chunks in the message. |
| number | [int32](#int32) |  | The sequence number (from 1 to total) of the current chunk in the message. |






<a name="proto-ConsensusSubmitMessageTransactionBody"></a>

### ConsensusSubmitMessageTransactionBody
UNDOCUMENTED


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | Topic to submit message to. |
| message | [bytes](#bytes) |  | Message to be submitted. Max size of the Transaction (including signatures) is 6KiB. |
| chunkInfo | [ConsensusMessageChunkInfo](#proto-ConsensusMessageChunkInfo) |  | Optional information of the current chunk in a fragmented message. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


