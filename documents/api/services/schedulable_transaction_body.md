## Table of Contents

- [schedulable_transaction_body.proto](#schedulable_transaction_body-proto)
    - [SchedulableTransactionBody](#proto-SchedulableTransactionBody)
  



<a name="schedulable_transaction_body-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedulable_transaction_body.proto
# Schedulable Transaction Body
A message that replicates the `TransactionBody` message, with slight
changes to exclude fields that cannot be scheduled via a `scheduleCreate`
transaction.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-SchedulableTransactionBody"></a>

### SchedulableTransactionBody
A schedulable transaction.

The network configuration `scheduling.whitelist` limits which of these
transaction types may actually be scheduled. As of version `0.50.0` of the
consensus node software this list contains only `CryptoTransfer`,
`ConsensusSubmitMessage`, `TokenBurn`, `TokenMint`,
and `CryptoApproveAllowance`.


| Field | Type | Description |
| ----- | ---- | ----------- |
| transactionFee | [uint64](#uint64) | A limit for the transaction fee the client is willing to pay. <p> The network SHALL NOT charge fees greater than this value. |
| memo | [string](#string) | A short description of the schedulable transaction. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8. |
| consensusCreateTopic | [ConsensusCreateTopicTransactionBody](#proto-ConsensusCreateTopicTransactionBody) | Create a topic. |
| consensusUpdateTopic | [ConsensusUpdateTopicTransactionBody](#proto-ConsensusUpdateTopicTransactionBody) | Update a topic. |
| consensusDeleteTopic | [ConsensusDeleteTopicTransactionBody](#proto-ConsensusDeleteTopicTransactionBody) | Delete a topic. |
| consensusSubmitMessage | [ConsensusSubmitMessageTransactionBody](#proto-ConsensusSubmitMessageTransactionBody) | Submit a message to a topic.<br/> A message may be "chunked", and submitted in parts, if the total message size exceeds the limit for a single transaction. |
| contractCall | [ContractCallTransactionBody](#proto-ContractCallTransactionBody) | Call a function defined on a smart contract. |
| contractCreateInstance | [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody) | Create a smart contract. |
| contractUpdateInstance | [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody) | Update a smart contract. |
| contractDeleteInstance | [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody) | Delete a smart contract and transfer remaining balance to a specified account. |
| cryptoApproveAllowance | [CryptoApproveAllowanceTransactionBody](#proto-CryptoApproveAllowanceTransactionBody) | Add one or more approved allowances for spenders to transfer the paying account's hbar or tokens. |
| cryptoDeleteAllowance | [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody) | Delete one or more approvals for spenders to transfer the paying account's hbar or tokens. |
| cryptoCreateAccount | [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody) | Create a new Hedera account. |
| cryptoDelete | [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody) | Delete an Hedera account.<br/> This will mark the account as deleted, and transfer all remaining HBAR to a receiver account. |
| cryptoTransfer | [CryptoTransferTransactionBody](#proto-CryptoTransferTransactionBody) | Transfer HBAR between accounts. |
| cryptoUpdateAccount | [CryptoUpdateTransactionBody](#proto-CryptoUpdateTransactionBody) | Modify an Hedera account. |
| fileAppend | [FileAppendTransactionBody](#proto-FileAppendTransactionBody) | Append data to the end of a file. |
| fileCreate | [FileCreateTransactionBody](#proto-FileCreateTransactionBody) | Create a new file. |
| fileDelete | [FileDeleteTransactionBody](#proto-FileDeleteTransactionBody) | Delete a file.<br/> This will remove the content of the file, and mark the file as deleted. |
| fileUpdate | [FileUpdateTransactionBody](#proto-FileUpdateTransactionBody) | Modify a file.<br/> This may modify any metadata, and/or _replace_ the content. |
| systemDelete | [SystemDeleteTransactionBody](#proto-SystemDeleteTransactionBody) | Delete a file as an Hedera administrative function.<br/> This is a privileged operation. |
| systemUndelete | [SystemUndeleteTransactionBody](#proto-SystemUndeleteTransactionBody) | Restore a file deleted via `systemDelete`.<br/> This is a privileged operation. |
| freeze | [FreezeTransactionBody](#proto-FreezeTransactionBody) | Freeze the network.<br/> This is actually several possible operations, and the caller should examine the "freeze service" for more detail.<br/> This is a privileged operation. |
| util_prng | [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody) | Provide a deterministic pseudorandom number based on network state. |
| nodeCreate | [com.hedera.hapi.node.addressbook.NodeCreateTransactionBody](#com-hedera-hapi-node-addressbook-NodeCreateTransactionBody) | Create a new node in the network address book.<br/> This is a privileged operation. |
| nodeUpdate | [com.hedera.hapi.node.addressbook.NodeUpdateTransactionBody](#com-hedera-hapi-node-addressbook-NodeUpdateTransactionBody) | Update a node in the network address book.<br/> This is a privileged operation. |
| nodeDelete | [com.hedera.hapi.node.addressbook.NodeDeleteTransactionBody](#com-hedera-hapi-node-addressbook-NodeDeleteTransactionBody) | Delete a node from the network address book.<br/> This will mark the node as deleted.<br/> This is a privileged operation. |
| scheduleDelete | [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody) | Delete a schedule.<br/> The schedule will be marked as deleted. |
| tokenCreation | [TokenCreateTransactionBody](#proto-TokenCreateTransactionBody) | Create a new Hedera token. |
| tokenFreeze | [TokenFreezeAccountTransactionBody](#proto-TokenFreezeAccountTransactionBody) | Freeze an account with respect to a token.<br/> A frozen account cannot transact in that token until unfrozen. |
| tokenUnfreeze | [TokenUnfreezeAccountTransactionBody](#proto-TokenUnfreezeAccountTransactionBody) | Unfreeze an account with respect to a token. |
| tokenGrantKyc | [TokenGrantKycTransactionBody](#proto-TokenGrantKycTransactionBody) | Grant KYC to an account with respect to a token.<br/> KYC is generally a "know your customer" assertion that a responsible entity has sufficient information to positively identify the account holder to relevant authorities. |
| tokenRevokeKyc | [TokenRevokeKycTransactionBody](#proto-TokenRevokeKycTransactionBody) | Revoke KYC from an account with respect to a token. |
| tokenDeletion | [TokenDeleteTransactionBody](#proto-TokenDeleteTransactionBody) | Deletes an Hedera token.<br/> The token will be marked deleted. |
| tokenUpdate | [TokenUpdateTransactionBody](#proto-TokenUpdateTransactionBody) | Update an Hedera token.<br/> Depending on what fields are to be modified, the signature requirements will vary. See `TokenUpdateTransactionBody` for further detail. |
| token_update_nfts | [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody) | Update one or more non-fungible/unique tokens.<br/> This will update metadata for one or more serial numbers within a collection (token type). |
| tokenMint | [TokenMintTransactionBody](#proto-TokenMintTransactionBody) | Mint new tokens.<br/> All minted tokens will be delivered to the treasury account for the token type. The "mint key" for the token must sign this transaction. |
| tokenBurn | [TokenBurnTransactionBody](#proto-TokenBurnTransactionBody) | Burn tokens from the treasury account.<br/> The "burn key" for the token must sign this transaction. |
| tokenWipe | [TokenWipeAccountTransactionBody](#proto-TokenWipeAccountTransactionBody) | Wipe tokens from an account.<br/> This will remove a specified amount of fungible/common tokens or a specified list of non-fungible/unique serial numbered tokens of a given token type from an Hedera account. The removed tokens are _burned_ as if by a `tokenBurn` transaction.<br/> The "wipe key" for the token must sign this transaction. |
| tokenAssociate | [TokenAssociateTransactionBody](#proto-TokenAssociateTransactionBody) | Associate tokens to an account. |
| tokenDissociate | [TokenDissociateTransactionBody](#proto-TokenDissociateTransactionBody) | Dissociate tokens from an account. |
| token_fee_schedule_update | [TokenFeeScheduleUpdateTransactionBody](#proto-TokenFeeScheduleUpdateTransactionBody) | Update the custom fee schedule for a token.<br/> This transaction must be signed by the "fee schedule key" for the token. |
| token_pause | [TokenPauseTransactionBody](#proto-TokenPauseTransactionBody) | Pause a Token.<br/> This transaction must be signed by the "pause key" for the token. |
| token_unpause | [TokenUnpauseTransactionBody](#proto-TokenUnpauseTransactionBody) | Unpause a Token.<br/> This transaction must be signed by the "pause key" for the token. |
| tokenReject | [TokenRejectTransactionBody](#proto-TokenRejectTransactionBody) | "Reject" undesired tokens.<br/> This transaction will transfer one or more tokens or token balances held by the requesting account to the treasury for each token type. <p> Each transfer MUST be one of the following: <ul> <li>A single non-fungible/unique token.</li> <li>The full balance held for a fungible/common token type.</li> </ul> When complete, the requesting account SHALL NOT hold the rejected tokens.<br/> Custom fees and royalties defined for the tokens rejected SHALL NOT be charged for this transaction. |
| tokenCancelAirdrop | [TokenCancelAirdropTransactionBody](#proto-TokenCancelAirdropTransactionBody) | Cancel an "airdrop".<br/> This transaction cancels a pending airdrop for one or more recipients. <p> The airdrop(s) to cancel MUST be pending, and not claimed.<br/> |
| tokenClaimAirdrop | [TokenClaimAirdropTransactionBody](#proto-TokenClaimAirdropTransactionBody) | Claim an "airdrop". This transaction "claims" one or more pending "airdrops". <p> The airdrop(s) to claim MUST be pending, and not already claimed.<br/> |
| tokenAirdrop | [TokenAirdropTransactionBody](#proto-TokenAirdropTransactionBody) | Send an "airdrop" of tokens to one or more recipients. <p> This transaction unilaterally "gifts" tokens by transferring them from a "sender" account to the "recipient" account(s). If any recipient is not already associated to the token to airdrop, or has set a "reciever signature required" flag, then that recipient is recorded as a "pending" airdrop which must be "claimed". All other recipients receive the "airdropped" tokens immediately. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



