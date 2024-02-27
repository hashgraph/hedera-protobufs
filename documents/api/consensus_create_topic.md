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
Create a topic to accept and group consensus messages.

If `autoRenewAccount` is specified, that account Key MUST also sign this transaction.<br/>
If `adminKey` is set, that Key MUST sign the transaction.<br/>
On success, the resulting `TransactionReceipt` SHALL contain the newly created `TopicId`.

The `autoRenewPeriod` on a topic MUST be set to a value between
`MIN_AUTORENEW_PERIOD` (6999999 seconds/81 days) and
`MAX_AUTORENEW_PERIOD` (8000001 seconds/92 days).<br/>
This also sets the initial expirationTime of the topic.

If no `adminKey` is set on a topic
  -`autoRenewAccount` SHALL NOT be set on the topic.
  - A `deleteTopic` transaction SHALL fail.
  - An `updateTopic` transaction that only extends the expirationTime MAY succeed.
  - Any other `updateTopic` transaction SHALL fail.

If the topic expires and is not automatically renewed, the topic SHALL enter the `EXPIRED` state.
  - All transactions on the topic SHALL fail with TOPIC_EXPIRED
     - Except an updateTopic() call that only extends the expirationTime.
  - getTopicInfo() will succeed, and show the topic is expired.
The topic will remain in the `EXPIRED` state for a time determined by the
`AUTORENEW_GRACE_PERIOD` (configurable, originally 7 days).<br/>
After the grace period, if the topic's expirationTime is not extended, the topic will be
automatically deleted from state entirely, and cannot be recovered or recreated.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| memo | [string](#string) |  | A short memo for this topic.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| adminKey | [Key](#proto-Key) |  | Access control for modification of the topic after it is created.<br/> If this field is set, that key MUST sign this transaction.<br/> If this field is set, that key MUST sign each future transaction to update or delete the topic.<br/> An updateTopic transaction that _only_ extends the topic expirationTime (a "manual renewal" transaction) SHALL NOT require admin key signature.<br/> A topic without an admin key SHALL be immutable, except for expiration and renewal.<br/> If adminKey is not set, then `autoRenewAccount` SHALL NOT be set. |
| submitKey | [Key](#proto-Key) |  | Access control for message submission to the topic.<br/> If this field is set, that key MUST sign each consensus submit message for this topic.<br/> If this field is not set then any account may submit a message on the topic, without restriction.<br/> |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The initial lifetime, in seconds, for the topic, and the number of seconds for which the topic will be automatically renewed upon expiring, if it has a valid auto-renew account.<br/> This value MUST be set.<br/> This value MUST be greater than the configured MIN_AUTORENEW_PERIOD.<br/> This value MUST be less than the configured MAX_AUTORENEW_PERIOD.<br/> |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | The ID of the account to be charged renewal fees at the topic's expirationTime to extend the lifetime of the topic.<br/> The topic lifetime will be extended by the smallest of the following: <ul> <li>The current `autoRenewPeriod` duration.</li> <li>The maximum duration that this account has funds to purchase.</li> <li>The configured MAX_AUTORENEW_PERIOD at the time of automatic renewal.</li> </ul> If this value is set, the referenced account MUST sign this transaction.<br/> If this value is set, the `adminKey` field MUST also be set (though that key MAY not have any correlation to this account), |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


