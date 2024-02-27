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
Update the fields of an existing HCS topic.

The topicID field is REQUIRED. All other fields are OPTIONAL.<br/>
Fields set on this transaction SHALL be updated.<br/>
Fields _not_ set on this transaction SHALL NOT be updated.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topicID | [TopicID](#proto-TopicID) |  | The topic ID specifying the topic to update.<br/> A topic with this ID MUST exist and MUST NOT be deleted.<br/> This value is REQUIRED. |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | An updated memo to be associated with this topic.<br/> If this value is set, the current `adminKey` for the topic MUST sign this transaction.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | An updated expiration time for this topic, in seconds since the epoch.<br/> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`.<br/> The expirationTime MUST NOT be greater than the sum of `MAX_AUTORENEW_PERIOD` and the actual consensus timestamp of this transaction.<br/> If `adminKey` is <b>unset</b> for the _topic_, this transaction MUST NOT modify any other field. |
| adminKey | [Key](#proto-Key) |  | Updated access control for modification of the topic.<br/> If this field is set, that key and the previously set key MUST both sign this transaction.<br/> If this value is an empty `KeyList`, the prior key MUST sign this transaction, and the topic SHALL be immutable after this transaction completes, except for expiration and renewal. |
| submitKey | [Key](#proto-Key) |  | Updated access control for message submission to the topic.<br/> If this value is set, the current `adminKey` for the topic MUST sign this transaction.<br/> If this value is set to an empty `KeyList`, the `submitKey` for the topic will be unset after this transaction completes. When the `submitKey` is unset, any account may submit a message on the topic, without restriction. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | An updated value for the number of seconds by which the topic expiration will be automatically extended upon expiration, if it has a valid auto-renew account.<br/> If this value is set, the current `adminKey` for the topic MUST sign this transaction.<br/> This value, if set, MUST be greater than the configured MIN_AUTORENEW_PERIOD.<br/> This value, if set, MUST be less than the configured MAX_AUTORENEW_PERIOD. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | An updated ID for the account to be charged renewal fees at the topic's `expirationTime` to extend the lifetime of the topic.<br/> If this value is set and not the "sentinel account", the referenced account MUST sign this transaction.<br/> If this value is set, the current `adminKey` for the topic MUST sign this transaction.<br/> If this value is set to the "sentinel account", which is `0.0.0`, the `autoRenewAccount` SHALL be removed from the topic. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


