## Table of Contents

- [consensus_create_topic.proto](#consensus_create_topic-proto)
    - [ConsensusCreateTopicTransactionBody](#proto-ConsensusCreateTopicTransactionBody)
  



<a name="consensus_create_topic-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_create_topic.proto
# Create Topic
Create a new topic for the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ConsensusCreateTopicTransactionBody"></a>

### ConsensusCreateTopicTransactionBody
See [ConsensusService.createTopic()](#proto.ConsensusService)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| memo | [string](#string) |  | Short publicly visible memo about the topic. No guarantee of uniqueness. |
| adminKey | [Key](#proto-Key) |  | Access control for updateTopic/deleteTopic. Anyone can increase the topic's expirationTime via ConsensusService.updateTopic(), regardless of the adminKey. If no adminKey is specified, updateTopic may only be used to extend the topic's expirationTime, and deleteTopic is disallowed. |
| submitKey | [Key](#proto-Key) |  | Access control for submitMessage. If unspecified, no access control is performed on ConsensusService.submitMessage (all submissions are allowed). |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The initial lifetime of the topic and the amount of time to attempt to extend the topic's lifetime by automatically at the topic's expirationTime, if the autoRenewAccount is configured (once autoRenew functionality is supported by HAPI). Limited to MIN_AUTORENEW_PERIOD and MAX_AUTORENEW_PERIOD value by server-side configuration. Required. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | Optional account to be used at the topic's expirationTime to extend the life of the topic (once autoRenew functionality is supported by HAPI). The topic lifetime will be extended up to a maximum of the autoRenewPeriod or however long the topic can be extended using all funds on the account (whichever is the smaller duration/amount and if any extension is possible with the account's funds). If specified, there must be an adminKey and the autoRenewAccount must sign this transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


