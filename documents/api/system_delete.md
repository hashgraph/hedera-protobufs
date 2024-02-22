## Table of Contents

- [system_delete.proto](#system_delete-proto)
    - [SystemDeleteTransactionBody](#proto-SystemDeleteTransactionBody)
  



<a name="system_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## system_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-SystemDeleteTransactionBody"></a>

### SystemDeleteTransactionBody
Delete a file or smart contract - can only be done with a Hedera administrative multisignature.
When it is deleted, it immediately disappears from the system as seen by the user, but is still
stored internally until the expiration time, at which time it is truly and permanently deleted.
Until that time, it can be undeleted by the Hedera administrative multisignature. When a smart
contract is deleted, the cryptocurrency account within it continues to exist, and is not affected
by the expiration time here.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file ID of the file to delete, in the format used in transactions |
| contractID | [ContractID](#proto-ContractID) |  | The contract ID instance to delete, in the format used in transactions |
| expirationTime | [TimestampSeconds](#proto-TimestampSeconds) |  | The timestamp in seconds at which the "deleted" file should truly be permanently deleted |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


