## Table of Contents

- [stream/token_service.proto](#stream_token_service-proto)
    - [AssociateTokenOutput](#com-hedera-hapi-block-stream-AssociateTokenOutput)
    - [BurnTokenOutput](#com-hedera-hapi-block-stream-BurnTokenOutput)
    - [CreateTokenOutput](#com-hedera-hapi-block-stream-CreateTokenOutput)
    - [DeleteTokenOutput](#com-hedera-hapi-block-stream-DeleteTokenOutput)
    - [DissociateTokenOutput](#com-hedera-hapi-block-stream-DissociateTokenOutput)
    - [FreezeTokenAccountOutput](#com-hedera-hapi-block-stream-FreezeTokenAccountOutput)
    - [GrantTokenKycOutput](#com-hedera-hapi-block-stream-GrantTokenKycOutput)
    - [MintTokenOutput](#com-hedera-hapi-block-stream-MintTokenOutput)
    - [PauseTokenOutput](#com-hedera-hapi-block-stream-PauseTokenOutput)
    - [RevokeTokenKycOutput](#com-hedera-hapi-block-stream-RevokeTokenKycOutput)
    - [UnfreezeTokenAccountOutput](#com-hedera-hapi-block-stream-UnfreezeTokenAccountOutput)
    - [UnpauseTokenOutput](#com-hedera-hapi-block-stream-UnpauseTokenOutput)
    - [UpdateTokenFeeScheduleOutput](#com-hedera-hapi-block-stream-UpdateTokenFeeScheduleOutput)
    - [UpdateTokenNftsOutput](#com-hedera-hapi-block-stream-UpdateTokenNftsOutput)
    - [UpdateTokenOutput](#com-hedera-hapi-block-stream-UpdateTokenOutput)
    - [WipeTokenAccountOutput](#com-hedera-hapi-block-stream-WipeTokenAccountOutput)
  



<a name="stream_token_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/token_service.proto
# Token Service
Block stream messages that report the results of transactions handled by the `Token` service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-AssociateTokenOutput"></a>

### AssociateTokenOutput
Block Stream data for an `associateTokens` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-BurnTokenOutput"></a>

### BurnTokenOutput
Block Stream data for a `burnToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-CreateTokenOutput"></a>

### CreateTokenOutput
Block Stream data for a `createToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-DeleteTokenOutput"></a>

### DeleteTokenOutput
Block Stream data for a `deleteToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-DissociateTokenOutput"></a>

### DissociateTokenOutput
Block Stream data for a `dissociateTokens` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-FreezeTokenAccountOutput"></a>

### FreezeTokenAccountOutput
Block Stream data for a `freezeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-GrantTokenKycOutput"></a>

### GrantTokenKycOutput
Block Stream data for a `grantKycToTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-MintTokenOutput"></a>

### MintTokenOutput
Block Stream data for a `mintToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-PauseTokenOutput"></a>

### PauseTokenOutput
Block Stream data for a `pauseToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-RevokeTokenKycOutput"></a>

### RevokeTokenKycOutput
Block Stream data for a `revokeKycFromTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-UnfreezeTokenAccountOutput"></a>

### UnfreezeTokenAccountOutput
Block Stream data for an `unfreezeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-UnpauseTokenOutput"></a>

### UnpauseTokenOutput
Block Stream data for an `unpauseToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-UpdateTokenFeeScheduleOutput"></a>

### UpdateTokenFeeScheduleOutput
Block Stream data for an `updateTokenFeeSchedule` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-UpdateTokenNftsOutput"></a>

### UpdateTokenNftsOutput
Block Stream data for an `updateNfts` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-UpdateTokenOutput"></a>

### UpdateTokenOutput
Block Stream data for an `updateToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.






<a name="com-hedera-hapi-block-stream-WipeTokenAccountOutput"></a>

### WipeTokenAccountOutput
Block Stream data for a `wipeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



