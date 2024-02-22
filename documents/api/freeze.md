## Table of Contents

- [freeze.proto](#freeze-proto)
    - [FreezeTransactionBody](#proto-FreezeTransactionBody)
  



<a name="freeze-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## freeze.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FreezeTransactionBody"></a>

### FreezeTransactionBody
A transaction body for all five freeze transactions.

Combining five different transactions into a single message, this transaction body MUST support
options to schedule a freeze, abort a scheduled freeze, prepare a software upgrade, prepare a
telemetry upgrade, or initiate a software upgrade.

For a scheduled freeze, at the scheduled time, according to network consensus time<ul>
  <li>A freeze causes the network nodes to stop creating events or accepting transactions,
      and enter a persistent maintenance state.</li>
  <li>A freeze upgrade causes the network nodes to stop creating events or accepting
      transactions, and upgrade the node software from a previously prepared upgrade
      package. The network nodes then restart and rejoin the network after upgrading.</li>
</ul>
For other freeze types, immediately upon processing the freeze transaction<ul>
  <li>A Freeze Abort cancels any pending scheduled freeze.</li>
  <li>A prepare upgrade begins to extract the contents of the specified upgrade file
      to the local filesystem.</li>
  <li>A telemetry upgrade causes the network nodes to extract a telemetry upgrade package
      to the local filesystem and signal other software on the machine to upgrade, without
      impacting the node or network processing.</li>
</ul>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| startHour | [int32](#int32) |  | **Deprecated.** Rejected if set; replace with `start_time`.<br/> The start hour (in UTC time), a value between 0 and 23 |
| startMin | [int32](#int32) |  | **Deprecated.** Rejected if set; replace with `start_time`.<br/> The start minute (in UTC time), a value between 0 and 59 |
| endHour | [int32](#int32) |  | **Deprecated.** Rejected if set; end time is neither assigned nor guaranteed and depends on many uncontrolled factors.<br/> The end hour (in UTC time), a value between 0 and 23 |
| endMin | [int32](#int32) |  | **Deprecated.** Rejected if set; end time is neither assigned nor guaranteed and depends on many uncontrolled factors.<br/> The end minute (in UTC time), a value between 0 and 59 |
| update_file | [FileID](#proto-FileID) |  | An upgrade file.<br/> If set, the identifier of a file in network state.<br/> The contents of this file MUST be a `zip` file and this data SHALL be extracted to the node filesystem during a `PREPARE_UPGRADE` freeze type.<br/> The `file_hash` field MUST match the SHA384 hash of the content of this file.<br/> The extracted data SHALL be used to perform a network software update if a `FREEZE_UPGRADE` freeze type is subsequently processed. |
| file_hash | [bytes](#bytes) |  | A SHA384 hash of the contents of the file identified by `update_file`.<br/> This MUST be set if `update_file` is set, and MUST match the SHA384 hash of the contents of that file. |
| start_time | [Timestamp](#proto-Timestamp) |  | A start time for the freeze.<br/> If this field is REQUIRED for the specified `freeze_type`, then when the network consensus time reaches this instant<ol> <li>The network SHALL stop accepting transactions.</li> <li>The network SHALL gossip a freeze state.</li> <li>The nodes SHALL, in coordinated order, disconnect and shut down.</li> <li>The nodes SHALL halt or perform a software upgrade, depending on `freeze_type`.</li> <li>If the `freeze_type` is `FREEZE_UPGRADE`, the nodes SHALL restart and rejoin the network upon completion of the software upgrade.</li> </ol><blockquote> If the `freeze_type` is `TELEMETRY_UPGRADE`, the start time is required, but the network SHALL NOT stop, halt, or interrupt transaction processing. The required field is an historical anomaly and SHOULD change in a future release.</blockquote> |
| freeze_type | [FreezeType](#proto-FreezeType) |  | The type of freeze.<br/> This REQUIRED field effectively selects between five quite different transactions in the same transaction body. Depending on this value the service may schedule a freeze, prepare upgrades, perform upgrades, or even abort a previously scheduled freeze. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


