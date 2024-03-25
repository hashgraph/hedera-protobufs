## Table of Contents

- [stream/transaction_output.proto](#stream_transaction_output-proto)
    - [TransactionOutput](#proto-TransactionOutput)
  



<a name="stream_transaction_output-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/transaction_output.proto
#


### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionOutput"></a>

### TransactionOutput



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contract_call | [CallContractOutput](#proto-CallContractOutput) |  |  |
| contract_create | [CreateContractOutput](#proto-CreateContractOutput) |  |  |
| ethereum_call | [EthereumOutput](#proto-EthereumOutput) |  | UpdateContractOutput contract_update = 3; DeleteContractOutput contract_delete = 4; |
| create_account | [CreateAccountOutput](#proto-CreateAccountOutput) |  | ApproveAllowanceOutput approve_allowance = 6; DeleteAllowanceOutput delete_allowance = 7; |
| crypto_transfer | [CryptoTransferOutput](#proto-CryptoTransferOutput) |  | DeleteAccountOutput delete_account = 9; |
| file_create | [CreateFileOutput](#proto-CreateFileOutput) |  | UpdateAccountOutput update_account = 11; AppendFileOutput file_append = 12; |
| create_topic | [CreateTopicOutput](#proto-CreateTopicOutput) |  | DeleteFileOutput file_delete = 14; UpdateFileOutput fileUpdate = 15; SystemDeleteOutput systemDelete = 16; SystemUndeleteOutput systemUndelete = 17; |
| submit_message | [SubmitMessageOutput](#proto-SubmitMessageOutput) |  | UpdateTopicOutput update_topic = 19; DeleteTopicOutput delete_topic = 20; |
| create_token | [CreateTokenOutput](#proto-CreateTokenOutput) |  |  |
| mint_token | [MintTokenOutput](#proto-MintTokenOutput) |  | FreezeTokenAccountOutput freeze_token_account = 23; UnfreezeTokenAccountOutput unfreeze_token_account = 24; GrantTokenKycOutput grant_token_account_kyc = 25; RevokeTokenKycOutput revoke_token_account_kyc = 26; DeleteTokenOutput delete_token = 27; UpdateTokenOutput update_token = 28; UpdateTokenNftsOutput update_token_nfts = 29; |
| burn_token | [BurnTokenOutput](#proto-BurnTokenOutput) |  |  |
| wipe_token_account | [WipeTokenAccountOutput](#proto-WipeTokenAccountOutput) |  |  |
| create_schedule | [CreateScheduleOutput](#proto-CreateScheduleOutput) |  | AssociateTokenOutput associate_token = 33; DissociateTokenOutput dissociate_token = 34; UpdateTokenFeeScheduleOutput update_token_fee_schedule = 35; PauseTokenOutput pause_token = 36; UnpauseTokenOutput unpause_token = 37; |
| sign_schedule | [SignScheduleOutput](#proto-SignScheduleOutput) |  | DeleteScheduleOutput delete_schedule = 39; |
| util_prng | [UtilPrngOutput](#proto-UtilPrngOutput) |  | UpdateNodeStakeOutput update_node_stake = 41;

FreezeNetworkOutput freeze_network = 43; |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



