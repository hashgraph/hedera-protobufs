## Table of Contents

- [system_undelete.proto](#system_undelete-proto)
    - [SystemUndeleteTransactionBody](#proto-SystemUndeleteTransactionBody)
  



<a name="system_undelete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## system_undelete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-SystemUndeleteTransactionBody"></a>

### SystemUndeleteTransactionBody
Undelete a file or smart contract that was deleted by SystemDelete; requires a Hedera
administrative multisignature.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The file ID to undelete, in the format used in transactions |
| contractID | [ContractID](#proto-ContractID) |  | The contract ID instance to undelete, in the format used in transactions |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


