## Table of Contents

- [freeze_type.proto](#freeze_type-proto)
    - [FreezeType](#proto-FreezeType)
  



<a name="freeze_type-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze_type.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->


<a name="proto-FreezeType"></a>

### FreezeType
The type of network freeze or upgrade operation to be performed. This type dictates which
fields are required.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN_FREEZE_TYPE | 0 | An (invalid) default value for this enum, to ensure the client explicitly sets the intended type of freeze transaction. |
| FREEZE_ONLY | 1 | Freezes the network at the specified time. The start_time field must be provided and must reference a future time. Any values specified for the update_file and file_hash fields will be ignored. This transaction does not perform any network changes or upgrades and requires manual intervention to restart the network. |
| PREPARE_UPGRADE | 2 | A non-freezing operation that initiates network wide preparation in advance of a scheduled freeze upgrade. The update_file and file_hash fields must be provided and valid. The start_time field may be omitted and any value present will be ignored. |
| FREEZE_UPGRADE | 3 | Freezes the network at the specified time and performs the previously prepared automatic upgrade across the entire network. |
| FREEZE_ABORT | 4 | Aborts a pending network freeze operation. |
| TELEMETRY_UPGRADE | 5 | Performs an immediate upgrade on auxilary services and containers providing telemetry/metrics. Does not impact network operations. |


 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


