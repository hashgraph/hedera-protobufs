## Table of Contents

- [network_get_version_info.proto](#network_get_version_info-proto)
    - [NetworkGetVersionInfoQuery](#proto-NetworkGetVersionInfoQuery)
    - [NetworkGetVersionInfoResponse](#proto-NetworkGetVersionInfoResponse)
  



<a name="network_get_version_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_get_version_info.proto
# Get Version
Standard query for services and API message versions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NetworkGetVersionInfoQuery"></a>

### NetworkGetVersionInfoQuery
Query the deployed versions of Hedera Services and the HAPI proto in semantic version format


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |






<a name="proto-NetworkGetVersionInfoResponse"></a>

### NetworkGetVersionInfoResponse
A response to a `NetworkGetVersionInfoQuery`.

This SHALL return `SemanticVersion` information for both Hedera API (HAPI) and Hedera Services.

Note that the Hedera software may use the fields of the `SemanticVersion` in a somewhat
unorthodox manner.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| hapiProtoVersion | [SemanticVersion](#proto-SemanticVersion) |  | An API version.<br/> This SHALL be the current Hedera API (HAPI) protobuf message version accepted by the network. |
| hederaServicesVersion | [SemanticVersion](#proto-SemanticVersion) |  | A Services version.<br/> This SHALL be the current version of the Hedera Services software operating the network. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


