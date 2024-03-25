## Table of Contents

- [stream/block_state_proof.proto](#stream_block_state_proof-proto)
    - [BlockSignature](#proto-BlockSignature)
    - [BlockStateProof](#proto-BlockStateProof)
    - [SiblingHashes](#proto-SiblingHashes)
  



<a name="stream_block_state_proof-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_state_proof.proto
#


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BlockSignature"></a>

### BlockSignature
Signature of one node on root hash of state proof


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | The cryptographic signature of the root SHA384 hash of a merkle tree path to the leaf containing the running hashes for this signature. |
| node_id | [uint64](#uint64) |  | The node that is signing. This is needed to look up the node public key in latest address book to verify the signature above. |






<a name="proto-BlockStateProof"></a>

### BlockStateProof
Compute the SHA384 hash of RunningHashes, then take that and the sibling
hashes and SHA384 hash them to get the hash at the next level up. Repeat till
you have root hash and BlockSignature's will be signatures from each node of
that root hash.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| round | [uint64](#uint64) |  | The round this proof was created for. We provide this because a proof for a future round can be used to prove the state of the ledger at that round and the rounds before it. |
| sibling_hashes | [SiblingHashes](#proto-SiblingHashes) | repeated | Sibling hashes at each level of tree from root to leaf |
| end_running_hashes | [RunningHashes](#proto-RunningHashes) |  | The RunningHashes leaf, Running SHA384 hash of all items contained in the block. And previous 3 blocks running hashes.

RunningHashes.running_hash = the end running hash of this block RunningHashes.n_minus_1_running_hash = the start running hash of this block, aka the end running hash of previous block. |
| block_signatures | [BlockSignature](#proto-BlockSignature) | repeated | Nodes signing the root hash of state proof tree. This will include at least 2/3rds + 1 nodes of the current valid address book. It might be a different subset of nodes in block files produced by different nodes. |






<a name="proto-SiblingHashes"></a>

### SiblingHashes
All sibling hashes at one level in the tree


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sibling_hash | [bytes](#bytes) | repeated |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



