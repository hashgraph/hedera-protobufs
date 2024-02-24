## Table of Contents

- [consensus_update_topic.proto](#consensus_update_topic-proto)
    - [ConsensusUpdateTopicTransactionBody](#proto-ConsensusUpdateTopicTransactionBody)
  



<a name="consensus_update_topic-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_update_topic.proto
# Update Topic
Update a topic for the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ConsensusUpdateTopicTransactionBody"></a>

### ConsensusUpdateTopicTransactionBody
All fields left null will not be updated.
See [ConsensusService.updateTopic()](#proto.ConsensusService)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | UNDOCUMENTED |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, the new memo to be associated with the topic (UTF-8 encoding max 100 bytes) |
| expirationTime | [Timestamp](#proto-Timestamp) |  | Effective consensus timestamp at (and after) which all consensus transactions and queries will fail. The expirationTime may be no longer than MAX_AUTORENEW_PERIOD (8000001 seconds) from the consensus timestamp of this transaction. On topics with no adminKey, extending the expirationTime is the only updateTopic option allowed on the topic. If unspecified, no change. |
| adminKey | [Key](#proto-Key) |  | Access control for update/delete of the topic. If unspecified, no change. If empty keyList - the adminKey is cleared. |
| submitKey | [Key](#proto-Key) |  | Access control for ConsensusService.submitMessage. If unspecified, no change. If empty keyList - the submitKey is cleared. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The amount of time to extend the topic's lifetime automatically at expirationTime if the autoRenewAccount is configured and has funds (once autoRenew functionality is supported by HAPI). Limited to between MIN_AUTORENEW_PERIOD (6999999 seconds) and MAX_AUTORENEW_PERIOD (8000001 seconds) by servers-side configuration (which may change). If unspecified, no change. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | Optional account to be used at the topic's expirationTime to extend the life of the topic. Once autoRenew functionality is supported by HAPI, the topic lifetime will be extended up to a maximum of the autoRenewPeriod or however long the topic can be extended using all funds on the account (whichever is the smaller duration/amount). If specified as the default value (0.0.0), the autoRenewAccount will be removed. If unspecified, no change. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


