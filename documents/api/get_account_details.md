## Table of Contents

- [get_account_details.proto](#get_account_details-proto)
    - [GetAccountDetailsQuery](#proto-GetAccountDetailsQuery)
    - [GetAccountDetailsResponse](#proto-GetAccountDetailsResponse)
    - [GetAccountDetailsResponse.AccountDetails](#proto-GetAccountDetailsResponse-AccountDetails)
    - [GrantedCryptoAllowance](#proto-GrantedCryptoAllowance)
    - [GrantedNftAllowance](#proto-GrantedNftAllowance)
    - [GrantedTokenAllowance](#proto-GrantedTokenAllowance)
  



<a name="get_account_details-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## get_account_details.proto
# Get Account Details
A standard query to inspect the full detail of an account.

> REVIEW NOTE
>> This query in NetworkAdmin service duplicates CryptoGetInfo in Token Service.<br/>
>> What is the value of having both?<br/>
>> Should this version be deprecated?

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-GetAccountDetailsQuery"></a>

### GetAccountDetailsQuery
Request detail information about an account.

The returned information SHALL include balance and allowances.<br/>
The returned information SHALL NOT include a list of account records.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| account_id | [AccountID](#proto-AccountID) |  | An account ID for which information is requested |






<a name="proto-GetAccountDetailsResponse"></a>

### GetAccountDetailsResponse
A response to a `GetAccountDetailsQuery`.

This SHALL contain the account details if requested and successful.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| account_details | [GetAccountDetailsResponse.AccountDetails](#proto-GetAccountDetailsResponse-AccountDetails) |  | Details of the account.<br/> A state proof MAY be generated for this field. |






<a name="proto-GetAccountDetailsResponse-AccountDetails"></a>

### GetAccountDetailsResponse.AccountDetails
A single Account in the Hedera distributed ledger.

Each Account has a unique three-part identifier, a Key, and one or more token balances.

Accounts also have an alias, which has multiple forms, and may be set automatically.

Several additional items are associated with the Account to enable full functionality.

Accounts, as most items in the network, have an expiration time, recorded as a `Timestamp`,
and must be "renewed" for a small fee at expiration. This helps to reduce the
amount of inactive accounts retained in state. Another account may be designated to pay
any renewal fees and automatically renew the account for (by default) 30-90 days at a time
as a means to optionally ensure important accounts remain active.

Accounts may participate in securing the network by "staking" the account balances to a
particular network node, and receive a portion of network fees as a reward. An account may
optionally decline these rewards but still stake its balances.

An account may optionally require that inbound transfer transactions be signed by that
account as receiver (in addition to the sender's signature).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id | [AccountID](#proto-AccountID) |  | The unique ID of this account.<br/> An account ID, when assigned to this field, SHALL be of the form `shard.realm.number`. |
| contract_account_id | [string](#string) |  | A Solidity ID.<br/> This SHALL be populated if this account is a smart contract, and SHALL NOT be populated otherwise. This SHALL be formatted as a string according to Solidity ID standards. |
| deleted | [bool](#bool) |  | A boolean indicating that this account is deleted.<br/> Any transaction involving a deleted account SHALL fail. |
| proxy_account_id | [AccountID](#proto-AccountID) |  | **Deprecated.** Replaced by StakingInfo, available from Mirror Nodes.<br/> ID of the account to which this account is staking its balances. If this account is not currently staking its balances, then this field, if set, SHALL be the sentinel value of `0.0.0`. |
| proxy_received | [int64](#int64) |  | The total amount of tinybar proxy staked to this account. |
| key | [Key](#proto-Key) |  | The key to be used to sign transactions from this account, if any.<br/> This key SHALL NOT be set for hollow accounts until the account is finalized.<br/> This key SHALL be set on all other accounts, except for certain immutable accounts (0.0.800 and 0.0.801) necessary for network function and otherwise secured by the governing council. |
| balance | [uint64](#uint64) |  | The HBAR balance of this account, in tinybar (10<sup>-8</sup> HBAR).<br/> This value is a signed integer for efficiency, but SHALL always be a whole number. |
| receiver_sig_required | [bool](#bool) |  | A boolean indicating that the account requires a receiver signature for inbound token transfer transactions.<br/> If this value is `true` then a transaction to transfer tokens to this account SHALL NOT succeed unless this account has signed the transfer transaction. |
| expiration_time | [Timestamp](#proto-Timestamp) |  | The current expiration time for this account. This account SHALL be due standard renewal fees when the network consensus time exceeds this time.<br/> If rent and expiration are enabled for the network, and automatic renewal is enabled for this account, renewal fees SHALL be charged after this time, and, if charged, the expiration time SHALL be extended for another renewal period.<br/> This account MAY be expired and removed from state at any point after this time if not renewed.<br/> An account holder MAY extend this time by submitting an account update transaction to modify expiration time, subject to the current maximum expiration time for the network. |
| auto_renew_period | [Duration](#proto-Duration) |  | The number of seconds the network SHALL use to extend the account's expiration, if funds are available during automatic renewal processing.<br/> This SHALL NOT apply if the account is already deleted upon expiration.<br/> If insufficient funds are available for automatic renewal, the account SHALL be renewed for as long as possible, given available funds. |
| token_relationships | [TokenRelationship](#proto-TokenRelationship) | repeated | A list of all token relationships associated to this account. A token relationship describes the connection between an Account and a Token type, including the current account balance in that token, if applicable. <blockquote>REVIEW NOTE<blockquote> Should this be deprecated, much as it is in crypto get info?</blockquote></blockquote> |
| memo | [string](#string) |  | A short description of this account.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| owned_nfts | [int64](#int64) |  | The total number of non-fungible/unique tokens owned by this account. |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that can be auto-associated with the account.<br/> If this is less than or equal to `used_auto_associations` (or 0), then this account MUST manually associate with a token before transacting in that token.<br/> Following HIP-904 This value may also be `-1` to indicate no limit.<br/> This value MUST NOT be less than `-1`. |
| alias | [bytes](#bytes) |  | An account EVM alias.<br/> This is a value used in some contexts to reference an account when the tripartite account identifier is not available.<br/> This field, when set to a non-default value, is immutable and SHALL NOT be changed. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response.<br/> This is originally defined in `HIP-198` and depends on network configuration.<br/> The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |
| granted_crypto_allowances | [GrantedCryptoAllowance](#proto-GrantedCryptoAllowance) | repeated | A list of crypto (HBAR) allowances approved by this account.<br/> If this is not empty, each allowance SHALL permit a specified "spender" account to spend this account's HBAR balance, up to a designated limit.<br/> This field SHALL permit spending only HBAR balance, not other tokens the account may hold. Allowances for other tokens SHALL be listed in the `token_allowances` field or the `approve_for_all_nft_allowances` field. |
| granted_nft_allowances | [GrantedNftAllowance](#proto-GrantedNftAllowance) | repeated | A list of non-fungible token (NFT) allowances approved by this account.<br/> If this is not empty, each allowance permits a specified "spender" account to transfer _all_ of this account's non-fungible tokens from a particular collection.<br/> Allowances for a specific serial number MUST be directly associated with that specific non-fungible token, rather than the holding account. |
| granted_token_allowances | [GrantedTokenAllowance](#proto-GrantedTokenAllowance) | repeated | A list of fungible token allowances approved by this account.<br/> If this is not empty, each allowance permits a specified "spender" to spend this account's fungible tokens, of the designated type, up to a designated limit. |






<a name="proto-GrantedCryptoAllowance"></a>

### GrantedCryptoAllowance
Permission granted by one account (the "funding" account) to another account
(the "spender" account) that allows the spender to spend a specified amount of HBAR owned by
the funding account.

An allowance SHALL NOT transfer any HBAR directly, it only permits transactions signed only
by the spender account to transfer HBAR, up to the amount specified, from the funding account.

Once the specified amount is spent, the allowance SHALL be consumed and a new allowance SHALL be
required before that spending account may spend additional HBAR from the funding account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| spender | [AccountID](#proto-AccountID) |  | The identifier for the spending account associated with this allowance.<br/> This account SHALL be permitted to sign transactions to spend HBAR from the funding/allowing account.<br/> This permission SHALL be limited to no more than the specified `amount`. |
| amount | [int64](#int64) |  | The maximum amount that the spender account may transfer within the scope of this allowance.<br/> This allowance SHALL be consumed if any combination of transfers authorized via this allowance meet this value in total.<br/> This value MUST be specified in tinybar (i.e. 10<sup>-8</sup> HBAR). |






<a name="proto-GrantedNftAllowance"></a>

### GrantedNftAllowance
Permission granted by one account (the "funding" account) to another account
(the "spender" account) that allows the spender to transfer all serial numbers of a specific
non-fungible token (NFT) collection owned by the funding account.<br/>
This is a broad permission, as it does not matter how many NFTs of the specified collection
the funding account owns, the spender MAY dispose of any or all of them with this allowance.<br/>
Each token type (typically a collection of NFTs) SHALL require a separate allowance.<br/>
Allowances for a specific serial number MUST be directly associated with that specific
non-fungible token, rather than the holding account.

An allowance SHALL NOT transfer any tokens directly, it only permits transactions signed only
by the spender account to transfer any non-fungible tokens of the specified type owned by the
funding account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The identifier for the token associated with this allowance.<br/> This token MUST be a non-fungible/unique token. |
| spender | [AccountID](#proto-AccountID) |  | The identifier for the spending account associated with this allowance.<br/> This account SHALL be permitted to sign transactions to spend tokens of the associated token type from the funding/allowing account. |






<a name="proto-GrantedTokenAllowance"></a>

### GrantedTokenAllowance
Permission granted by one account (the "funding" account) to another account
(the "spender" account) that allows the spender to spend a specified amount of a specific
non-HBAR fungible token from the balance owned by the funding account.

An allowance SHALL NOT transfer any tokens directly, it only permits transactions signed only
by the spender account to transfer tokens of the specified type, up to the amount specified,
from the funding account.

Once the specified amount is spent, the allowance SHALL be consumed and a new allowance SHALL be
required before that spending account may spend additional tokens from the funding account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The identifier for the token associated with this allowance.<br/> This token MUST be a fungible/common token. |
| spender | [AccountID](#proto-AccountID) |  | The identifier for the spending account associated with this allowance.<br/> This account SHALL be permitted to sign transactions to spend tokens of the associated token type from the funding/allowing account.<br/> This permission SHALL be limited to no more than the specified `amount`. |
| amount | [int64](#int64) |  | The maximum amount that the spender account may transfer within the scope of this allowance.<br/> This allowance SHALL be consumed if any combination of transfers authorized via this allowance meet this value in total.<br/> This value MUST be specified in the smallest units of the relevant token (i.e. 10<sup>-decimals</sup> whole tokens). |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


