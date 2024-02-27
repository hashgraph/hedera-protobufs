## Table of Contents

- [consensus_get_topic_info.proto](#consensus_get_topic_info-proto)
    - [ConsensusGetTopicInfoQuery](#proto-ConsensusGetTopicInfoQuery)
    - [ConsensusGetTopicInfoResponse](#proto-ConsensusGetTopicInfoResponse)
  



<a name="consensus_get_topic_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_get_topic_info.proto
# Get Topic
Query a topic in the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ConsensusGetTopicInfoQuery"></a>

### ConsensusGetTopicInfoQuery
Retrieve the latest state of a topic.

This method is unrestricted and allowed on any topic by any payer account.<br/>
A query for a deleted topic MAY succeed if the topic is within the "autorenew grace period".<br/>
A query for a topic removed from state SHALL NOT succeed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| topicID | [TopicID](#proto-TopicID) |  | A topic ID.<br/> The network SHALL return information for this topic, if successful. |






<a name="proto-ConsensusGetTopicInfoResponse"></a>

### ConsensusGetTopicInfoResponse
Returns the current state of a topic in the Hedera Consensus Service(HCS).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| topicID | [TopicID](#proto-TopicID) |  | The ID of the topic requested in the query. |
| topicInfo | [ConsensusTopicInfo](#proto-ConsensusTopicInfo) |  | Information describing the current state of the topic. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


