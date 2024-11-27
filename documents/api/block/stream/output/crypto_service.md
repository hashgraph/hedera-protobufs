## Table of Contents

- [stream/output/crypto_service.proto](#stream_output_crypto_service-proto)
    - [ApproveAllowanceOutput](#com-hedera-hapi-block-stream-output-ApproveAllowanceOutput)
    - [CreateAccountOutput](#com-hedera-hapi-block-stream-output-CreateAccountOutput)
    - [CryptoTransferOutput](#com-hedera-hapi-block-stream-output-CryptoTransferOutput)
    - [DeleteAccountOutput](#com-hedera-hapi-block-stream-output-DeleteAccountOutput)
    - [DeleteAllowanceOutput](#com-hedera-hapi-block-stream-output-DeleteAllowanceOutput)
    - [UpdateAccountOutput](#com-hedera-hapi-block-stream-output-UpdateAccountOutput)
  



<a name="stream_output_crypto_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/crypto_service.proto
# Crypto Service
Block stream messages that report the results of transactions handled by
the `Crypto` service. This service primarily handles account management
and HBAR transfers.

> Note
>> Tokens other than HBAR, including all NFTs, are managed by the `Token` Service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-ApproveAllowanceOutput"></a>

### ApproveAllowanceOutput
Block Stream data for a `approveAllowances` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-CreateAccountOutput"></a>

### CreateAccountOutput
Block Stream data for a `createAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-CryptoTransferOutput"></a>

### CryptoTransferOutput
Block Stream data for a `cryptoTransfer` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Description |
| ----- | ---- | ----------- |
| assessed_custom_fees | [proto.AssessedCustomFee](#proto-AssessedCustomFee) | Custom fees assessed during a CryptoTransfer. <p> These fees SHALL be present in the full transfer list for the transaction. |






<a name="com-hedera-hapi-block-stream-output-DeleteAccountOutput"></a>

### DeleteAccountOutput
Block Stream data for a `cryptoDelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-DeleteAllowanceOutput"></a>

### DeleteAllowanceOutput
Block Stream data for a `deleteAllowances` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UpdateAccountOutput"></a>

### UpdateAccountOutput
Block Stream data for a `updateAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



