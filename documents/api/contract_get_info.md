## Table of Contents

- [contract_get_info.proto](#contract_get_info-proto)
    - [ContractGetInfoQuery](#proto-ContractGetInfoQuery)
    - [ContractGetInfoResponse](#proto-ContractGetInfoResponse)
    - [ContractGetInfoResponse.ContractInfo](#proto-ContractGetInfoResponse-ContractInfo)
  



<a name="contract_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_info.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetInfoQuery"></a>

### ContractGetInfoQuery
Get information about a smart contract instance. This includes the account that it uses, the file
containing its initcode (if a file was used to initialize the contract), and the time when it will expire.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | standard info sent from client to node, including the signed payment, and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | the contract for which information is requested |






<a name="proto-ContractGetInfoResponse"></a>

### ContractGetInfoResponse
Response when the client sends the node ContractGetInfoQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | standard response from node to client, including the requested fields: cost, or state proof, or both, or neither |
| contractInfo | [ContractGetInfoResponse.ContractInfo](#proto-ContractGetInfoResponse-ContractInfo) |  | the information about this contract instance (a state proof can be generated for this) |






<a name="proto-ContractGetInfoResponse-ContractInfo"></a>

### ContractGetInfoResponse.ContractInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | ID of the contract instance, in the format used in transactions |
| accountID | [AccountID](#proto-AccountID) |  | ID of the cryptocurrency account owned by the contract instance, in the format used in transactions |
| contractAccountID | [string](#string) |  | ID of both the contract instance and the cryptocurrency account owned by the contract instance, in the format used by Solidity |
| adminKey | [Key](#proto-Key) |  | the state of the instance and its fields can be modified arbitrarily if this key signs a transaction to modify it. If this is null, then such modifications are not possible, and there is no administrator that can override the normal operation of this smart contract instance. Note that if it is created with no admin keys, then there is no administrator to authorize changing the admin keys, so there can never be any admin keys for that instance. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | the current time at which this contract instance (and its account) is set to expire |
| autoRenewPeriod | [Duration](#proto-Duration) |  | the expiration time will extend every this many seconds. If there are insufficient funds, then it extends as long as possible. If the account is empty when it expires, then it is deleted. |
| storage | [int64](#int64) |  | number of bytes of storage being used by this instance (which affects the cost to extend the expiration time) |
| memo | [string](#string) |  | the memo associated with the contract (max 100 bytes) |
| balance | [uint64](#uint64) |  | The current balance, in tinybars |
| deleted | [bool](#bool) |  | Whether the contract has been deleted |
| tokenRelationships | [TokenRelationship](#proto-TokenRelationship) | repeated | **Deprecated.** [DEPRECATED] The metadata of the tokens associated to the contract. This field was deprecated by <a href="https://hips.hedera.com/hip/hip-367">HIP-367</a>, which allowed an account to be associated to an unlimited number of tokens. This scale makes it more efficient for users to consult mirror nodes to review their token associations. |
| ledger_id | [bytes](#bytes) |  | The ledger ID the response was returned from; please see <a href="https://github.com/hashgraph/hedera-improvement-proposal/blob/master/HIP/hip-198.md">HIP-198</a> for the network-specific IDs. |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | ID of the an account to charge for auto-renewal of this contract. If not set, or set to an account with zero hbar balance, the contract's own hbar balance will be used to cover auto-renewal fees. |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that a contract can be implicitly associated with. |
| staking_info | [StakingInfo](#proto-StakingInfo) |  | Staking metadata for this contract. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


