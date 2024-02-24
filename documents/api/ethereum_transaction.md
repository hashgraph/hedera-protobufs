## Table of Contents

- [ethereum_transaction.proto](#ethereum_transaction-proto)
    - [EthereumTransactionBody](#proto-EthereumTransactionBody)
  



<a name="ethereum_transaction-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## ethereum_transaction.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-EthereumTransactionBody"></a>

### EthereumTransactionBody



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ethereum_data | [bytes](#bytes) |  | The raw Ethereum transaction (RLP encoded type 0, 1, and 2). Complete unless the callData field is set. |
| call_data | [FileID](#proto-FileID) |  | For large transactions (for example contract create) this is the callData of the ethereumData. The data in the ethereumData will be re-written with the callData element as a zero length string with the original contents in the referenced file at time of execution. The ethereumData will need to be "rehydrated" with the callData for signature validation to pass. |
| max_gas_allowance | [int64](#int64) |  | The maximum amount, in tinybars, that the payer of the hedera transaction is willing to pay to complete the transaction.

Ordinarily the account with the ECDSA alias corresponding to the public key that is extracted from the ethereum_data signature is responsible for fees that result from the execution of the transaction. If that amount of authorized fees is not sufficient then the payer of the transaction can be charged, up to but not exceeding this amount. If the ethereum_data transaction authorized an amount that was insufficient then the payer will only be charged the amount needed to make up the difference. If the gas price in the transaction was set to zero then the payer will be assessed the entire fee. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


