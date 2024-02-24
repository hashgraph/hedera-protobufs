## Table of Contents

- [crypto_get_info.proto](#crypto_get_info-proto)
    - [CryptoGetInfoQuery](#proto-CryptoGetInfoQuery)
    - [CryptoGetInfoResponse](#proto-CryptoGetInfoResponse)
    - [CryptoGetInfoResponse.AccountInfo](#proto-CryptoGetInfoResponse-AccountInfo)
  



<a name="crypto_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoGetInfoQuery"></a>

### CryptoGetInfoQuery
Get all the information about an account, including the balance. This does not get the list of
account records.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The account ID for which information is requested |






<a name="proto-CryptoGetInfoResponse"></a>

### CryptoGetInfoResponse
Response when the client sends the node CryptoGetInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | Standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| accountInfo | [CryptoGetInfoResponse.AccountInfo](#proto-CryptoGetInfoResponse-AccountInfo) |  | Info about the account (a state proof can be generated for this) |






<a name="proto-CryptoGetInfoResponse-AccountInfo"></a>

### CryptoGetInfoResponse.AccountInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accountID | [AccountID](#proto-AccountID) |  | The account ID for which this information applies |
| contractAccountID | [string](#string) |  | The Contract Account ID comprising of both the contract instance and the cryptocurrency account owned by the contract instance, in the format used by Solidity |
| deleted | [bool](#bool) |  | If true, then this account has been deleted, it will disappear when it expires, and all transactions for it will fail except the transaction to extend its expiration date |
| proxyAccountID | [AccountID](#proto-AccountID) |  | **Deprecated.** [Deprecated] The Account ID of the account to which this is proxy staked. If proxyAccountID is null, or is an invalid account, or is an account that isn't a node, then this account is automatically proxy staked to a node chosen by the network, but without earning payments. If the proxyAccountID account refuses to accept proxy staking , or if it is not currently running a node, then it will behave as if proxyAccountID was null. |
| proxyReceived | [int64](#int64) |  | The total number of tinybars proxy staked to this account |
| key | [Key](#proto-Key) |  | The key for the account, which must sign in order to transfer out, or to modify the account in any way other than extending its expiration date. |
| balance | [uint64](#uint64) |  | The current balance of account in tinybars |
| generateSendRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The threshold amount, in tinybars, at which a record is created of any transaction that decreases the balance of this account by more than the threshold |
| generateReceiveRecordThreshold | [uint64](#uint64) |  | **Deprecated.** [Deprecated]. The threshold amount, in tinybars, at which a record is created of any transaction that increases the balance of this account by more than the threshold |
| receiverSigRequired | [bool](#bool) |  | If true, no transaction can transfer to this account unless signed by this account's key |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The TimeStamp time at which this account is set to expire |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The duration for expiration time will extend every this many seconds. If there are insufficient funds, then it extends as long as possible. If it is empty when it expires, then it is deleted. |
| liveHashes | [LiveHash](#proto-LiveHash) | repeated | All of the livehashes attached to the account (each of which is a hash along with the keys that authorized it and can delete it) |
| tokenRelationships | [TokenRelationship](#proto-TokenRelationship) | repeated | **Deprecated.** [DEPRECATED] The metadata of the tokens associated to the account. This field was deprecated by <a href="https://hips.hedera.com/hip/hip-367">HIP-367</a>, which allowed an account to be associated to an unlimited number of tokens. This scale makes it more efficient for users to consult mirror nodes to review their token associations. |
| memo | [string](#string) |  | The memo associated with the account |
| ownedNfts | [int64](#int64) |  | The number of NFTs owned by this account |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that an Account can be implicitly associated with. |
| alias | [bytes](#bytes) |  | The alias of this account |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| ethereum_nonce | [int64](#int64) |  | The ethereum transaction nonce associated with this account. |
| staking_info | [StakingInfo](#proto-StakingInfo) |  | Staking metadata for this account. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


