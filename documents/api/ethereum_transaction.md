## Table of Contents

- [ethereum_transaction.proto](#ethereum_transaction-proto)
    - [EthereumTransactionBody](#proto-EthereumTransactionBody)
  



<a name="ethereum_transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## ethereum_transaction.proto
# Ethereum Call
Make an Ethereum transaction "call" with all data in Ethereum formats, including the
contract alias. Call data may be in the transaction, or stored within an Hedera File.<br/>
The caller MAY offer additional gas above what is offered in the call data, but MAY be
charged up to 80% of that value if the amount required is less than this "floor" amount.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-EthereumTransactionBody"></a>

### EthereumTransactionBody
Make an Ethereum transaction "call" with all data in Ethereum formats, including the
contract alias. Call data may be in the transaction, or stored within an Hedera File.<br/>
The caller MAY offer additional gas above what is offered in the call data, but MAY be
charged up to 80% of that value if the amount required is less than this "floor" amount.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ethereum_data | [bytes](#bytes) |  | The raw Ethereum transaction data.<br/> This transaction MUST be RLP encoded.<br/> This SHALL be the complete transaction data unless the `call_data` field is set.<br/> If `call_data` is set, this field SHALL be modified to replace the `callData` element with the content of the referenced file.<br/> The transaction signature SHALL be validated after `callData` is complete, if necessary. |
| call_data | [FileID](#proto-FileID) |  | The `callData` for the Ethereum transaction.<br/> If this field is set, the data in the `ethereum_data` field SHALL be re-written to replace the `callData` element with the contents of this file at time of execution.<br/> The Ethereum transaction MUST be "rehydrated" with this modified `callData` before signature validation MAY be performed. |
| max_gas_allowance | [int64](#int64) |  | A maximum amount of "gas" offered to pay the Ethereum transaction costs. <p> This gas offered is in addition to any gas supplied with the Ethereum transaction as declared in the `ethereum_data`.<br/> In most circumstances the account with an alias matching the public key available from the Ethereum transaction signature offers sufficient gas to power the transaction, but in some cases it MAY be desirable for the account submitting this transaction to either supplement or entirely fund the transaction cost.<br/> The amount of gas offered here SHALL be used to pay for transaction costs _in excess_ of any gas offered within the Ethereum transaction.<br/> If the gas offered within the Ethereum transaction is sufficient for all costs, the gas offered in this field SHALL NOT be expended.<br/> Regardless of actual transaction cost, the payer for this transaction SHALL NOT be charged more gas than the amount offered here.<br/> If the sum of both gas amounts is not sufficient to pay for the transaction, the entire total amount of gas offered SHALL be expended, the transaction SHALL fail, and the response code `INSUFFICIENT_GAS` SHALL be set.<br/> <blockquote>REVIEW NOTE -- This may not be correct<p/> If any amount of gas is charged to the payer of this transaction, at least 80% of the value offered in this field SHALL be charged as a minimum fee.<br/> </blockquote> If the amount of gas authorized in the Ethereum transaction data is `0`, then the payer of this transaction SHALL be charged the entire cost of the Ethereum transaction, subject to the limit set in this field. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


