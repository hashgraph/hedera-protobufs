## Table of Contents

- [freeze_type.proto](#freeze_type-proto)
    - [FreezeType](#proto-FreezeType)
  



<a name="freeze_type-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze_type.proto
# Freeze Type
An enumeration to select the type of a network freeze.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->


<a name="proto-FreezeType"></a>

### FreezeType
An enumeration of possible network freeze types.

Each enumerated value SHALL be associated to a single network freeze scenario. Each freeze
scenario defines the specific parameters REQUIRED for that freeze.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN_FREEZE_TYPE | 0 | An invalid freeze type.<br/> The first value in a protobuf enum is a default value. This default is RECOMMENDED to be an invalid value to aid in detecting unset fields. |
| FREEZE_ONLY | 1 | Freeze the network, and take no further action.<br/> The `start_time` field is REQUIRED and SHOULD be between `300` and `3600` seconds after the transaction identifier `transactionValidStart` field.<br/> The fields `update_file` and `file_hash` SHALL be ignored.<br/> A `FREEZE_ONLY` transaction SHALL NOT perform any network changes or upgrades.<br/> After this freeze is processed manual intervention is REQUIRED to restart the network. |
| PREPARE_UPGRADE | 2 | This freeze type does not freeze the network, but begins "preparation" to upgrade the network.<br/> The fields `update_file` and `file_hash` are REQUIRED and MUST be valid.<br/> The `start_time` field SHALL be ignored.<br/> A `PREPARE_UPGRADE` transaction SHALL NOT freeze the network or interfere with general transaction processing.<br/> If this freeze type is initiated after a `TELEMETRY_UPGRADE`, the prepared telemetry upgrade SHALL be reset and all telemetry upgrade artifacts in the filesystem SHALL be deleted.<br/> At some point after this freeze type completes (dependent on the size of the upgrade file), the network SHALL be prepared to complete a software upgrade of all nodes. |
| FREEZE_UPGRADE | 3 | Freeze the network to perform a software upgrade.<br/> The `start_time` field is REQUIRED and SHOULD be between `300` and `3600` seconds after the transaction identifier `transactionValidStart` field.<br/> A software upgrade file MUST be prepared prior to this transaction.<br/> After this transaction completes, the network SHALL initiate an upgrade and restart of all nodes at the start time specified. |
| FREEZE_ABORT | 4 | Abort a pending network freeze operation.<br/> All fields SHALL be ignored for this freeze type.<br/> This freeze type MAY be submitted after a `FREEZE_ONLY`, `FREEZE_UPGRADE`, or `TELEMETRY_UPGRADE` is initiated.<br/> This freeze type MUST be submitted and reach consensus before the `start_time` designated for the current pending freeze to be effective.<br/> After this freeze type is processed, the upgrade file hash and pending freeze start time stored in the network SHALL be reset to default (empty) values. |
| TELEMETRY_UPGRADE | 5 | Prepare an upgrade of auxiliary services and containers providing telemetry/metrics.<br/> The `start_time` field is REQUIRED and SHOULD be between `300` and `3600` seconds after the transaction `transactionValidStart` field.<br/> The `update_file` field is REQUIRED and MUST be valid.<br/> A `TELEMETRY_UPGRADE` transaction SHALL NOT freeze the network or interfere with general transaction processing.<br/> This freeze type MUST NOT be initiated between a `PREPARE_UPGRADE` and `FREEZE_UPGRADE`. If this freeze type is initiated after a `PREPARE_UPGRADE`, the prepared upgrade SHALL be reset and all software upgrade artifacts in the filesystem SHALL be deleted.<br/> At some point after this freeze type completes (dependent on the size of the upgrade file), the network SHALL automatically upgrade the telemetry/metrics services and containers as directed in the specified telemetry upgrade file. <blockquote> The condition that `start_time` is REQUIRED is an historical anomaly and SHOULD change in a future release.</blockquote> |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


