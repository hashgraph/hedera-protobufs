## Table of Contents

- [node_get_info.proto](#node_get_info-proto)
    - [NodeGetInfoQuery](#com-hedera-hapi-node-addressbook-NodeGetInfoQuery)
    - [NodeGetInfoResponse](#com-hedera-hapi-node-addressbook-NodeGetInfoResponse)
    - [NodeInfo](#com-hedera-hapi-node-addressbook-NodeInfo)
  



<a name="node_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## node_get_info.proto



<a name="com-hedera-hapi-node-addressbook-NodeGetInfoQuery"></a>

### NodeGetInfoQuery
A transaction body for a `getNodeInfo ` node information query request.

This transaction body SHALL be considered a "privileged transaction".

- A `NodeGetInfoQuery` MUST be signed by the governing council.
- This query requests details for a single consensus node entry in the
  network state.
- The node identifier `node_id` is REQUIRED, and identifies the node for
  which details are requested.

> Note
>> Requiring governing council signature for a query like this seems quite
>> unusual.  Further detail for _why_ only the governing council is permitted
>> to query this information would be helpful (particularly as the block
>> stream and mirror node make it trivial to obtain the same information).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [proto.QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation. <p> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| node_id | [uint64](#uint64) |  | A consensus node identifier for which information is requested. <p> If the identified node is not valid, this request SHALL fail with a response code `INVALID_NODE_ID`.<br/> If the identified node is not present in the network state, this request SHALL fail with a response code `INVALID_NODE_ID`. |






<a name="com-hedera-hapi-node-addressbook-NodeGetInfoResponse"></a>

### NodeGetInfoResponse
Response body for a `getNodeInfo` node information query.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [proto.ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| nodeInfo | [NodeInfo](#com-hedera-hapi-node-addressbook-NodeInfo) |  | The requested detail information. <p> This message SHALL contain the full detail for the node identified in the query request. |






<a name="com-hedera-hapi-node-addressbook-NodeInfo"></a>

### NodeInfo
A query response describing the current state of a consensus node entry in
the network state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [uint64](#uint64) |  | A consensus node identifier in the network state. <p> This value identifies this node within the network address book.<br/> This value is REQUIRED. |
| account_id | [proto.AccountID](#proto-AccountID) |  | An account identifier. <p> This account MUST be owned by the entity responsible for the node.<br/> This account SHALL be charged transaction fees for any transactions that are submitted to the network by this node and fail due diligence checks.<br/> This value is REQUIRED. |
| description | [string](#string) |  | A short description of the consensus node. <p> This value, if present, MUST NOT exceed 100 bytes when encoded as UTF-8. |
| gossip_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | repeated | A list of service endpoints for gossip. <p> These endpoints SHALL represent the published endpoints to which other consensus nodes may _gossip_ transactions.<br/> These endpoints SHOULD NOT specify both address and DNS name.<br/> This list SHALL NOT be empty.<br/> This list SHALL NOT contain more than `10` entries.<br/> The first two entries in this list SHALL be the endpoints published to all consensus nodes.<br/> All other entries SHALL be reserved for future use. <p> Each network may have additional requirements for these endpoints. A client MUST check network-specific documentation for those details.<br/> <blockquote>Example<blockquote> Hedera Mainnet _requires_ that address be specified, and does not permit DNS name (FQDN) to be specified.<br/> Mainnet also requires that the first entry be an "internal" IP address and the second entry be an "external" IP address. </blockquote> <blockquote> Solo, however, _requires_ DNS name (FQDN) but also permits address. </blockquote></blockquote> |
| service_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | repeated | A list of service endpoints for gRPC calls. <p> These endpoints SHALL represent the published endpoints to which clients may submit transactions.<br/> These endpoints SHOULD specify address and port.<br/> These endpoints MAY specify a DNS name.<br/> These endpoints SHOULD NOT specify both address and DNS name.<br/> This list SHALL NOT be empty.<br/> This list SHALL NOT contain more than `8` entries. <p> Each network may have additional requirements for these endpoints. A client MUST check network-specific documentation for those details. |
| gossip_ca_certificate | [bytes](#bytes) |  | A certificate used to sign gossip events. <p> This value SHALL be a certificate of a type permitted for gossip signatures.<br/> This value SHALL be the DER encoding of the certificate presented.<br/> This field is REQUIRED and MUST NOT be empty. |
| grpc_certificate_hash | [bytes](#bytes) |  | A hash of the node gRPC TLS certificate. <p> This value MAY be used to verify the certificate presented by the node during TLS negotiation for gRPC.<br/> This value MUST be a SHA-384 hash.<br/> The TLS certificate to be hashed SHALL first be in PEM format and SHALL be encoded with UTF-8 NFKD encoding to a stream of bytes provided to the hash algorithm.<br/> This field is OPTIONAL. |
| weight | [uint64](#uint64) |  | A consensus weight. <p> Each node SHALL have a weight in consensus calculations.<br/> The consensus weight of a node SHALL be calculated based on the amount of HBAR staked to that node.<br/> Consensus SHALL be calculated based on agreement of greater than `2/3` of the total `weight` value of all nodes on the network. |
| deleted | [bool](#bool) |  | A flag indicating this node was removed from the network. <p> This flag SHALL NOT be set unless a `deleteNode` transaction previously succeeded identifying that node.<br/> If this flag is set, the associated node SHALL NOT participate in the network. |
| ledger_id | [bytes](#bytes) |  | A ledger ID. <p> This identifies the network that responded to this query. The specific values are documented in [HIP-198] (https://hips.hedera.com/hip/hip-198). |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


