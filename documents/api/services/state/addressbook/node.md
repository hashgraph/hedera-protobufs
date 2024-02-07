## Table of Contents

- [state/addressbook/node.proto](#state_addressbook_node-proto)
    - [Node](#com-hedera-hapi-node-state-addressbook-Node)
  



<a name="state_addressbook_node-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/addressbook/node.proto



<a name="com-hedera-hapi-node-state-addressbook-Node"></a>

### Node
A single address book node in the network state.

Each node in the network address book SHALL represent a single actual
consensus node that is eligible to participate in network consensus.

Address book nodes SHALL NOT be _globally_ uniquely identified. A given node
is only valid within a single realm and shard combination, so the identifier
for a network node SHALL only be unique within a single realm and shard
combination.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [uint64](#uint64) |  | A consensus node identifier. <p> Node identifiers SHALL be globally unique for a given ledger. |
| account_id | [proto.AccountID](#proto-AccountID) |  | An account identifier. <p> This account SHALL be owned by the entity responsible for the node.<br/> This account SHALL be charged transaction fees for any transactions that are submitted to the network by this node and fail due diligence checks.<br/> This account SHALL be paid the node portion of transaction fees for transactions submitted by this node. |
| description | [string](#string) |  | A short description of the node. <p> This value, if set, SHALL NOT exceed 100 bytes when encoded as UTF-8. |
| gossip_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | repeated | A list of service endpoints for gossip. <p> These endpoints SHALL represent the published endpoints to which other consensus nodes may _gossip_ transactions.<br/> If the network configuration value `gossipFqdnRestricted` is set, then all endpoints in this list SHALL supply only IP address.<br/> If the network configuration value `gossipFqdnRestricted` is _not_ set, then endpoints in this list MAY supply either IP address or FQDN, but SHALL NOT supply both values for the same endpoint.<br/> This list SHALL NOT be empty.<br/> This list SHALL NOT contain more than `10` entries.<br/> The first two entries in this list SHALL be the endpoints published to all consensus nodes.<br/> All other entries SHALL be reserved for future use. |
| service_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | repeated | A list of service endpoints for client calls. <p> These endpoints SHALL represent the published endpoints to which clients may submit transactions.<br/> These endpoints SHALL specify a port.<br/> Endpoints in this list MAY supply either IP address or FQDN, but SHALL NOT supply both values for the same endpoint.<br/> This list SHALL NOT be empty.<br/> This list SHALL NOT contain more than `8` entries. |
| gossip_ca_certificate | [bytes](#bytes) |  | A certificate used to sign gossip events. <p> This value SHALL be a certificate of a type permitted for gossip signatures.<br/> This value SHALL be the DER encoding of the certificate presented.<br/> This field is REQUIRED and MUST NOT be empty. |
| grpc_certificate_hash | [bytes](#bytes) |  | A hash of the node gRPC certificate. <p> This value MAY be used to verify the certificate presented by the node during TLS negotiation for gRPC.<br/> This value SHALL be a SHA-384 hash.<br/> The TLS certificate to be hashed SHALL first be in PEM format and SHALL be encoded with UTF-8 NFKD encoding to a stream of bytes provided to the hash algorithm.<br/> This field is OPTIONAL. |
| weight | [uint64](#uint64) |  | A consensus weight. <p> Each node SHALL have a weight in consensus calculations.<br/> The consensus weight of a node SHALL be calculated based on the amount of HBAR staked to that node.<br/> Consensus SHALL be calculated based on agreement of greater than `2/3` of the total `weight` value of all nodes on the network. |
| deleted | [bool](#bool) |  | A flag indicating this node is deleted. <p> If this field is set, then this node SHALL NOT be included in the next update of the network address book.<br/> If this field is set, then this node SHALL be immutable and SHALL NOT be modified.<br/> If this field is set, then any `nodeUpdate` transaction to modify this node SHALL fail. |
| admin_key | [proto.Key](#proto-Key) |  | An administrative key controlled by the node operator. <p> This key MUST sign each transaction to update this node.<br/> This field MUST contain a valid `Key` value.<br/> This field is REQUIRED and MUST NOT be set to an empty `KeyList`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



