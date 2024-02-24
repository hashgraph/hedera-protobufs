## Table of Contents

- [network_get_version_info.proto](#network_get_version_info-proto)
    - [NetworkGetVersionInfoQuery](#proto-NetworkGetVersionInfoQuery)
    - [NetworkGetVersionInfoResponse](#proto-NetworkGetVersionInfoResponse)
  



<a name="network_get_version_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_get_version_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NetworkGetVersionInfoQuery"></a>

### NetworkGetVersionInfoQuery
Get the deployed versions of Hedera Services and the HAPI proto in semantic version format


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |






<a name="proto-NetworkGetVersionInfoResponse"></a>

### NetworkGetVersionInfoResponse
Response when the client sends the node NetworkGetVersionInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| hapiProtoVersion | [SemanticVersion](#proto-SemanticVersion) |  | The Hedera API (HAPI) protobuf version recognized by the responding node. |
| hederaServicesVersion | [SemanticVersion](#proto-SemanticVersion) |  | The version of the Hedera Services software deployed on the responding node. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


