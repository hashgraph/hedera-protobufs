## Table of Contents

- [transaction_body.proto](#transaction_body-proto)
    - [TransactionBody](#proto-TransactionBody)
  



<a name="transaction_body-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## transaction_body.proto
# Transaction Body
The body of a transaction, this message is serialized and signed.

All of the entries in the `data` `oneof` are fully specified elsewhere;
we only include a short summary here.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TransactionBody"></a>

### TransactionBody
A transaction body.

Every transaction is structured as a signed byte array. That byte array
is a serialized `TransactionBody`.  The transaction body contains the full
content of the transaction, while the `SignedTransaction` includes a
signature map for signatures authenticating that byte array, and that is
serialized and transmitted wrapped in a `Transaction` message.<br/>
The bulk of this message is a `oneof` block which offers the option for
any one of the transaction messages for the network.
This message also includes several additional fields to specify
various parameters required to process a transaction.


| Field | Type | Description |
| ----- | ---- | ----------- |
| transactionID | [TransactionID](#proto-TransactionID) | A transaction identifier.<br/> Each transaction is uniquely identified by its transaction identifier. <p> Each transaction identifier MUST be unique.<br/> Multiple transactions MAY be submitted with the same transaction identifier, but all except the first SHALL be rejected as duplicate transactions.<br/> This identifier MUST specify a `payer` account to be charged all fees associated with the transaction.<br/> This identifier MUST specify a "valid start time".<br/> The "valid start time" MUST be strictly _earlier_ than the current network consensus time.<br/> The "valid start time" MUST NOT be more than the current network configuration value for `transaction.maxValidDuration` seconds before the current network consensus time.<br/> This identifier MUST NOT set the `scheduled` flag.<br/> This identifier MUST NOT set a nonce value. |
| nodeAccountID | [AccountID](#proto-AccountID) | A node account identifier. <p> This MUST identify the account of the consensus node to which this transaction is submitted. |
| transactionFee | [uint64](#uint64) | A maximum transaction fee, in tinybar. <p> The network SHALL NOT charge a transaction fee that exceeds this amount.<br/> The network MAY charge up to this amount, and reject the transaction, if the amount offered is insufficient to cover the required fees.<br/> The network MAY charge a minimum fee equal to 80% of the amount offered if the amount offered is much larger than the required fees. |
| transactionValidDuration | [Duration](#proto-Duration) | A maximum duration in which to execute this transaction. <p> This transaction SHALL be rejected as expired if the valid start time, extended by this duration, is less than the current network consensus time when the transaction is submitted.<br/> This transaction SHALL be rejected with an invalid duration if this value is greater than the current network configuration value for `transaction.maxValidDuration`. |
| generateRecord | [bool](#bool) | **Deprecated.** Records are always generated.<br/> Obsolete option to not generate a record. <p> This flag SHALL be ignored. Every transaction SHALL generate a record, or block stream equivalent. |
| memo | [string](#string) | A short description for this transaction. <p> This value, if set, MUST NOT exceed `transaction.maxMemoUtf8Bytes` (default 100) bytes when encoded as UTF-8. |
| contractCall | [ContractCallTransactionBody](#proto-ContractCallTransactionBody) | Call a function defined on a smart contract. |
| contractCreateInstance | [ContractCreateTransactionBody](#proto-ContractCreateTransactionBody) | Create a smart contract. |
| contractUpdateInstance | [ContractUpdateTransactionBody](#proto-ContractUpdateTransactionBody) | Update a smart contract. |
| cryptoAddLiveHash | [CryptoAddLiveHashTransactionBody](#proto-CryptoAddLiveHashTransactionBody) | **Deprecated.** An obsolete, and unsupported, operation to add a "live hash" to an account. |
| cryptoCreateAccount | [CryptoCreateTransactionBody](#proto-CryptoCreateTransactionBody) | Create a new Hedera account. |
| cryptoDelete | [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody) | Delete an Hedera account.<br/> This will mark the account as deleted, and transfer all remaining HBAR to a receiver account. |
| cryptoDeleteLiveHash | [CryptoDeleteLiveHashTransactionBody](#proto-CryptoDeleteLiveHashTransactionBody) | **Deprecated.** An obsolete, and unsupported, operation to remove a "live hash" from an account. |
| cryptoTransfer | [CryptoTransferTransactionBody](#proto-CryptoTransferTransactionBody) | Transfer HBAR between accounts. |
| cryptoUpdateAccount | [CryptoUpdateTransactionBody](#proto-CryptoUpdateTransactionBody) | Modify an Hedera account. |
| fileAppend | [FileAppendTransactionBody](#proto-FileAppendTransactionBody) | Append data to the end of a file. |
| fileCreate | [FileCreateTransactionBody](#proto-FileCreateTransactionBody) | Create a new file. |
| fileDelete | [FileDeleteTransactionBody](#proto-FileDeleteTransactionBody) | Delete a file.<br/> This will remove the content of the file, and mark the file as deleted. |
| fileUpdate | [FileUpdateTransactionBody](#proto-FileUpdateTransactionBody) | Modify a file.<br/> This may modify any metadata, and/or _replace_ the content. |
| systemDelete | [SystemDeleteTransactionBody](#proto-SystemDeleteTransactionBody) | Delete a file as an Hedera administrative function.<br/> This is a privileged operation. |
| systemUndelete | [SystemUndeleteTransactionBody](#proto-SystemUndeleteTransactionBody) | Restore a file deleted via `systemDelete`.<br/> This is a privileged operation. |
| contractDeleteInstance | [ContractDeleteTransactionBody](#proto-ContractDeleteTransactionBody) | Delete a smart contract and transfer remaining balance to a specified account. |
| freeze | [FreezeTransactionBody](#proto-FreezeTransactionBody) | Freeze the network.<br/> This is actually several possible operations, and the caller should examine the "freeze service" for more detail.<br/> This is a privileged operation. |
| consensusCreateTopic | [ConsensusCreateTopicTransactionBody](#proto-ConsensusCreateTopicTransactionBody) | Create a topic. |
| consensusUpdateTopic | [ConsensusUpdateTopicTransactionBody](#proto-ConsensusUpdateTopicTransactionBody) | Update a topic. |
| consensusDeleteTopic | [ConsensusDeleteTopicTransactionBody](#proto-ConsensusDeleteTopicTransactionBody) | Delete a topic. |
| consensusSubmitMessage | [ConsensusSubmitMessageTransactionBody](#proto-ConsensusSubmitMessageTransactionBody) | Submit a message to a topic.<br/> A message may be "chunked", and submitted in parts, if the total message size exceeds the limit for a single transaction. |
| uncheckedSubmit | [UncheckedSubmitBody](#proto-UncheckedSubmitBody) | Unsupported system transaction. <p> This transaction MAY be implemented in testing networks, but SHALL NOT be enabled or supported in production environments.<br/> Clients MUST NOT call this method, and any such transaction SHALL be rejected.<br/> A network MAY choose to charge punitive fees for attempting to execute an `uncheckedSubmit`. |
| tokenCreation | [TokenCreateTransactionBody](#proto-TokenCreateTransactionBody) | Create a new Hedera token. |
| tokenFreeze | [TokenFreezeAccountTransactionBody](#proto-TokenFreezeAccountTransactionBody) | Freeze an account with respect to a token.<br/> A frozen account cannot transact in that token until unfrozen. |
| tokenUnfreeze | [TokenUnfreezeAccountTransactionBody](#proto-TokenUnfreezeAccountTransactionBody) | Unfreeze an account with respect to a token. |
| tokenGrantKyc | [TokenGrantKycTransactionBody](#proto-TokenGrantKycTransactionBody) | Grant KYC to an account with respect to a token.<br/> KYC is generally a "know your customer" assertion that a responsible entity has sufficient information to positively identify the account holder to relevant authorities. |
| tokenRevokeKyc | [TokenRevokeKycTransactionBody](#proto-TokenRevokeKycTransactionBody) | Revoke KYC from an account with respect to a token. |
| tokenDeletion | [TokenDeleteTransactionBody](#proto-TokenDeleteTransactionBody) | Delete an Hedera token.<br/> The token will be marked deleted. |
| tokenUpdate | [TokenUpdateTransactionBody](#proto-TokenUpdateTransactionBody) | Update an Hedera token.<br/> Depending on what fields are to be modified, the signature requirements will vary. See `TokenUpdateTransactionBody` for further detail. |
| tokenMint | [TokenMintTransactionBody](#proto-TokenMintTransactionBody) | Mint new tokens.<br/> All minted tokens will be delivered to the treasury account for the token type. The "mint key" for the token must sign this transaction. |
| tokenBurn | [TokenBurnTransactionBody](#proto-TokenBurnTransactionBody) | Burn tokens from the treasury account.<br/> The "burn key" for the token must sign this transaction. |
| tokenWipe | [TokenWipeAccountTransactionBody](#proto-TokenWipeAccountTransactionBody) | Wipe tokens from an account.<br/> This will remove a specified amount of fungible/common tokens or a specified list of non-fungible/unique serial numbered tokens of a given token type from an Hedera account. The removed tokens are _burned_ as if by a `tokenBurn` transaction.<br/> The "wipe key" for the token must sign this transaction. |
| tokenAssociate | [TokenAssociateTransactionBody](#proto-TokenAssociateTransactionBody) | Associate tokens to an account. |
| tokenDissociate | [TokenDissociateTransactionBody](#proto-TokenDissociateTransactionBody) | Dissociate tokens from an account. |
| scheduleCreate | [ScheduleCreateTransactionBody](#proto-ScheduleCreateTransactionBody) | Create a schedule.<br/> A schedule is a request to execute a specific transaction, included in the create body, in the future. The scheduled transaction may execute as soon as all signature requirements are met with the schedule create or a subsequent schedule sign transaction. A schedule may, alternatively, execute on expiration if long-term schedules are enabled and the schedule meets signature requirements at that time. |
| scheduleDelete | [ScheduleDeleteTransactionBody](#proto-ScheduleDeleteTransactionBody) | Delete a schedule.<br/> The schedule will be marked as deleted. |
| scheduleSign | [ScheduleSignTransactionBody](#proto-ScheduleSignTransactionBody) | Sign a schedule.<br/> Add one or more cryptographic keys to the list of keys that have signed a schedule, and which may serve to meet the signature requirements for the scheduled transaction. |
| token_fee_schedule_update | [TokenFeeScheduleUpdateTransactionBody](#proto-TokenFeeScheduleUpdateTransactionBody) | Update the custom fee schedule for a token.<br/> This transaction must be signed by the "fee schedule key" for the token. |
| token_pause | [TokenPauseTransactionBody](#proto-TokenPauseTransactionBody) | Pause a Token. <p> This transaction MUST be signed by the "pause key" for the token. |
| token_unpause | [TokenUnpauseTransactionBody](#proto-TokenUnpauseTransactionBody) | Unpause a Token. <p> This transaction MUST be signed by the "pause key" for the token. |
| cryptoApproveAllowance | [CryptoApproveAllowanceTransactionBody](#proto-CryptoApproveAllowanceTransactionBody) | Add one or more approved allowances for spenders to transfer the paying account's hbar or tokens. |
| cryptoDeleteAllowance | [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody) | Delete one or more approvals for spenders to transfer the paying account's hbar or tokens. |
| ethereumTransaction | [EthereumTransactionBody](#proto-EthereumTransactionBody) | Perform an Ethereum encoded transaction. |
| node_stake_update | [NodeStakeUpdateTransactionBody](#proto-NodeStakeUpdateTransactionBody) | Update the staking information.<br/> This internal transaction is performed at the end of a staking period to complete staking calculations and indicate that new staking period has started. |
| util_prng | [UtilPrngTransactionBody](#proto-UtilPrngTransactionBody) | Provide a deterministic pseudorandom number based on network state. |
| token_update_nfts | [TokenUpdateNftsTransactionBody](#proto-TokenUpdateNftsTransactionBody) | Update one or more non-fungible/unique tokens.<br/> This will update metadata for one or more serial numbers within a collection (token type). |
| nodeCreate | [com.hedera.hapi.node.addressbook.NodeCreateTransactionBody](#com-hedera-hapi-node-addressbook-NodeCreateTransactionBody) | Create a new node in the network address book.<br/> This is a privileged operation. <p> This transaction SHALL create a new consensus node record and add that record to the network address book. |
| nodeUpdate | [com.hedera.hapi.node.addressbook.NodeUpdateTransactionBody](#com-hedera-hapi-node-addressbook-NodeUpdateTransactionBody) | Update a node in the network address book.<br/> This is a privileged operation. <p> This transaction SHALL update an existing consensus node record in the network address book. |
| nodeDelete | [com.hedera.hapi.node.addressbook.NodeDeleteTransactionBody](#com-hedera-hapi-node-addressbook-NodeDeleteTransactionBody) | Delete a node from the network address book.<br/> This is a privileged operation. <p> This transaction SHALL mark an existing consensus node record as deleted and remove that node from the network address book. |
| tokenReject | [TokenRejectTransactionBody](#proto-TokenRejectTransactionBody) | Reject and return a token to treasury.<br/> This transaction will transfer one or more tokens or token balances held by the requesting account to the treasury for each token type. <p> Each transfer MUST be one of the following: <ul> <li>A single non-fungible/unique token.</li> <li>The full balance held for a fungible/common token type.</li> </ul> When complete, the requesting account SHALL NOT hold the rejected tokens.<br/> Custom fees and royalties defined for the tokens rejected SHALL NOT be charged for this transaction. |
| tokenAirdrop | [TokenAirdropTransactionBody](#proto-TokenAirdropTransactionBody) | "Airdrop" tokens.<br/> This transaction sends tokens from one or more "sender" accounts to one or more "recipient" accounts. <p> If a recipient account cannot immediately receive the token(s) sent, a "pending" airdrop SHALL be created and MUST be claimed. |
| tokenCancelAirdrop | [TokenCancelAirdropTransactionBody](#proto-TokenCancelAirdropTransactionBody) | Cancel one or more "pending" airdrops that are not yet claimed. |
| tokenClaimAirdrop | [TokenClaimAirdropTransactionBody](#proto-TokenClaimAirdropTransactionBody) | Claim one or more "pending" airdrops. |
| tssMessage | [com.hedera.hapi.services.auxiliary.tss.TssMessageTransactionBody](#com-hedera-hapi-services-auxiliary-tss-TssMessageTransactionBody) | A transaction body for a `tssMessage` request. |
| tssVote | [com.hedera.hapi.services.auxiliary.tss.TssVoteTransactionBody](#com-hedera-hapi-services-auxiliary-tss-TssVoteTransactionBody) | A transaction body for a `tssVote` request. |
| tssShareSignature | [com.hedera.hapi.services.auxiliary.tss.TssShareSignatureTransactionBody](#com-hedera-hapi-services-auxiliary-tss-TssShareSignatureTransactionBody) | A transaction body for node signature as part of the Threshold Signature Scheme (TSS) processing. |
| tssEncryptionKey | [com.hedera.hapi.services.auxiliary.tss.TssEncryptionKeyTransactionBody](#com-hedera-hapi-services-auxiliary-tss-TssEncryptionKeyTransactionBody) | A transaction body for a 'tssEncryptionKey` request |
| state_signature_transaction | [com.hedera.hapi.platform.event.StateSignatureTransaction](#com-hedera-hapi-platform-event-StateSignatureTransaction) | A transaction body for signature of a state root hash gossiped to other nodes |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



