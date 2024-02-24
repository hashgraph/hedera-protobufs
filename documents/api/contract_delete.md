## Table of Contents

- [contract_delete.proto](#contract_delete-proto)
    - [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody)
  



<a name="contract_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractDeleteTransactionBody"></a>

### ContractDeleteTransactionBody
At consensus, marks a contract as deleted and transfers its remaining hBars, if any, to a
designated receiver. After a contract is deleted, it can no longer be called.

If the target contract is immutable (that is, was created without an admin key), then this
transaction resolves to MODIFYING_IMMUTABLE_CONTRACT.

--- Signing Requirements ---
1. The admin key of the target contract must sign.
2. If the transfer account or contract has receiverSigRequired, its associated key must also sign


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The id of the contract to be deleted |
| transferAccountID | [AccountID](#proto-AccountID) |  | The id of an account to receive any remaining hBars from the deleted contract |
| transferContractID | [ContractID](#proto-ContractID) |  | The id of a contract to receive any remaining hBars from the deleted contract |
| permanent_removal | [bool](#bool) |  | If set to true, means this is a "synthetic" system transaction being used to alert mirror nodes that the contract is being permanently removed from the ledger. <b>IMPORTANT:</b> User transactions cannot set this field to true, as permanent removal is always managed by the ledger itself. Any ContractDeleteTransactionBody submitted to HAPI with permanent_removal=true will be rejected with precheck status PERMANENT_REMOVAL_REQUIRES_SYSTEM_INITIATION. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


