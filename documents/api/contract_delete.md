## Table of Contents

- [contract_delete.proto](#contract_delete-proto)
    - [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody)
  



<a name="contract_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_delete.proto
# Contract Delete
Delete a smart contract, transferring any remaining balance to a designated account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractDeleteTransactionBody"></a>

### ContractDeleteTransactionBody
Delete a smart contract, and transfer any remaining HBAR balance to a designated account.

If this call succeeds then all subsequent calls to that smart contract SHALL fail.<br/>

### Requirements
 - An account or smart contract MUST be designated to receive all remaining account balances.
 - The smart contract MUST have an admin key set. If the contract does not have `admin_key` set,
   then this transaction SHALL fail and response code `MODIFYING_IMMUTABLE_CONTRACT`
   SHALL be set.
 - If `admin_key` is, or contains, an empty `KeyList` key, it SHALL be treated the same as an
   admin key that is not set.
 - The `Key` set for `admin_key` on the smart contract MUST have a valid signature set on this
   transaction.
 - The designated receiving account MAY have `receiver_sig_required` set. If that field is set,
   the receiver account MUST also sign this transaction.
 - The field `permanent_removal` MUST NOT be set. That field is reserved for internal system
   use when purging the smart contract from state. Any user transaction with that field set
   SHALL be rejected and a response code `PERMANENT_REMOVAL_REQUIRES_SYSTEM_INITIATION` SHALL
   be set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The id of the contract to be deleted |
| transferAccountID | [AccountID](#proto-AccountID) |  | An Account ID recipient.<br/> This account SHALL receive all HBAR and other tokens still owned by the contract that is removed. |
| transferContractID | [ContractID](#proto-ContractID) |  | A contract ID recipient.<br/> This contract SHALL receive all HBAR and other tokens still owned by the contract that is removed. |
| permanent_removal | [bool](#bool) |  | A flag indicating that this transaction is "synthetic"; initiated by the node software.<br/> The consensus nodes create such "synthetic" transactions to both to properly manage state changes and to communicate those changes to other systems via the Block Stream.<br/> A user-initiated transaction MUST NOT set this flag. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


