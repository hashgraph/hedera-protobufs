## Table of Contents

- [stream/system_transaction.proto](#stream_system_transaction-proto)
    - [BitsPerSecondSystemTransaction](#com-hedera-hapi-block-stream-BitsPerSecondSystemTransaction)
    - [PingSystemTransaction](#com-hedera-hapi-block-stream-PingSystemTransaction)
    - [StateSignatureSystemTransaction](#com-hedera-hapi-block-stream-StateSignatureSystemTransaction)
    - [SystemTransaction](#com-hedera-hapi-block-stream-SystemTransaction)
  



<a name="stream_system_transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/system_transaction.proto
# System Transaction
Block data for a system transaction.
System transactions are a small set of items that are purely internal to the
DLT system, but still impact state.
The messages defined here are sent from a consensus node to a block node
to ensure the block node may record these internal details for later query
or independent verification.

> NOTE
>> This message may be removed soon as the platform removes the concept of
>> "System Transaction" entirely.

System transactions include
- State signature<br/>
  Individual state signatures sent between network nodes.
- Average bits-per-second sent<br/>
  Throughput metric data sent between network nodes.
- Average ping time<br/>
  Latency metric data sent between network nodes.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-BitsPerSecondSystemTransaction"></a>

### BitsPerSecondSystemTransaction
A network throughput system transaction.

This type of system-internal transaction SHALL be shared via gossip between all consensus nodes
at the end of each consensus round to maintain visibility to network throughput statistics
for the network.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| avg_bits_per_sec_sent | [uint64](#uint64) | repeated | Network throughput measurements.<br/> This field SHALL contain one measurement for each consensus node present in the network address book at the end of the corresponding round.<br/> These values SHALL be computed from the metric information gathered during regular gossip communications. |






<a name="com-hedera-hapi-block-stream-PingSystemTransaction"></a>

### PingSystemTransaction
A network latency system transaction.

This type of system-internal transaction SHALL be shared via gossip between all consensus nodes
at the end of each consensus round to maintain visibility to network latency statistics
for the network.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| avg_ping_milliseconds | [uint32](#uint32) | repeated | Network latency measurements.<br/> This field SHALL contain one measurement for each consensus node present in the network address book at the end of the corresponding round.<br/> These values SHALL be computed from the metric information gathered during regular gossip communications. |






<a name="com-hedera-hapi-block-stream-StateSignatureSystemTransaction"></a>

### StateSignatureSystemTransaction
A state signature transaction.

This type of system-internal transaction SHALL be shared via gossip between all consensus nodes
to validate the consensus state of the network.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_signature | [bytes](#bytes) |  | A state signature from a single node.<br/> The algorithm used to create this signature SHALL be determined by current network configuration.<br/> The signature algorithms used for network state and block stream SHALL be independent and MAY be different. |
| state_hash | [bytes](#bytes) |  | A hash value at the root of the state merkle tree.<br/> This value SHALL be the current Merkle root hash at the end of the signed round.<br/> This value SHALL be computed according to the current merkle hash algorithm configured for the network.<br/> The hash algorithms used for network state and block stream SHALL be independent and MAY be different. |
| epoch_hash | [bytes](#bytes) |  | A hash value for the epoch to which this signature corresponds.<br/> This value SHALL be computed according to the current epoch hash algorithm configured for the network.<br/> The hash algorithms used for network state and block stream SHALL be independent and MAY be different. |
| round | [uint64](#uint64) |  | Round number of this state signature. |






<a name="com-hedera-hapi-block-stream-SystemTransaction"></a>

### SystemTransaction
A system-internal transaction to maintain network state across nodes.

These transactions maintain the integrity of the distributed ledger and support
metrics to determine the network of consensus nodes are all well connected to the
other consensus nodes.

This message SHALL be sent to record the result of these internal consensus transactions
to the block nodes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_signature | [StateSignatureSystemTransaction](#com-hedera-hapi-block-stream-StateSignatureSystemTransaction) |  | A single state signature.<br/> A state SHALL be complete when the network has successfully gathered state signatures from greater than two thirds of consensus nodes listed in the network address book.<br/> The network has successfully gathered a signature when greater than two thirds of consensus nodes listed in the network address book have received and verified that signature. |
| bits_per_second | [BitsPerSecondSystemTransaction](#com-hedera-hapi-block-stream-BitsPerSecondSystemTransaction) |  | A metric sharing transaction.<br/> Each node SHALL calculate the observed network throughput to all other nodes each round.<br/> This information SHALL be shared with all other nodes via this transaction type. The aggregate of these measurements MAY be used to determine if one or more nodes is losing or has lost full connectivity to the network. |
| ping | [PingSystemTransaction](#com-hedera-hapi-block-stream-PingSystemTransaction) |  | A metric sharing transaction.<br/> Each node SHALL calculate the observed network latency to all other nodes each round.<br/> This information SHALL be shared with all other nodes via this transaction type. The aggregate of these measurements MAY be used to determine if one or more nodes is losing or has lost full connectivity to the network. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



