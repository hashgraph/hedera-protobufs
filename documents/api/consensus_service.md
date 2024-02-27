## Table of Contents

- [consensus_service.proto](#consensus_service-proto)
    - [ConsensusService](#proto-ConsensusService)
  



<a name="consensus_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_service.proto
# Consensus Service API
GRPC service definitions for the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-ConsensusService"></a>

### ConsensusService
The Consensus Service provides the ability for Hedera Hashgraph to provide aBFT consensus as to
the order and validity of messages submitted to a *topic*, as well as a *consensus timestamp* for
those messages.

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
  - All transactions on the topic SHALL fail with `TOPIC_EXPIRED`
     - Except an `updateTopic` call that only extends the `expirationTime`.
  - `getTopicInfo` MAY succeed, and SHALL show that the topic is expired.
The topic SHALL remain in the `EXPIRED` state for a "grace period" determined by the value of
`AUTORENEW_GRACE_PERIOD`. This value is configured for the network.<br/>
If the `expirationTime` is not extended within this "grace period", the topic SHALL be
removed from state entirely, and SHALL NOT be recovered or recreated.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Create an HCS topic.<br/> On success, the resulting TransactionReceipt contains the newly created TopicId. If the `adminKey` is set on the topic, this transaction MUST be signed by that key.<br/> If the `adminKey` is _not_ set on the topic, this transaction MUST NOT set an `autoRenewAccount`. The new topic will be immutable and must be renewed manually.<br/> If the `autoRenewAccount` is set on the topic, this transaction MUST be signed by that account.<br/> <p> The request body is a [ConsensusCreateTopicTransactionBody](#proto.ConsensusCreateTopicTransactionBody) |
| updateTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Update an HCS topic.<br/> If the `adminKey` is not set on the topic, this transaction MUST extend the `expirationTime` and MUST NOT modify any other field. If the `adminKey` is set on the topic, this transaction MUST be signed by that key.<br/> If this transaction sets a new `adminKey`, this transaction MUST be signed by <strong>_both_</strong> keys, the pre-update `adminKey` and the post-update `adminKey`.<br/> If this transaction sets a new, non-null, `autoRenewAccount`, the newly set account MUST sign this transaction.<br/> <p> The request body is a [ConsensusUpdateTopicTransactionBody](#proto.ConsensusUpdateTopicTransactionBody) |
| deleteTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Delete an HCS topic.<br/> If this transaction succeeds, all subsequent transactions referencing the deleted topic SHALL fail.<br/> The `adminKey` MUST be set on the topic and this transaction MUST be signed by that key.<br/> If the `adminKey` is not set on the topic, this transaction SHALL fail with a response code of `UNAUTHORIZED`. A topic without an `adminKey` cannot be deleted, but MAY expire.<br/> <p> The request body is a [ConsensusDeleteTopicTransactionBody](#proto.ConsensusDeleteTopicTransactionBody) |
| submitMessage | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Submit a message to an HCS topic.<br/> Valid and authorized messages on valid topics will be ordered by the consensus service, published in the block stream, and available to all subscribers on this topic via the mirror nodes.<br/> If this transaction succeeds the resulting TransactionReceipt SHALL contain the latest topicSequenceNumber and topicRunningHash for the topic.<br/> If the topic has a `submitKey` then that key MUST sign this transaction.<br/> <p> The request body is a [ConsensusSubmitMessageTransactionBody](#proto.ConsensusSubmitMessageTransactionBody) |
| getTopicInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the latest state of a topic. This method is unrestricted and allowed on any topic by any payer account.<br/> <p> The request body is a [ConsensusGetTopicInfoQuery](#proto.ConsensusGetTopicInfoQuery)<br/> The response body is a [ConsensusGetTopicInfoResponse](#proto.ConsensusGetTopicInfoResponse) |

 <!-- end services -->


