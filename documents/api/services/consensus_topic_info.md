## Table of Contents

- [consensus_topic_info.proto](#consensus_topic_info-proto)
    - [ConsensusTopicInfo](#proto-ConsensusTopicInfo)
  



<a name="consensus_topic_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## consensus_topic_info.proto
# Topic Information
Query response describing a topic of the Hedera Consensus Service (HCS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ConsensusTopicInfo"></a>

### ConsensusTopicInfo
A query response describing the current state of a topic for the Hedera
Consensus Service (HCS).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| memo | [string](#string) |  | A short description of this topic. <p> This value, if set, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| runningHash | [bytes](#bytes) |  | The latest running hash of the topic. <p> This 48-byte field is the output of a SHA-384 digest with input data determined by the current version of the running hash algorithm used by the network.<br/> All new transactions SHALL use algorithm version `3`.<br/> The bytes of each uint64 or uint32 encoded for the hash input MUST be in Big-Endian format. <p> <hr/> If the algorithm version is '3', then the input data to the SHA-384 digest are, in order: <ol> <li>The previous running hash of the topic (48 bytes)</li> <li>The `topicRunningHashVersion` (8 bytes)</li> <li>The payer account's shard (8 bytes)</li> <li>The payer account's realm (8 bytes)</li> <li>The payer account's number (8 bytes)</li> <li>The topic's shard (8 bytes)</li> <li>The topic's realm (8 bytes)</li> <li>The topic's number (8 bytes)</li> <li>The number of seconds since the epoch when the `ConsensusSubmitMessage` reached consensus (8 bytes)</li> <li>The number of nanoseconds within the second when the `ConsensusSubmitMessage` reached consensus (4 bytes)</li> <li>The `topicSequenceNumber` (8 bytes)</li> <li>The output of a SHA-384 digest of the message bytes from the `ConsensusSubmitMessage` (48 bytes)</li> </ol> |
| sequenceNumber | [uint64](#uint64) |  | The current sequence number (starting at 1 for the first message) for messages on this topic. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The expiration time for this topic, in seconds since the epoch. <p> For this purpose, `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`. |
| adminKey | [Key](#proto-Key) |  | The key that MUST sign any transaction to update or modify this topic. <p> If this value is not set (null) then the topic CANNOT be deleted, modified, or updated. |
| submitKey | [Key](#proto-Key) |  | The key that MUST sign any transaction to submit a message to this topic. <p> If this value is not set (null) then any account MAY submit messages to this topic. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The duration, in seconds, to extend the `expirationTime` value when this topic is automatically renewed. <p> If the `autoRenewAccount` value for this topic is set to a valid account with sufficient HBAR balance to pay renewal fees when this topic expires, the system SHALL automatically renew this topic, extending the `expirationTime` value by the number of seconds described here.<br/> If, however, the `autoRenewAccount` lacks sufficient HBAR balance to pay renewal fees when this topic expires, this topic SHALL be deleted after the time period specified in the `AUTORENEW_GRACE_PERIOD` configuration value. |
| autoRenewAccount | [AccountID](#proto-AccountID) |  | An account that is designated to pay automatic renewal fees. <p> If this value is a valid account ID when this topic expires, this account SHALL be charged the renewal fees for this topic, if it holds sufficient HBAR balance. If the account does not hold sufficient HBAR balance to pay renewal fees when necessary, then this topic SHALL be deleted.<br/> If this value is not set (null), or is not a valid account ID, when this topic expires, then this topic SHALL be deleted after the time period specified in the `AUTORENEW_GRACE_PERIOD` configuration value. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response. <p> This is originally defined in HIP-198 and depends on network configuration. The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


