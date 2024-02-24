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
See [ConsensusService.getTopicInfo()](#proto.ConsensusService)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| topicID | [TopicID](#proto-TopicID) |  | The Topic for which information is being requested |






<a name="proto-ConsensusGetTopicInfoResponse"></a>

### ConsensusGetTopicInfoResponse
Retrieve the parameters of and state of a consensus topic.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither. |
| topicID | [TopicID](#proto-TopicID) |  | Topic identifier. |
| topicInfo | [ConsensusTopicInfo](#proto-ConsensusTopicInfo) |  | Current state of the topic |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


