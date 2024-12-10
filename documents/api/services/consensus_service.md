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
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-ConsensusService"></a>

### ConsensusService
The Hedera Consensus Service (HCS) provides the ability for a Hashgraph to
provide aBFT consensus as to the order and validity of messages submitted to
a *topic*, as well as a *consensus timestamp* for those messages.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Create an HCS topic. <p> On success, the resulting TransactionReceipt SHALL contain the newly created TopicId.<br/> If the `adminKey` is set on the topic, this transaction MUST be signed by that key.<br/> If the `adminKey` is _not_ set on the topic, this transaction MUST NOT set an `autoRenewAccount`. The new topic will be immutable and must be renewed manually.<br/> If the `autoRenewAccount` is set on the topic, this transaction MUST be signed by that account.<br/> <p> The request body MUST be a [ConsensusCreateTopicTransactionBody](#proto.ConsensusCreateTopicTransactionBody) |
| updateTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Update an HCS topic. <p> If the `adminKey` is not set on the topic, this transaction MUST extend the `expirationTime` and MUST NOT modify any other field.<br/> If the `adminKey` is set on the topic, this transaction MUST be signed by that key.<br/> If this transaction sets a new `adminKey`, this transaction MUST be signed by <strong>_both_</strong> keys, the pre-update `adminKey` and the post-update `adminKey`.<br/> If this transaction sets a new, non-null, `autoRenewAccount`, the newly set account MUST sign this transaction.<br/> <p> The request body MUST be a [ConsensusUpdateTopicTransactionBody](#proto.ConsensusUpdateTopicTransactionBody) |
| deleteTopic | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Delete an HCS topic. <p> If this transaction succeeds, all subsequent transactions referencing the deleted topic SHALL fail.<br/> The `adminKey` MUST be set on the topic and this transaction MUST be signed by that key.<br/> If the `adminKey` is not set on the topic, this transaction SHALL fail with a response code of `UNAUTHORIZED`. A topic without an `adminKey` cannot be deleted, but MAY expire.<br/> <p> The request body MUST be a [ConsensusDeleteTopicTransactionBody](#proto.ConsensusDeleteTopicTransactionBody) |
| submitMessage | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Submit a message to an HCS topic. <p> Valid and authorized messages on valid topics will be ordered by the consensus service, published in the block stream, and available to all subscribers on this topic via the mirror nodes.<br/> If this transaction succeeds the resulting TransactionReceipt SHALL contain the latest topicSequenceNumber and topicRunningHash for the topic.<br/> If the topic has a `submitKey` then that key MUST sign this transaction.<br/> <p> The request body MUST be a [ConsensusSubmitMessageTransactionBody](#proto.ConsensusSubmitMessageTransactionBody) |
| getTopicInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the latest state of a topic. This method is unrestricted and allowed on any topic by any payer account. <p> The request body MUST be a [ConsensusGetTopicInfoQuery](#proto.ConsensusGetTopicInfoQuery)<br/> The response body SHALL be a [ConsensusGetTopicInfoResponse](#proto.ConsensusGetTopicInfoResponse) |

 <!-- end services -->



