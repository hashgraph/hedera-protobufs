## Table of Contents

- [stream/block_proof.proto](#stream_block_proof-proto)
    - [BlockProof](#com-hedera-hapi-block-stream-BlockProof)
    - [MerkleSiblingHash](#com-hedera-hapi-block-stream-MerkleSiblingHash)
  



<a name="stream_block_proof-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_proof.proto
# Block Proof
A proof for the block streamed from a consensus node.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-BlockProof"></a>

### BlockProof
A cryptographic proof for the "Block Merkle Tree".

This message SHALL offer a proof for the "Block Merkle Tree".
The information in the "Block Merkle Tree" SHALL be used to validate the
full content of the most recent block, and, with chained validation,
all prior blocks.

### Block Merkle Tree
The Block Hash of any block is a merkle root hash comprised of a 4 leaf
binary merkle tree. The 4 leaves represent
1. Previous block proof hash
1. Merkle root of transaction inputs tree
1. Merkle root of transaction outputs tree
1. Merkle rook of state tree

#### Computing the hash
The process for computing a block hash is somewhat complex, and involves
creating a "virtual" merkle tree to obtain the root merkle hash of
that virtual tree.<br/>
The merkle tree SHALL have a 4 part structure with 2 internal nodes,
structured in a strictly binary tree.
- The merkle tree root SHALL be the parent of both
  internal nodes.
   1. The first "internal" node SHALL be the parent of the
      two "left-most" nodes.
      1. The first leaf MUST be the previous block hash, and is a
         single 48-byte value.
      1. The second leaf MUST be the root of a, strictly binary, merkle tree
         composed of all "input" block items in the block.<br/>
         Input items SHALL be transactions, system transactions,
         and events.<br/>
         Leaf nodes in this subtree SHALL be ordered in the same order
         that the block items are encountered in the stream.
   1. The second "internal" node SHALL be the parent of the two
      "right-most" nodes.
      1. The third leaf MUST be the root of a, strictly binary, merkle tree
         composed of all "output" block items in the block.<br/>
         Output items SHALL be transaction result, transaction
         output, and state changes.<br/>
         Leaf nodes in this subtree SHALL be ordered in the same order that
         the block items are encountered in the stream.
      1. The fourth leaf MUST be the merkle tree root hash for network state
         at the start of the block, and is a single 48-byte value.
- The block hash SHALL be the hash calculated for the root of this merkle
  tree.
- The hash algorithm used SHALL be the algorithm specified in the
  corresponding block header.

The "inputs" and "outputs" subtrees SHALL be "complete" binary merkle trees,
with nodes that would otherwise be missing replaced by a "null" hash
leaf.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block | [uint64](#uint64) |  | The block this proof secures.<br/> We provide this because a proof for a future block can be used to prove the state of the ledger at that block and the blocks before it.<br/> <p> This value SHOULD match the block number of the current block, under normal operation. |
| previous_block_root_hash | [bytes](#bytes) |  | A merkle root hash of the previous block. <p> This MUST contain a hash of the "block" merkle tree root for the previous block.<br/> The hash algorithm used MUST match the algorithm declared in the block header _for that block_. |
| start_of_block_state_root_hash | [bytes](#bytes) |  | A merkle root hash of the network state.<br/> This is present to support validation of this block proof by clients that do not maintain a full copy of the network state. <p> This MUST contain a hash of the "state" merkle tree root at the start of the current block (which this block proof verifies).<br/> State processing clients SHOULD calculate the state root hash independently and SHOULD NOT rely on this value.<br/> State processing clients MUST validate the application of state changes for a block using the value present in the Block Proof of the _following_ block. Compliant consensus nodes MUST produce an "empty" block (containing only `BlockHeader` and `BlockProof` as the last block prior to a network "freeze" to ensure the final state hash is incorporated into the Block Stream correctly. Stateless (non-state-processing) clients MUST use this value to construct the block merkle tree. |
| block_signature | [bytes](#bytes) |  | A TSS signature for one block.<br/> This is a single signature representing the collection of partial signatures from nodes holding strictly greater than 2/3 of the current network "weight" in aggregate. The signature is produced by cryptographic "aggregation" of the partial signatures to produce a single signature that can be verified with the network public key, but could not be produced by fewer nodes than required to meet the threshold for network stake "weight". <p> This message MUST make use of a threshold signature scheme like `BLS` which provides the necessary cryptographic guarantees.<br/> This signature SHALL use a TSS signature to provide a single signature that represents the consensus signature of consensus nodes.<br/> The exact subset of nodes that signed SHALL neither be known nor tracked, but it SHALL be cryptographically verifiable that the threshold was met if the signature itself can be validated with the network public key (a.k.a `LedgerID`). |
| sibling_hashes | [MerkleSiblingHash](#com-hedera-hapi-block-stream-MerkleSiblingHash) | repeated | A set of hash values along with ordering information.<br/> This list of hash values form the set of sibling hash values needed to correctly reconstruct the parent hash, and all hash values "above" that hash in the merkle tree. <p> A Block proof can be constructed by combining the sibling hashes for a previous block hash and sibling hashes for each entry "above" that node in the merkle tree of a block proof that incorporates that previous block hash. This form of block proof may be used to prove a chain of blocks when one or more older blocks is missing the original block proof that signed the block's merkle root directly. <p> This list MUST be ordered from the sibling of the node that contains this block's root node hash, and continues up the merkle tree to the root hash of the signed block proof. <p> If this block proof has a "direct" signature, then this list MUST be empty.<br/> If this list is not empty, then this block proof MUST be verified by first constructing the "block" merkle tree and computing the root hash of that tree, then combining that hash with the values in this list, paying attention to the first/second sibling ordering, until the root merkle hash is produced from the last pair of sibling hashes. That "secondary" root hash MUST then be verified using the value of `block_signature`. |






<a name="com-hedera-hapi-block-stream-MerkleSiblingHash"></a>

### MerkleSiblingHash
A hash of a "sibling" to an entry in a Merkle tree.

When constructing a binary merkle tree, each internal node is a hash
constructed from the hash of two "descendant" nodes. Those two nodes
are "siblings" and the order (first, second) in which the two hash values
are combined affects the parent hash.<br/>
This may be used to reconstruct a portion of a merkle tree starting from
a node of interest up to the root of the tree.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| is_first | [bool](#bool) |  | A flag for the position of this sibling. <p> If this is set then this sibling MUST be the first hash in the pair of sibling hashes of a binary merkle tree.<br/> If this is unset, then this sibling MUST be the second hash in the pair of sibling hashes of a binary merkle tree. |
| sibling_hash | [bytes](#bytes) |  | A byte array of a sibling hash.<br/> This is the hash for the sibling at this point in the merkle tree. <p> The algorithm for this hash SHALL match the algorithm for the block that contains this sibling.<br/> This SHALL contain the raw (e.g.) 384 bits (48 bytes) of the hash value. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


