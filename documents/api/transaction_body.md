## Table of Contents

- [transaction_body.proto](#transaction_body-proto)
    - [TransactionBody](#proto-TransactionBody)
  



<a name="transaction_body-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_body.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TransactionBody"></a>

### TransactionBody
A single transaction. All transaction types are possible here.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transactionID | [TransactionID](#proto-TransactionID) |  | The ID for this transaction, which includes the payer's account (the account paying the transaction fee). If two transactions have the same transactionID, they won't both have an effect |
| nodeAccountID | [AccountID](#proto-AccountID) |  | The account of the node that submits the client's transaction to the network |
| transactionFee | [uint64](#uint64) |  | The maximum transaction fee the client is willing to pay |
| transactionValidDuration | [Duration](#proto-Duration) |  | The transaction is invalid if consensusTimestamp > transactionID.transactionValidStart + transactionValidDuration |
| generateRecord | [bool](#bool) |  | **Deprecated.** Should a record of this transaction be generated? (A receipt is always generated, but the record is optional) |
| memo | [string](#string) |  | Any notes or descriptions that should be put into the record (max length 100) |
| contractCall | [ContractCallTransactionBody](#proto-ContractCallTransactionBody) |  | Calls a function of a contract instance |
| contractCreateInstance | [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody) |  | Creates a contract instance |
| contractUpdateInstance | [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody) |  | Updates a contract |
| contractDeleteInstance | [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody) |  | Delete contract and transfer remaining balance into specified account |
| ethereumTransaction | [EthereumTransactionBody](#proto-EthereumTransactionBody) |  | An Ethereum encoded transaction. |
| cryptoAddLiveHash | [CryptoAddLiveHashTransactionBody](#proto-CryptoAddLiveHashTransactionBody) |  | Attach a new livehash to an account |
| cryptoApproveAllowance | [CryptoApproveAllowanceTransactionBody](#proto-CryptoApproveAllowanceTransactionBody) |  | Adds one or more approved allowances for spenders to transfer the paying account's hbar or tokens. |
| cryptoDeleteAllowance | [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody) |  | Deletes one or more of the specific approved NFT serial numbers on an owner account. |
| cryptoCreateAccount | [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody) |  | Create a new cryptocurrency account |
| cryptoDelete | [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody) |  | Delete a cryptocurrency account (mark as deleted, and transfer hbars out) |
| cryptoDeleteLiveHash | [CryptoDeleteLiveHashTransactionBody](#proto-CryptoDeleteLiveHashTransactionBody) |  | Remove a livehash from an account |
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
| uncheckedSubmit | [UncheckedSubmitBody](#proto-UncheckedSubmitBody) |  | UNDOCUMENTED |
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
| scheduleCreate | [ScheduleCreateTransactionBody](#proto-ScheduleCreateTransactionBody) |  | Creates a schedule in the network's action queue |
| scheduleDelete | [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody) |  | Deletes a schedule from the network's action queue |
| scheduleSign | [ScheduleSignTransactionBody](#proto-ScheduleSignTransactionBody) |  | Adds one or more Ed25519 keys to the affirmed signers of a scheduled transaction |
| node_stake_update | [NodeStakeUpdateTransactionBody](#proto-NodeStakeUpdateTransactionBody) |  | Updates the staking info at the end of staking period to indicate new staking period has started. |
| util_prng | [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody) |  | Generates a pseudorandom number. |
| token_update_nfts | [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody) |  | Update the metadata of one or more NFT's of a specific token type. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


