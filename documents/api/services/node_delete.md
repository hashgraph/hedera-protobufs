## Table of Contents

- [node_delete.proto](#node_delete-proto)
    - [NodeDeleteTransactionBody](#com-hedera-hapi-node-addressbook-NodeDeleteTransactionBody)
  



<a name="node_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## node_delete.proto



<a name="com-hedera-hapi-node-addressbook-NodeDeleteTransactionBody"></a>

### NodeDeleteTransactionBody
A transaction body to delete a node from the network address book.

- A `NodeDeleteTransactionBody` MUST be signed by one of those keys:
  adminKey, treasure account (2) key, systemAdmin(50) key, or
  addressBookAdmin(55) key.
- Upon success, the address book entry SHALL enter a "pending delete"
  state.
- All address book entries pending deletion SHALL be removed from the
  active network configuration during the next `freeze` transaction with
  the field `freeze_type` set to `PREPARE_UPGRADE`.<br/>
- A deleted address book node SHALL be removed entirely from network state.
- A deleted address book node identifier SHALL NOT be reused.

### Block Stream Effects
None.


| Field | Type | Description |
| ----- | ---- | ----------- |
| node_id | [uint64](#uint64) | A consensus node identifier in the network state. <p> The node identified MUST exist in the network address book.<br/> The node identified MUST NOT be deleted.<br/> This value is REQUIRED. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



