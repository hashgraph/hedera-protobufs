## Table of Contents

- [stream/transaction_output.proto](#stream_transaction_output-proto)
    - [TransactionOutput](#com-hedera-hapi-block-stream-TransactionOutput)
  



<a name="stream_transaction_output-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/transaction_output.proto
# Transaction Output
Messages that describe the output of a transaction; data reported
in the block stream that is not in the transaction body and is
not reported in state changes.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-TransactionOutput"></a>

### TransactionOutput
Output from a transaction.

The values in transaction outputs SHALL be data that is neither present
in the original transaction nor present in state changes.

> Note
>> Only a few transactions produce output that is not in the transaction
>> and also not reflected in state changes. All other transaction types
>> are _currently_ not included here. We have, however, allocated names
>> and indexes for those transaction types to preserve consistency if we
>> add them later. We have reserved field indexes 9 to 43 for this purpose.

<!--
Reserved definitions:
import "stream/smart_contract_service.proto";
   UpdateContractOutput contract_update;
   DeleteContractOutput contract_delete;
   SystemDeleteContractOutput
   SystemUnDeleteContractOutput
   CreateTopicOutput create_topic;
   UpdateTopicOutput update_topic;

import "stream/file_service.proto";
   CreateFileOutput file_create;
   AppendFileOutput file_append;
   UpdateFileOutput file_update;
   DeleteFileOutput file_delete;
   SystemDeleteOutput system_delete;
   SystemUndeleteOutput system_undelete;

import "stream/crypto_service.proto";
   UpdateNodeStakeOutput update_node_stake;
   ApproveAllowanceOutput approve_allowance;
   DeleteAllowanceOutput delete_allowance;
   CreateAccountOutput create_account;
   UpdateAccountOutput update_account;
   DeleteAccountOutput delete_account;

import "stream/token_service.proto";
   CreateTokenOutput create_token;
   DeleteTokenOutput delete_token;
   FreezeTokenAccountOutput freeze_token_account;
   UnfreezeTokenAccountOutput unfreeze_token_account;
   GrantTokenKycOutput grant_token_account_kyc;
   RevokeTokenKycOutput revoke_token_account_kyc;
   UpdateTokenOutput update_token;
   UpdateTokenNftsOutput update_token_nfts;
   MintTokenOutput mint_token;
   BurnTokenOutput burn_token;
   WipeTokenAccountOutput wipe_token_account;
   AssociateTokenOutput associate_token;
   DissociateTokenOutput dissociate_token;
   UpdateTokenFeeScheduleOutput update_token_fee_schedule;
   PauseTokenOutput pause_token;
   UnpauseTokenOutput unpause_token;

import "stream/consensus_service.proto";
   DeleteTopicOutput delete_topic;

import "stream/schedule_service.proto";
   DeleteScheduleOutput delete_schedule;

import "stream/network_service.proto";
   FreezeOutput freeze_network;
-->


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| submit_message | [SubmitMessageOutput](#com-hedera-hapi-block-stream-SubmitMessageOutput) |  | Output from a submit message transaction. |
| crypto_transfer | [CryptoTransferOutput](#com-hedera-hapi-block-stream-CryptoTransferOutput) |  | Output from a crypto transfer transaction. |
| util_prng | [UtilPrngOutput](#com-hedera-hapi-block-stream-UtilPrngOutput) |  | Output from a utilPrng transaction to request a deterministic pseudo-random number. |
| contract_call | [CallContractOutput](#com-hedera-hapi-block-stream-CallContractOutput) |  | Output from a contract call transaction. |
| ethereum_call | [EthereumOutput](#com-hedera-hapi-block-stream-EthereumOutput) |  | Output from an ethereum call transaction. |
| contract_create | [CreateContractOutput](#com-hedera-hapi-block-stream-CreateContractOutput) |  | Output from a contract create transaction. |
| create_schedule | [CreateScheduleOutput](#com-hedera-hapi-block-stream-CreateScheduleOutput) |  | Output from a schedule create transaction that executed immediately on creation. |
| sign_schedule | [SignScheduleOutput](#com-hedera-hapi-block-stream-SignScheduleOutput) |  | Output from a schedule sign transaction that resulted in executing the scheduled transaction. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



