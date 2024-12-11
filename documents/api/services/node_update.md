## Table of Contents

- [node_update.proto](#node_update-proto)
    - [NodeUpdateTransactionBody](#com-hedera-hapi-node-addressbook-NodeUpdateTransactionBody)
  



<a name="node_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## node_update.proto



<a name="com-hedera-hapi-node-addressbook-NodeUpdateTransactionBody"></a>

### NodeUpdateTransactionBody
Transaction body to modify address book node attributes.

- This transaction SHALL enable the node operator, as identified by the
  `admin_key`, to modify operational attributes of the node.
- This transaction MUST be signed by the active `admin_key` for the node.
- If this transaction sets a new value for the `admin_key`, then both the
  current `admin_key`, and the new `admin_key` MUST sign this transaction.
- This transaction SHALL NOT change any field that is not set (is null) in
  this transaction body.
- This SHALL create a pending update to the node, but the change SHALL NOT
  be immediately applied to the active configuration.
- All pending node updates SHALL be applied to the active network
  configuration during the next `freeze` transaction with the field
  `freeze_type` set to `PREPARE_UPGRADE`.

### Block Stream Effects
None.


| Field | Type | Description |
| ----- | ---- | ----------- |
| node_id | [uint64](#uint64) | A consensus node identifier in the network state. <p> The node identified MUST exist in the network address book.<br/> The node identified MUST NOT be deleted.<br/> This value is REQUIRED. |
| account_id | [proto.AccountID](#proto-AccountID) | An account identifier. <p> If set, this SHALL replace the node account identifier.<br/> If set, this transaction MUST be signed by the active `key` for _both_ the current node account _and_ the identified new node account. |
| description | [google.protobuf.StringValue](#google-protobuf-StringValue) | A short description of the node. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8.<br/> If set, this value SHALL replace the previous value. |
| gossip_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | A list of service endpoints for gossip. <p> If set, this list MUST meet the following requirements. <hr/> These endpoints SHALL represent the published endpoints to which other consensus nodes may _gossip_ transactions.<br/> These endpoints SHOULD NOT specify both address and DNS name.<br/> This list MUST NOT be empty.<br/> This list MUST NOT contain more than `10` entries.<br/> The first two entries in this list SHALL be the endpoints published to all consensus nodes.<br/> All other entries SHALL be reserved for future use. <p> Each network may have additional requirements for these endpoints. A client MUST check network-specific documentation for those details.<br/> <blockquote>Example<blockquote> Hedera Mainnet _requires_ that address be specified, and does not permit DNS name (FQDN) to be specified. </blockquote> <blockquote> Solo, however, _requires_ DNS name (FQDN) but also permits address. </blockquote></blockquote> <p> If set, the new list SHALL replace the existing list. |
| service_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | A list of service endpoints for gRPC calls. <p> If set, this list MUST meet the following requirements. <hr/> These endpoints SHALL represent the published endpoints to which clients may submit transactions.<br/> These endpoints SHOULD specify address and port.<br/> These endpoints MAY specify a DNS name.<br/> These endpoints SHOULD NOT specify both address and DNS name.<br/> This list MUST NOT be empty.<br/> This list MUST NOT contain more than `8` entries. <p> Each network may have additional requirements for these endpoints. A client MUST check network-specific documentation for those details. <p> If set, the new list SHALL replace the existing list. |
| gossip_ca_certificate | [google.protobuf.BytesValue](#google-protobuf-BytesValue) | A certificate used to sign gossip events. <p> This value MUST be a certificate of a type permitted for gossip signatures.<br/> This value MUST be the DER encoding of the certificate presented. <p> If set, the new value SHALL replace the existing bytes value. |
| grpc_certificate_hash | [google.protobuf.BytesValue](#google-protobuf-BytesValue) | A hash of the node gRPC TLS certificate. <p> This value MAY be used to verify the certificate presented by the node during TLS negotiation for gRPC.<br/> This value MUST be a SHA-384 hash.<br/> The TLS certificate to be hashed MUST first be in PEM format and MUST be encoded with UTF-8 NFKD encoding to a stream of bytes provided to the hash algorithm.<br/> <p> If set, the new value SHALL replace the existing hash value. |
| admin_key | [proto.Key](#proto-Key) | An administrative key controlled by the node operator. <p> This field is OPTIONAL.<br/> If set, this key MUST sign this transaction.<br/> If set, this key MUST sign each subsequent transaction to update this node.<br/> If set, this field MUST contain a valid `Key` value.<br/> If set, this field MUST NOT be set to an empty `KeyList`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



