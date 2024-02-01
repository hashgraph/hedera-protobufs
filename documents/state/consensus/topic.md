## Table of Contents

- [state/consensus/topic.proto](#state_consensus_topic-proto)
    - [Topic](#proto-Topic)
  



<a name="state_consensus_topic-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/consensus/topic.proto



<a name="proto-Topic"></a>

### Topic
Representation of a Hedera Consensus Service topic in the network Merkle tree.

As with all network entities, a topic has a unique entity number, which is usually given along
with the network's shard and realm in the form of a shard.realm.number id.

A topic consists of just two pieces of data:
  1. The total number of messages sent to the topic; and,
  2. The running hash of all those messages.
It also has several metadata elements:
  1. A consensus expiration time in seconds since the epoch.
  2. (Optional) The number of an auto-renew account, in the same shard and realm as the topic, that
  has signed a transaction allowing the network to use its balance to automatically extend the topic's
  expiration time when it passes.
  3. The number of seconds the network should automatically extend the topic's expiration by, if the
  topic has a valid auto-renew account, and is not deleted upon expiration.
  4. A boolean marking if the topic has been deleted.
  5. A memo string whose UTF-8 encoding is at most 100 bytes.
  6. (Optional) An admin key whose signature must be active for the topic's metadata to be updated.
  7. (Optional) A submit key whose signature must be active for the topic to receive a message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| topic_id | [TopicID](#proto-TopicID) |  | The topic's unique id in the Merkle state. |
| sequence_number | [int64](#int64) |  | The number of messages sent to the topic. |
| expiration_second | [int64](#int64) |  | The topic's consensus expiration time in seconds since the epoch. |
| auto_renew_period | [int64](#int64) |  | The number of seconds for which the topic will be automatically renewed upon expiring (if it has a valid auto-renew account). |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | The id of the account (if any) that the network will attempt to charge for the topic's auto-renewal upon expiration. |
| deleted | [bool](#bool) |  | Whether this topic is deleted. |
| running_hash | [bytes](#bytes) |  | When a topic is created, its running hash is initialized to 48 bytes of binary zeros. For each submitted message, the topic's running hash is then updated to the output of a particular SHA-384 digest whose input data include the previous running hash.

See the TransactionReceipt.proto documentation for an exact description of the data included in the SHA-384 digest used for the update. |
| memo | [string](#string) |  | An optional description of the topic with UTF-8 encoding up to 100 bytes. |
| admin_key | [Key](#proto-Key) |  | If present, enforces access control for updating or deleting the topic. A topic without an admin key is immutable. |
| submit_key | [Key](#proto-Key) |  | If present, enforces access control for message submission to the topic. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


