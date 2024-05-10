## Table of Contents

- [stream/block_state_proof.proto](#stream_block_state_proof-proto)
    - [BinarySiblingHash](#com-hedera-hapi-block-stream-BinarySiblingHash)
    - [BlockStateProof](#com-hedera-hapi-block-stream-BlockStateProof)
    - [NodeSignature](#com-hedera-hapi-block-stream-NodeSignature)
    - [SiblingHash](#com-hedera-hapi-block-stream-SiblingHash)
    - [SiblingHashList](#com-hedera-hapi-block-stream-SiblingHashList)
  



<a name="stream_block_state_proof-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/block_state_proof.proto
# Block State Proof
A state proof for the block information in state at the end of an
Hedera block.

The basic process for a state proof (which provides cryptographic assurance
that a particular value is present in the network state) is as follows.<br/>
Compute the SHA384 hash of the value to be proven, then take that and
the sibling hashes and compute a SHA384 hash of those values to produce
the hash at the next level up the tree. Repeat this until you have the root
hash of the merkle tree. The signatures on that root hash are proof that
the hash (and hence the contents of the merkle path to the leaf value to
be proven) is attested by sufficient consensus nodes to be considered the
actual state of the network.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-BinarySiblingHash"></a>

### BinarySiblingHash
A single "sibling" hash.

Sibling hashes have an order from "left" to "right". This message SHALL
enable the specification of order as an explicit left/right boolean.<br/>
A system sending sibling hash data MUST structure any `repeated` field
to contain all sibling hashes "left" of a target hash first, in tree
order, and add all sibling hashes "right" of the target hash second,
also in tree order.<br/>
Any sibling hash "left" of the target hash MUST set `is_left_hash` to
`true`.<br/>
Any sibling hash "right" of the target hash MUST set `is_left_hash` to
`false`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sibling_hash | [bytes](#bytes) |  | A "sibling" hash of the target item hash. |
| is_left_hash | [bool](#bool) |  | A flag indicating that this "sibling" hash that is "left" of the target item hash in merkle-tree order. |






<a name="com-hedera-hapi-block-stream-BlockStateProof"></a>

### BlockStateProof
A state proof for the `BlockInfo` singleton in network state.

This message SHALL offer a state proof for the `BlockInfo` singleton at
the end of a block. The information in the `BlockInfo` singleton SHALL be
used to validate the full content of the most recent block, and, with
chained validation, all prior blocks.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_block_info | [proto.BlockInfo](#proto-BlockInfo) |  | The `BlockInfo` from state.<br/> This state proof SHALL be proof that this `BlockInfo` value is in state at the end of the "proven" block. |
| sibling_hashes | [SiblingHashList](#com-hedera-hapi-block-stream-SiblingHashList) | repeated | A list of sibling hashes.<br/> This SHALL contain sibling hashes at each level of tree from the `BlockInfo` leaf up to the root of the merkle tree.<br/> These values MUST be in the same "merkle path" order as present in state. |
| node_signatures | [NodeSignature](#com-hedera-hapi-block-stream-NodeSignature) | repeated | A list of consensus node signatures over the state merkle tree root.<br/> This MUST contain signatures from strictly greater than two-thirds of all consensus nodes active in the network address book present in network state at the beginning of the current block.<br/> This MAY be a different valid subset of all active consensus nodes for each such node that produces a block stream.<br/> All signatures MUST be RSA signatures over the SHA2-384 hash at the root of the merkle tree.<br/> These signatures SHOULD be verified before accepting this state proof. <p> <blockquote>Note<blockquote> We intend to replace this field with a different structure; most likely a TSS-BLS threshold signature. </blockquote></blockquote> |






<a name="com-hedera-hapi-block-stream-NodeSignature"></a>

### NodeSignature
A state signature.

This value is a cryptographic signature (RSA_DSS, edDSA, or ECDSA) over the
hash at the root of the network state merkle tree.
Each such signature SHALL serve as assertion by a particular node that the
given hash is the actual root hash of the network merkle state as observed
by that node at the time the signature is generated.

> REVIEW QUESTION
>> Do we need time (e.g. consensus time or round)? The address book varies
>> over time, and we require, here, the address book _as of_ the moment
>> when the signature was generated, not necessarily the address book
>> at some later instant.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| signature | [bytes](#bytes) |  | A cryptographic signature. <p> This value MUST be generated using the private key of the node recorded in `node_id`.<br/> This value MUST be generated by signing the SHA2-384 hash at the root of the merkle tree network state.<br/> This value MUST be generated using the current accepted signature algorithm. The current signature algorithm is RSA_DSS. |
| node_id | [uint64](#uint64) |  | The node that generated this signature. <p> This SHALL provide the reference required to look up that node's public key in the address book at the time of signature. The correct node public key is REQUIRED in order to verify this signature. |






<a name="com-hedera-hapi-block-stream-SiblingHash"></a>

### SiblingHash
A single "sibling" hash.

Sibling hashes have an order from "left" to "right". This message
SHALL enable the specification of order as a matter of message schema.<br/>
A system sending sibling hash data MUST structure any `repeated` field
to contain all sibling hashes "left" of a target hash first, in tree
order, and add all sibling hashes "right" of the target hash second,
also in tree order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| left_sibling_hash | [bytes](#bytes) |  | A "sibling" hash that is "left" of the target item hash in merkle-tree order. |
| right_sibling_hash | [bytes](#bytes) |  | A "sibling" hash that is "right" of the target item hash in merkle-tree order. |






<a name="com-hedera-hapi-block-stream-SiblingHashList"></a>

### SiblingHashList
Sibling hashes at one level in the merkle tree.

The set of hash values "adjacent" to a particular tree node are REQUIRED
to generate the hash value of the "parent" tree node.<br/>
This message SHALL contain the list of all such "sibling" hash values for
a given node (not referenced here).<br/>
This message MUST record the sibling hashes in the same "merkle tree order"
as those hash values are stored in the network state.

> REVIEW NOTE
>> We need to identify where, in a list of sibling hashes, the current
>> "target" hash belongs. For a purely binary tree, that would be are we
>> the "left" or the "right" node. For an n-ary tree that's 'which
>> siblings are to our "left", which are to our "right"?'.<br/>
>> Options:
>> <ol>
>>   <li>Include the "target" hash in the list at the correct location.</li>
>>   <li>For each sibling hash (which becomes a message), have a boolean for
>>       left/right.</li>
>>   <li>For each sibling hash (which becomes a message), have a oneof with
>>       left_hash and right_hash.</li>
>> </ol>
>> Option (1) is simple, works for n-ary trees, and makes parent hash
>> calculation very simple. It does require more data (one added hash per
>> level, which is expensive for a pure binary tree structure).<br/>
>> Option (2) is slightly more complex, works well for a pure binary tree
>> structure, but requires an added boolean field.<br/>
>> Option (3) is slightly more complex, works well for a pure binary tree
>> structure, and is the most data-efficient option. This also works for
>> n-ary trees, with slightly more complex validation logic and a more
>> complex specification of requirements.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sibling_hash | [bytes](#bytes) | repeated | A list of hash values. <p> Each hash value in this list MUST be generated using the SHA384 algorithm. This list determines right-left ordering by including the target hash in the list in the correct merkle-tree-ordered location. |
| sibling_hashes_bool | [BinarySiblingHash](#com-hedera-hapi-block-stream-BinarySiblingHash) | repeated | A list of hash values. <p> Each hash value in this list MUST be generated using the SHA384 algorithm. This list determines right-left by setting a boolean value. |
| sibling_hashes_oneof | [SiblingHash](#com-hedera-hapi-block-stream-SiblingHash) | repeated | A list of hash values. <p> Each hash value in this list MUST be generated using the SHA384 algorithm. This list determines right-left by using different fields in a `oneof`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



