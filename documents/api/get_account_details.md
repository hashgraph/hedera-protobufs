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
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-GetAccountDetailsQuery"></a>

### GetAccountDetailsQuery
Gets all the information about an account, including balance and allowances. This does not get the list of
account records.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Account details sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| account_id | [AccountID](#proto-AccountID) |  | The account ID for which information is requested |






<a name="proto-GetAccountDetailsResponse"></a>

### GetAccountDetailsResponse
Response when the client sends the node GetAccountDetailsQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| account_details | [GetAccountDetailsResponse.AccountDetails](#proto-GetAccountDetailsResponse-AccountDetails) |  | Details of the account (a state proof can be generated for this) |






<a name="proto-GetAccountDetailsResponse-AccountDetails"></a>

### GetAccountDetailsResponse.AccountDetails



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| account_id | [AccountID](#proto-AccountID) |  | The account ID for which this information applies |
| contract_account_id | [string](#string) |  | The Contract Account ID comprising of both the contract instance and the cryptocurrency account owned by the contract instance, in the format used by Solidity |
| deleted | [bool](#bool) |  | If true, then this account has been deleted, it will disappear when it expires, and all transactions for it will fail except the transaction to extend its expiration date |
| proxy_account_id | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] The Account ID of the account to which this is proxy staked. If proxyAccountID is null, or is an invalid account, or is an account that isn't a node, then this account is automatically proxy staked to a node chosen by the network, but without earning payments. If the proxyAccountID account refuses to accept proxy staking , or if it is not currently running a node, then it will behave as if proxyAccountID was null. |
| proxy_received | [int64](#int64) |  | The total number of tinybars proxy staked to this account |
| key | [Key](#proto-Key) |  | The key for the account, which must sign in order to transfer out, or to modify the account in any way other than extending its expiration date. |
| balance | [uint64](#uint64) |  | The current balance of account in tinybars |
| receiver_sig_required | [bool](#bool) |  | If true, no transaction can transfer to this account unless signed by this account's key |
| expiration_time | [Timestamp](#proto-Timestamp) |  | The TimeStamp time at which this account is set to expire |
| auto_renew_period | [Duration](#proto-Duration) |  | The duration for expiration time will extend every this many seconds. If there are insufficient funds, then it extends as long as possible. If it is empty when it expires, then it is deleted. |
| token_relationships | [TokenRelationship](#proto-TokenRelationship) | repeated | All tokens related to this account |
| memo | [string](#string) |  | The memo associated with the account |
| owned_nfts | [int64](#int64) |  | The number of NFTs owned by this account |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that an Account can be implicitly associated with. |
| alias | [bytes](#bytes) |  | The alias of this account |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| granted_crypto_allowances | [GrantedCryptoAllowance](#proto-GrantedCryptoAllowance) | repeated | All of the hbar allowances approved by the account owner. |
| granted_nft_allowances | [GrantedNftAllowance](#proto-GrantedNftAllowance) | repeated | All of the non-fungible token allowances approved by the account owner. |
| granted_token_allowances | [GrantedTokenAllowance](#proto-GrantedTokenAllowance) | repeated | All of the fungible token allowances approved by the account owner. |






<a name="proto-GrantedCryptoAllowance"></a>

### GrantedCryptoAllowance
A granted allowance of hbar transfers for a spender relative to the owner account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the spender of the hbar allowance. |
| amount | [int64](#int64) |  | The amount of the spender's allowance in tinybars. |






<a name="proto-GrantedNftAllowance"></a>

### GrantedNftAllowance
A granted allowance for all the NFTs of a token for a spender relative to the owner account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The token that the allowance pertains to. |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the spender that has been granted access to all NFTs of the owner |






<a name="proto-GrantedTokenAllowance"></a>

### GrantedTokenAllowance
A granted allowance of fungible token transfers for a spender relative to the owner account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The token that the allowance pertains to. |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the token allowance spender. |
| amount | [int64](#int64) |  | The amount of the spender's token allowance. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


