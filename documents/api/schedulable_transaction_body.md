## Table of Contents

- [schedulable_transaction_body.proto](#schedulable_transaction_body-proto)
    - [SchedulableTransactionBody](#proto-SchedulableTransactionBody)
  



<a name="schedulable_transaction_body-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedulable_transaction_body.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-SchedulableTransactionBody"></a>

### SchedulableTransactionBody
A schedulable transaction. Note that the global/dynamic system property
<tt>scheduling.whitelist</tt> controls which transaction types may be scheduled. As of Hedera
Services 0.24.0 this list includes <tt>ConsensusSubmitMessage</tt>, <tt>CryptoTransfer</tt>, <tt>TokenMint</tt>, and <tt>TokenBurn</tt>
functions.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transactionFee | [uint64](#uint64) |  | The maximum transaction fee the client is willing to pay |
| memo | [string](#string) |  | A memo to include the execution record; the UTF-8 encoding may be up to 100 bytes and must not include the zero byte |
| contractCall | [ContractCallTransactionBody](#proto-ContractCallTransactionBody) |  | Calls a function of a contract instance |
| contractCreateInstance | [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody) |  | Creates a contract instance |
| contractUpdateInstance | [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody) |  | Updates a contract |
| contractDeleteInstance | [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody) |  | Delete contract and transfer remaining balance into specified account |
| cryptoApproveAllowance | [CryptoApproveAllowanceTransactionBody](#proto-CryptoApproveAllowanceTransactionBody) |  | Adds one or more approved allowances for spenders to transfer the paying account's hbar or tokens. |
| cryptoDeleteAllowance | [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody) |  | Deletes one or more of the specific approved NFT serial numbers on an owner account. |
| cryptoCreateAccount | [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody) |  | Create a new cryptocurrency account |
| cryptoDelete | [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody) |  | Delete a cryptocurrency account (mark as deleted, and transfer hbars out) |
| cryptoTransfer | [CryptoTransferTransactionBody](#proto-CryptoTransferTransactionBody) |  | Transfer amount between accounts |
| cryptoUpdateAccount | [CryptoUpdateTransactionBody](#proto-CryptoUpdateTransactionBody) |  | Modify information such as the expiration date for an account |
| fileAppend | [FileAppendTransactionBody](#proto-FileAppendTransactionBody) |  | Add bytes to the end of the contents of a file |
| fileCreate | [FileCreateTransactionBody](#proto-FileCreateTransactionBody) |  | Create a new file |
| fileDelete | [FileDeleteTransactionBody](#proto-FileDeleteTransactionBody) |  | Delete a file (remove contents and mark as deleted until it expires) |
| fileUpdate | [FileUpdateTransactionBody](#proto-FileUpdateTransactionBody) |  | Modify information such as the expiration date for a file |
| systemDelete | [SystemDeleteTransactionBody](#proto-SystemDeleteTransactionBody) |  | Hedera administrative deletion of a file or smart contract |
| systemUndelete | [SystemUndeleteTransactionBody](#proto-SystemUndeleteTransactionBody) |  | To undelete an entity deleted by SystemDelete |
| freeze | [FreezeTransactionBody](#proto-FreezeTransactionBody) |  | Freeze the nodes |
| consensusCreateTopic | [ConsensusCreateTopicTransactionBody](#proto-ConsensusCreateTopicTransactionBody) |  | Creates a topic |
| consensusUpdateTopic | [ConsensusUpdateTopicTransactionBody](#proto-ConsensusUpdateTopicTransactionBody) |  | Updates a topic |
| consensusDeleteTopic | [ConsensusDeleteTopicTransactionBody](#proto-ConsensusDeleteTopicTransactionBody) |  | Deletes a topic |
| consensusSubmitMessage | [ConsensusSubmitMessageTransactionBody](#proto-ConsensusSubmitMessageTransactionBody) |  | Submits message to a topic |
| tokenCreation | [TokenCreateTransactionBody](#proto-TokenCreateTransactionBody) |  | Creates a token instance |
| tokenFreeze | [TokenFreezeAccountTransactionBody](#proto-TokenFreezeAccountTransactionBody) |  | Freezes account not to be able to transact with a token |
| tokenUnfreeze | [TokenUnfreezeAccountTransactionBody](#proto-TokenUnfreezeAccountTransactionBody) |  | Unfreezes account for a token |
| tokenGrantKyc | [TokenGrantKycTransactionBody](#proto-TokenGrantKycTransactionBody) |  | Grants KYC to an account for a token |
| tokenRevokeKyc | [TokenRevokeKycTransactionBody](#proto-TokenRevokeKycTransactionBody) |  | Revokes KYC of an account for a token |
| tokenDeletion | [TokenDeleteTransactionBody](#proto-TokenDeleteTransactionBody) |  | Deletes a token instance |
| tokenUpdate | [TokenUpdateTransactionBody](#proto-TokenUpdateTransactionBody) |  | Updates a token instance |
| tokenMint | [TokenMintTransactionBody](#proto-TokenMintTransactionBody) |  | Mints new tokens to a token's treasury account |
| tokenBurn | [TokenBurnTransactionBody](#proto-TokenBurnTransactionBody) |  | Burns tokens from a token's treasury account |
| tokenWipe | [TokenWipeAccountTransactionBody](#proto-TokenWipeAccountTransactionBody) |  | Wipes amount of tokens from an account |
| tokenAssociate | [TokenAssociateTransactionBody](#proto-TokenAssociateTransactionBody) |  | Associate tokens to an account |
| tokenDissociate | [TokenDissociateTransactionBody](#proto-TokenDissociateTransactionBody) |  | Dissociate tokens from an account |
| token_fee_schedule_update | [TokenFeeScheduleUpdateTransactionBody](#proto-TokenFeeScheduleUpdateTransactionBody) |  | Updates a token's custom fee schedule |
| token_pause | [TokenPauseTransactionBody](#proto-TokenPauseTransactionBody) |  | Pauses the Token |
| token_unpause | [TokenUnpauseTransactionBody](#proto-TokenUnpauseTransactionBody) |  | Unpauses the Token |
| scheduleDelete | [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody) |  | Marks a schedule in the network's action queue as deleted, preventing it from executing |
| util_prng | [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody) |  | Generates a pseudorandom number. |
| token_update_nfts | [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody) |  | Update the metadata of one or more NFT's of a specific token type. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


