## Table of Contents

- [stream/transaction_output.proto](#stream_transaction_output-proto)
    - [TransactionOutput](#com-hedera-hapi-block-stream-TransactionOutput)
  



<a name="stream_transaction_output-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/transaction_output.proto
# Transaction Output
Messages that describe the output of a transaction; data reported in the block
stream that is not in the transaction body and is not reported in state changes.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-stream-TransactionOutput"></a>

### TransactionOutput
Output from a transaction.

The values in transaction outputs SHALL be data that is not present in the
original transaction and nor present in state changes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contract_call | [CallContractOutput](#com-hedera-hapi-block-stream-CallContractOutput) |  |  |
| contract_create | [CreateContractOutput](#com-hedera-hapi-block-stream-CreateContractOutput) |  |  |
| contract_update | [UpdateContractOutput](#com-hedera-hapi-block-stream-UpdateContractOutput) |  |  |
| contract_delete | [DeleteContractOutput](#com-hedera-hapi-block-stream-DeleteContractOutput) |  |  |
| ethereum_call | [EthereumOutput](#com-hedera-hapi-block-stream-EthereumOutput) |  |  |
| approve_allowance | [ApproveAllowanceOutput](#com-hedera-hapi-block-stream-ApproveAllowanceOutput) |  |  |
| delete_allowance | [DeleteAllowanceOutput](#com-hedera-hapi-block-stream-DeleteAllowanceOutput) |  |  |
| create_account | [CreateAccountOutput](#com-hedera-hapi-block-stream-CreateAccountOutput) |  |  |
| delete_account | [DeleteAccountOutput](#com-hedera-hapi-block-stream-DeleteAccountOutput) |  |  |
| crypto_transfer | [CryptoTransferOutput](#com-hedera-hapi-block-stream-CryptoTransferOutput) |  |  |
| update_account | [UpdateAccountOutput](#com-hedera-hapi-block-stream-UpdateAccountOutput) |  |  |
| file_append | [AppendFileOutput](#com-hedera-hapi-block-stream-AppendFileOutput) |  |  |
| file_create | [CreateFileOutput](#com-hedera-hapi-block-stream-CreateFileOutput) |  |  |
| file_delete | [DeleteFileOutput](#com-hedera-hapi-block-stream-DeleteFileOutput) |  |  |
| fileUpdate | [UpdateFileOutput](#com-hedera-hapi-block-stream-UpdateFileOutput) |  |  |
| systemDelete | [SystemDeleteOutput](#com-hedera-hapi-block-stream-SystemDeleteOutput) |  |  |
| systemUndelete | [SystemUndeleteOutput](#com-hedera-hapi-block-stream-SystemUndeleteOutput) |  |  |
| create_topic | [CreateTopicOutput](#com-hedera-hapi-block-stream-CreateTopicOutput) |  |  |
| update_topic | [UpdateTopicOutput](#com-hedera-hapi-block-stream-UpdateTopicOutput) |  |  |
| delete_topic | [DeleteTopicOutput](#com-hedera-hapi-block-stream-DeleteTopicOutput) |  |  |
| submit_message | [SubmitMessageOutput](#com-hedera-hapi-block-stream-SubmitMessageOutput) |  |  |
| create_token | [CreateTokenOutput](#com-hedera-hapi-block-stream-CreateTokenOutput) |  |  |
| freeze_token_account | [FreezeTokenAccountOutput](#com-hedera-hapi-block-stream-FreezeTokenAccountOutput) |  |  |
| unfreeze_token_account | [UnfreezeTokenAccountOutput](#com-hedera-hapi-block-stream-UnfreezeTokenAccountOutput) |  |  |
| grant_token_account_kyc | [GrantTokenKycOutput](#com-hedera-hapi-block-stream-GrantTokenKycOutput) |  |  |
| revoke_token_account_kyc | [RevokeTokenKycOutput](#com-hedera-hapi-block-stream-RevokeTokenKycOutput) |  |  |
| delete_token | [DeleteTokenOutput](#com-hedera-hapi-block-stream-DeleteTokenOutput) |  |  |
| update_token | [UpdateTokenOutput](#com-hedera-hapi-block-stream-UpdateTokenOutput) |  |  |
| update_token_nfts | [UpdateTokenNftsOutput](#com-hedera-hapi-block-stream-UpdateTokenNftsOutput) |  |  |
| mint_token | [MintTokenOutput](#com-hedera-hapi-block-stream-MintTokenOutput) |  |  |
| burn_token | [BurnTokenOutput](#com-hedera-hapi-block-stream-BurnTokenOutput) |  |  |
| wipe_token_account | [WipeTokenAccountOutput](#com-hedera-hapi-block-stream-WipeTokenAccountOutput) |  |  |
| associate_token | [AssociateTokenOutput](#com-hedera-hapi-block-stream-AssociateTokenOutput) |  |  |
| dissociate_token | [DissociateTokenOutput](#com-hedera-hapi-block-stream-DissociateTokenOutput) |  |  |
| update_token_fee_schedule | [UpdateTokenFeeScheduleOutput](#com-hedera-hapi-block-stream-UpdateTokenFeeScheduleOutput) |  |  |
| pause_token | [PauseTokenOutput](#com-hedera-hapi-block-stream-PauseTokenOutput) |  |  |
| unpause_token | [UnpauseTokenOutput](#com-hedera-hapi-block-stream-UnpauseTokenOutput) |  |  |
| create_schedule | [CreateScheduleOutput](#com-hedera-hapi-block-stream-CreateScheduleOutput) |  |  |
| delete_schedule | [DeleteScheduleOutput](#com-hedera-hapi-block-stream-DeleteScheduleOutput) |  |  |
| sign_schedule | [SignScheduleOutput](#com-hedera-hapi-block-stream-SignScheduleOutput) |  |  |
| update_node_stake | [UpdateNodeStakeOutput](#com-hedera-hapi-block-stream-UpdateNodeStakeOutput) |  |  |
| util_prng | [UtilPrngOutput](#com-hedera-hapi-block-stream-UtilPrngOutput) |  |  |
| freeze_network | [FreezeOutput](#com-hedera-hapi-block-stream-FreezeOutput) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



