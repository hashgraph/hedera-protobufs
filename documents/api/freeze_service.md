## Table of Contents

- [freeze_service.proto](#freeze_service-proto)
    - [FreezeService](#proto-FreezeService)
  



<a name="freeze_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze_service.proto
# Freeze Service
A service to manage network freeze and upgrade events.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-FreezeService"></a>

### FreezeService
A service to manage network "freeze" events.

This service provides a facility to prepare for network upgrades, halt network processing,
perform network software upgrades, and automatically restart the network following an upgrade.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| freeze | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Freeze, cancel, or prepare a freeze.<br/> This single transaction performs all of the functions supported by the network freeze service. These services include actions to prepare an upgrade, prepare a telemetry upgrade, freeze the network, freeze the network for upgrade, or abort a scheduled freeze.<br/> The actual freeze action is determined by the `freeze_type` field of the `FreezeTransactionBody`.<br/> The transaction body MUST be a `FreezeTransactionBody`. |

 <!-- end services -->


