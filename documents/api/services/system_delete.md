## Table of Contents

- [system_delete.proto](#system_delete-proto)
    - [SystemDeleteTransactionBody](#proto-SystemDeleteTransactionBody)
  



<a name="system_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## system_delete.proto
# System Delete
A system transaction to remove a file from the Hedera File
Service (HFS).<br/>
This transaction is a privileged operation restricted to "system"
accounts.

> Note
>> System delete is defined here for a smart contract (to delete
>> the bytecode), but was never implemented.
>
>> Currently, system delete and system undelete specifying a smart
>> contract identifier SHALL return `INVALID_FILE_ID`
>> or `MISSING_ENTITY_ID`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-SystemDeleteTransactionBody"></a>

### SystemDeleteTransactionBody
Delete a file or contract bytecode as an administrative transaction.

> Note
>> A system delete/undelete for a `contractID` is not supported and
>> SHALL return `INVALID_FILE_ID` or `MISSING_ENTITY_ID`.

This transaction MAY be reversed by the `systemUndelete` transaction.
A file deleted via `fileDelete`, however SHALL be irrecoverable.<br/>
This transaction MUST specify an expiration timestamp (with seconds
precision). The file SHALL be permanently removed from state when
network consensus time exceeds the specified expiration time.<br/>
This transaction MUST be signed by an Hedera administrative ("system")
account.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> The identified file MUST exist in the HFS.<br/> The identified file MUST NOT be deleted.<br/> This field is REQUIRED. |
| contractID | [ContractID](#proto-ContractID) |  | A contract identifier. <p> The identified contract MUST exist in network state.<br/> The identified contract bytecode MUST NOT be deleted.<br/> <p> This option is _unsupported_. |
| expirationTime | [TimestampSeconds](#proto-TimestampSeconds) |  | A timestamp indicating when the file will be removed from state. <p> This value SHALL be expressed in seconds since the `epoch`. The `epoch` SHALL be the UNIX epoch with 0 at `1970-01-01T00:00:00.000Z`.<br/> This field is REQUIRED. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



