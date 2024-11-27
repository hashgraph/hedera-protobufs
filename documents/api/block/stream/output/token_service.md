## Table of Contents

- [stream/output/token_service.proto](#stream_output_token_service-proto)
    - [AssociateTokenOutput](#com-hedera-hapi-block-stream-output-AssociateTokenOutput)
    - [BurnTokenOutput](#com-hedera-hapi-block-stream-output-BurnTokenOutput)
    - [CreateTokenOutput](#com-hedera-hapi-block-stream-output-CreateTokenOutput)
    - [DeleteTokenOutput](#com-hedera-hapi-block-stream-output-DeleteTokenOutput)
    - [DissociateTokenOutput](#com-hedera-hapi-block-stream-output-DissociateTokenOutput)
    - [FreezeTokenAccountOutput](#com-hedera-hapi-block-stream-output-FreezeTokenAccountOutput)
    - [GrantTokenKycOutput](#com-hedera-hapi-block-stream-output-GrantTokenKycOutput)
    - [MintTokenOutput](#com-hedera-hapi-block-stream-output-MintTokenOutput)
    - [PauseTokenOutput](#com-hedera-hapi-block-stream-output-PauseTokenOutput)
    - [RevokeTokenKycOutput](#com-hedera-hapi-block-stream-output-RevokeTokenKycOutput)
    - [TokenAirdropOutput](#com-hedera-hapi-block-stream-output-TokenAirdropOutput)
    - [UnfreezeTokenAccountOutput](#com-hedera-hapi-block-stream-output-UnfreezeTokenAccountOutput)
    - [UnpauseTokenOutput](#com-hedera-hapi-block-stream-output-UnpauseTokenOutput)
    - [UpdateTokenFeeScheduleOutput](#com-hedera-hapi-block-stream-output-UpdateTokenFeeScheduleOutput)
    - [UpdateTokenNftsOutput](#com-hedera-hapi-block-stream-output-UpdateTokenNftsOutput)
    - [UpdateTokenOutput](#com-hedera-hapi-block-stream-output-UpdateTokenOutput)
    - [WipeTokenAccountOutput](#com-hedera-hapi-block-stream-output-WipeTokenAccountOutput)
  



<a name="stream_output_token_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/token_service.proto
# Token Service
Block stream messages that report the results of transactions
handled by the `Token` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-AssociateTokenOutput"></a>

### AssociateTokenOutput
Block Stream data for an `associateTokens` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-BurnTokenOutput"></a>

### BurnTokenOutput
Block Stream data for a `burnToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-CreateTokenOutput"></a>

### CreateTokenOutput
Block Stream data for a `createToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-DeleteTokenOutput"></a>

### DeleteTokenOutput
Block Stream data for a `deleteToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-DissociateTokenOutput"></a>

### DissociateTokenOutput
Block Stream data for a `dissociateTokens` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-FreezeTokenAccountOutput"></a>

### FreezeTokenAccountOutput
Block Stream data for a `freezeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-GrantTokenKycOutput"></a>

### GrantTokenKycOutput
Block Stream data for a `grantKycToTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-MintTokenOutput"></a>

### MintTokenOutput
Block Stream data for a `mintToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-PauseTokenOutput"></a>

### PauseTokenOutput
Block Stream data for a `pauseToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-RevokeTokenKycOutput"></a>

### RevokeTokenKycOutput
Block Stream data for a `revokeKycFromTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-TokenAirdropOutput"></a>

### TokenAirdropOutput
Block Stream data for a `tokenAirdrop` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.


| Field | Type | Description |
| ----- | ---- | ----------- |
| assessed_custom_fees | [proto.AssessedCustomFee](#proto-AssessedCustomFee) | Custom fees assessed during a TokenAirdrop. <p> These fees SHALL be present in the full transfer list for the transaction. |






<a name="com-hedera-hapi-block-stream-output-UnfreezeTokenAccountOutput"></a>

### UnfreezeTokenAccountOutput
Block Stream data for an `unfreezeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UnpauseTokenOutput"></a>

### UnpauseTokenOutput
Block Stream data for an `unpauseToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UpdateTokenFeeScheduleOutput"></a>

### UpdateTokenFeeScheduleOutput
Block Stream data for an `updateTokenFeeSchedule` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UpdateTokenNftsOutput"></a>

### UpdateTokenNftsOutput
Block Stream data for an `updateNfts` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UpdateTokenOutput"></a>

### UpdateTokenOutput
Block Stream data for an `updateToken` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-WipeTokenAccountOutput"></a>

### WipeTokenAccountOutput
Block Stream data for a `wipeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



