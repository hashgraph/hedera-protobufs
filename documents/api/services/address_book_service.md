## Table of Contents

- [address_book_service.proto](#address_book_service-proto)
    - [AddressBookService](#proto-AddressBookService)
  



<a name="address_book_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## address_book_service.proto
# Address Book Service API
GRPC service definitions for the Hedera Address Book Service (HABS).

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-AddressBookService"></a>

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
   - The node operator MUST sign this transaction with the active `Key` for
     the account to be assigned as the "node account".
   - The node operator MUST sign this transaction with the `Key`
     set as the `admin_key` for the new `Node`.
   - The node operator SHALL deliver the signed transaction to the Hedera
     council representative.
   - The Hedera council representative SHALL arrange for council members to
     review and sign the transaction.
   - Once sufficient council members have signed the transaction, the
     Hedera council representative SHALL submit the transaction to the
     network.
- Upon receipt of a valid and signed node creation transaction the network
  software SHALL
   - Validate the threshold signature for the Hedera governing council
   - Validate the signature of the `Key` provided as the new `admin_key`
     for the `Node`.
   - Validate the signature of the active `Key` for the account to be
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
      - The node operator MUST sign this transaction with the `Key`
        set as the `admin_key` for the existing `Node`.
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
- The node operator SHALL create an `updateNode` transaction.
   - The node operator MUST sign this transaction with the `Key`
     assigned as the current `admin_key`.
   - If the transaction changes the value of the `admin_key` for the node,
      - The node operator MUST sign this transaction with the `Key`
        assigned as the new `admin_key`.
   - If the transaction changes the value of the "node account",
      - The node operator MUST sign this transaction with the
        active `Key` for the account to be assigned as the new
        "node account".
      - The node operator MUST _also_ sign this transaction with the
        active `Key` for the account _currently_ assigned as the
        "node account".
   - The node operator SHALL submit the transaction to the
     network.  Hedera council approval SHALL NOT be sought for this
     transaction
- Upon receipt of a valid and signed node update transaction the network
  software SHALL
   - Validate the signature of the `Key` currently assigned as the
     `admin_key` for the `Node`.
   - If the transaction modifies the value of the `admin_key`,
      - Validate the signature of the `Key` provided as the new `admin_key`
        for the `Node`.
   - If the transaction modifies the value of the "node account",
      - Validate the signature of the active `Key` for the account
        currently assigned as the "node account".
      - Validate the signature of the `Key` for the account to be
        assigned as the _new_ "node account".
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
| createNode | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | A transaction to create a new consensus node in the network address book. <p> This transaction, once complete, SHALL add a new consensus node to the network state.<br/> The new consensus node SHALL remain in state, but SHALL NOT participate in network consensus until the network updates the network configuration. <p> Hedera governing council authorization is REQUIRED for this transaction. |
| deleteNode | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | A transaction to remove a consensus node from the network address book. <p> This transaction, once complete, SHALL remove the identified consensus node from the network state. <p> Hedera governing council authorization is REQUIRED for this transaction. |
| updateNode | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | A transaction to update an existing consensus node from the network address book. <p> This transaction, once complete, SHALL modify the identified consensus node state as requested. <p> This transaction MUST be authorized by the node operator. |

 <!-- end services -->



