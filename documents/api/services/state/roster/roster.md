## Table of Contents

- [state/roster/roster.proto](#state_roster_roster-proto)
    - [Roster](#com-hedera-hapi-node-state-roster-Roster)
    - [RosterEntry](#com-hedera-hapi-node-state-roster-RosterEntry)
  



<a name="state_roster_roster-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/roster/roster.proto



<a name="com-hedera-hapi-node-state-roster-Roster"></a>

### Roster
A single roster in the network state.
<p>
The roster SHALL be a list of `RosterEntry` objects.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| rosters | [RosterEntry](#com-hedera-hapi-node-state-roster-RosterEntry) | repeated | List of roster entries, one per consensus node. <p> This list SHALL contain roster entries in natural order of ascending node ids. This list SHALL NOT be empty.<br/> |






<a name="com-hedera-hapi-node-state-roster-RosterEntry"></a>

### RosterEntry
A single roster entry in the network state.

Each roster entry SHALL encapsulate the elements required
to manage node participation in the Threshold Signature Scheme (TSS).<br/>
All fields except tss_encryption_key are REQUIRED.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_id | [uint64](#uint64) |  | A consensus node identifier. <p> Node identifiers SHALL be unique _within_ a ledger, and MUST NOT be repeated _between_ shards and realms. |
| weight | [uint64](#uint64) |  | A consensus weight. <p> Each node SHALL have a weight of zero or more in consensus calculations.<br/> The sum of the weights of all nodes in the roster SHALL form the total weight of the system, and each node's individual weight SHALL be proportional to that sum.<br/> |
| gossip_ca_certificate | [bytes](#bytes) |  | An RSA public certificate used for signing gossip events. <p> This value SHALL be a certificate of a type permitted for gossip signatures.<br/> This value SHALL be the DER encoding of the certificate presented.<br/> This field is REQUIRED and MUST NOT be empty. |
| tss_encryption_key | [bytes](#bytes) |  | An elliptic curve public encryption key.<br/> This is currently an ALT_BN128 curve, but the elliptic curve type may change in the future. For example, if the Ethereum ecosystem creates precompiles for BLS12_381, we may switch to that curve. <p> This value SHALL be specified according to EIP-196 and EIP-197 standards, See <a href='https://eips.ethereum.org/EIPS/eip-196#encoding'>EIP-196</a> and <a href='https://eips.ethereum.org/EIPS/eip-197#encoding'>EIP-197</a><br/> This field is _initially_ OPTIONAL (i.e. it can be unset _when created_) but once set, it is REQUIRED thereafter. |
| gossip_endpoint | [proto.ServiceEndpoint](#proto-ServiceEndpoint) | repeated | A list of service endpoints for gossip. <p> These endpoints SHALL represent the published endpoints to which other consensus nodes may _gossip_ transactions.<br/> If the network configuration value `gossipFqdnRestricted` is set, then all endpoints in this list SHALL supply only IP address.<br/> If the network configuration value `gossipFqdnRestricted` is _not_ set, then endpoints in this list MAY supply either IP address or FQDN, but SHALL NOT supply both values for the same endpoint.<br/> This list SHALL NOT be empty.<br/> |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



