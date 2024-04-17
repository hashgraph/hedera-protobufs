## Table of Contents

- [consensus_delete_topic.proto](#consensus_delete_topic-proto)
    - [ConsensusDeleteTopicTransactionBody](#proto-ConsensusDeleteTopicTransactionBody)
  



<a name="consensus_delete_topic-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_delete_topic.proto
# Delete Topic
Delete an existing topic from the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ConsensusDeleteTopicTransactionBody"></a>

### ConsensusDeleteTopicTransactionBody
Delete a topic.

Once deleted, subsequent transactions or queries for that topic SHALL NOT
succeed.<br/>
If adminKey is set on the topic, this transaction MUST be signed by that
key.<br/>
If adminKey is not set on the topic, this transaction SHALL fail with a
response code of `UNAUTHORIZED`. A topic without an adminKey cannot be
deleted (but MAY expire).

### Record Stream Effects
???


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | Topic to be deleted. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


