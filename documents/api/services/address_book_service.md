## Table of Contents

- [address_book_service.proto](#address_book_service-proto)
    - [AddressBookService](#com-hedera-hapi-node-addressbook-AddressBookService)
  



<a name="address_book_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## address_book_service.proto


 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="com-hedera-hapi-node-addressbook-AddressBookService"></a>

### AddressBookService
The Address Book service provides the ability for Hedera network node
administrators to add, update, and remove consensus nodes. This addition,
update, or removal of a consensus node requires governing council approval,
but each node operator may update their own operational attributes without
additional approval, reducing overhead for routine operations.

Most operations are `privileged operations` and require governing council
approval.

### For a node creation transaction.
- The node operator SHALL create a `createNode` transaction.
   - The node operator SHALL sign this transaction with the active `key` for
     the account to be assigned as the "node account".
   - The node operator MUST deliver the signed transaction to the Hedera
     council representative.
   - The Hedera council representative SHALL arrange for council members to
     review and sign the transaction.
   - Once sufficient council members have signed the transaction, the
     Hedera council representative SHALL submit the transaction to the
     network.
- Upon receipt of a valid and signed node creation transaction the network
  software SHALL
   - Validate the threshold signature for the Hedera governing council
   - Validate the signature of the active `key` for the account to be
     assigned as the "node account".
   - Create the new node in state, this new node SHALL NOT be active in the
     network at this time.
   - When executing the next `freeze` transaction with `freeze_type` set to
     `PREPARE_UPGRADE`, update network configuration and bring the
     new node to an active status within the network. The node to be added
     SHALL be active in the network following this upgrade.

### For a node deletion transaction.
- The node operator or Hedera council representative SHALL create a
  `deleteNode` transaction.
   - If the node operator creates the transaction
      - The node operator MUST sign this transaction with the active `key`
        for the account assigned as the "node account".
      - The node operator SHALL deliver the signed transaction to the Hedera
        council representative.
   - The Hedera council representative SHALL arrange for council members to
     review and sign the transaction.
   - Once sufficient council members have signed the transaction, the
     Hedera council representative SHALL submit the transaction to the
     network.
- Upon receipt of a valid and signed node deletion transaction the network
  software SHALL
   - Validate the threshold signature for the Hedera governing council
   - Remove the existing node from network state. The node SHALL still
     be active in the network at this time.
   - When executing the next `freeze` transaction with `freeze_type` set to
     `PREPARE_UPGRADE`, update network configuration and remove the
     node to be deleted from the network. The node to be deleted SHALL NOT
     be active in the network following this upgrade.

### For a node update transaction.
- The node operator or Hedera council representative SHALL create an
  `updateNode` transaction.
   - If the node operator creates the transaction
      - The node operator MUST sign this transaction with the active `key`
        for the account assigned as the current "node account".
      - If the transaction changes the value of the "node account" the
        node operator MUST _also_ sign this transaction with the active `key`
        for the account to be assigned as the new "node account".
      - The node operator SHALL submit the transaction to the
        network.  Hedera council approval SHALL NOT be sought for this
        transaction
   - If the Hedera council representative creates the transaction
      - The Hedera council representative SHALL arrange for council members
        to review and sign the transaction.
      - Once sufficient council members have signed the transaction, the
        Hedera council representative SHALL submit the transaction to the
        network.
- Upon receipt of a valid and signed node update transaction the network
  software SHALL
   - If the transaction is signed by the Hedera governing council
      - Validate the threshold signature for the Hedera governing council
   - If the transaction is signed by the active `key` for the node account
      - Validate the signature of the active `key` for the account assigned
        as the "node account".
   - If the transaction modifies the value of the "node account",
      - Validate the signature of the _new_ `key` for the account to be
        assigned as the new "node account".
   - Modify the node information held in network state with the changes
     requested in the update transaction. The node changes SHALL NOT be
     applied to network configuration, and SHALL NOT affect network
     operation at this time.
   - When executing the next `freeze` transaction with `freeze_type` set to
     `PREPARE_UPGRADE`, update network configuration according to the
     modified information in network state. The requested changes SHALL
     affect network operation following this upgrade.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createNode | [.proto.Transaction](#proto-Transaction) | [.proto.TransactionResponse](#proto-TransactionResponse) | A transaction to create a new consensus node in the network. address book. <p> This transaction, once complete, SHALL add a new consensus node to the network state.<br/> The new consensus node SHALL remain in state, but SHALL NOT participate in network consensus until the network updates the network configuration. <p> Hedera governing council authorization is REQUIRED for this transaction. |
| deleteNode | [.proto.Transaction](#proto-Transaction) | [.proto.TransactionResponse](#proto-TransactionResponse) | A transaction to remove a consensus node from the network address book. <p> This transaction, once complete, SHALL remove the identified consensus node from the network state. <p> Hedera governing council authorization is REQUIRED for this transaction. |
| updateNode | [.proto.Transaction](#proto-Transaction) | [.proto.TransactionResponse](#proto-TransactionResponse) | A transaction to update an existing consensus node from the network address book. <p> This transaction, once complete, SHALL modify the identified consensus node state as requested. <p> This transaction MAY be authorized by either the node operator OR the Hedera governing council. |
| getNodeInfo | [.proto.Query](#proto-Query) | [.proto.Response](#proto-Response) | A transaction to query the current state of a consensus node in the network address book state. <p> Hedera governing council authorization is REQUIRED for this transaction. |

 <!-- end services -->


