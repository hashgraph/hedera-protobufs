## Table of Contents

- [system_undelete.proto](#system_undelete-proto)
    - [SystemUndeleteTransactionBody](#proto-SystemUndeleteTransactionBody)
  



<a name="system_undelete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## system_undelete.proto
# System Undelete
A system transaction to "undo" a `systemDelete` transaction.<br/>
This transaction is a privileged operation restricted to "system"
accounts.

> Note
>> System undelete is defined here for a smart contract (to delete
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


<a name="proto-SystemUndeleteTransactionBody"></a>

### SystemUndeleteTransactionBody
Recover a file or contract bytecode deleted from the Hedera File
System (HFS) by a `systemDelete` transaction.

> Note
>> A system delete/undelete for a `contractID` is not supported and
>> SHALL return `INVALID_FILE_ID` or `MISSING_ENTITY_ID`.

This transaction can _only_ recover a file removed with the `systemDelete`
transaction. A file deleted via `fileDelete` SHALL be irrecoverable.<br/>
This transaction MUST be signed by an Hedera administrative ("system")
account.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | A file identifier. <p> The identified file MUST exist in the HFS.<br/> The identified file MUST be deleted.<br/> The identified file deletion MUST be a result of a `systemDelete` transaction.<br/> This field is REQUIRED. |
| contractID | [ContractID](#proto-ContractID) |  | A contract identifier. <p> The identified contract MUST exist in network state.<br/> The identified contract bytecode MUST be deleted.<br/> The identified contract deletion MUST be a result of a `systemDelete` transaction. <p> This option is _unsupported_. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



