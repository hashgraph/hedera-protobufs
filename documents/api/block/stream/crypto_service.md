## Table of Contents

- [stream/crypto_service.proto](#stream_crypto_service-proto)
    - [CreateAccountOutput](#proto-CreateAccountOutput)
    - [CryptoTransferOutput](#proto-CryptoTransferOutput)
  



<a name="stream_crypto_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/crypto_service.proto
#  Service
Block stream messages that report the results of transactions handled by the `` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CreateAccountOutput"></a>

### CreateAccountOutput
Block Stream data for a `createAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id | [AccountID](#proto-AccountID) |  | The id of the newly created account. |
| evm_address | [bytes](#bytes) |  | The new default EVM address of the account created by this transaction. This field is populated only when the EVM address is not specified in the related transaction body. |






<a name="proto-CryptoTransferOutput"></a>

### CryptoTransferOutput
Block Stream data for a `cryptoTransfer` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| assessed_custom_fees | [AssessedCustomFee](#proto-AssessedCustomFee) | repeated | All custom fees that were assessed during a CryptoTransfer, and must be paid if the transaction status resolved to SUCCESS. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



