## Table of Contents

- [stream/block_proof.proto](#stream_block_proof-proto)
    - [BlockProof](#com-hedera-hapi-block-stream-BlockProof)
    - [BlockSignature](#com-hedera-hapi-block-stream-BlockSignature)
  



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
         at the end of the block, and is a single 48-byte value.
- The block hash SHALL be the SHA-384 hash calculated for the root
  of this merkle tree.

The "inputs" and "outputs" subtrees SHALL be "complete" binary merkle trees,
with nodes that would otherwise be missing replaced by a "null" hash
leaf.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| round | [uint64](#uint64) |  | The round this proof secures.<br/> We provide this because a proof for a future round can be used to prove the state of the ledger at that round and the rounds before it.<br/> <p> This value SHOULD match the round of the current block, under normal operation. |
| block_root_hash | [bytes](#bytes) |  | A merkle root hash. <p> This MUST contain a SHA-384 hash of the "block" merkle tree root. |
| block_signature | [BlockSignature](#com-hedera-hapi-block-stream-BlockSignature) |  | A TSS-BLS network signature. <p> This signature SHALL use a TSS-BLS threshold signature to provide a single signature that represents the consensus signature of at least the current threshold (i.e. 2/3 + 1) of consensus nodes. The exact subset of nodes that signed SHALL neither be known nor tracked, but it SHALL be cryptographically verifiable that the threshold was met if the signature itself can be validated with the network public key. |






<a name="com-hedera-hapi-block-stream-BlockSignature"></a>

### BlockSignature
A TSS-BLS signature for one block.
This is a single signature representing the collection of partial
signatures from nodes holding strictly greater than 2/3 of the current
network "weight" in aggregate. The signature is produced by cryptographic
"aggregation" of the partial signatures to produce a single signature that
can be verified with the network public key, but could not be produced by
fewer nodes than required to meet the threshold for network stake "weight".

This message MUST make use of a threshold signature scheme like `BLS` which
provides the necessary cryptographic guarantees.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | A single TSS-BLS signature for the block merkle tree. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



