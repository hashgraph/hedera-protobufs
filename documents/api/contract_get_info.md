## Table of Contents

- [contract_get_info.proto](#contract_get_info-proto)
    - [ContractGetInfoQuery](#proto-ContractGetInfoQuery)
    - [ContractGetInfoResponse](#proto-ContractGetInfoResponse)
    - [ContractGetInfoResponse.ContractInfo](#proto-ContractGetInfoResponse-ContractInfo)
  



<a name="contract_get_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_get_info.proto
# Contract Get Info
A standard query to obtain detailed information about a smart contract.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractGetInfoQuery"></a>

### ContractGetInfoQuery
Request detailed information about a smart contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract ID.<br/> The network SHALL return information for this smart contract, if successful. |






<a name="proto-ContractGetInfoResponse"></a>

### ContractGetInfoResponse
Information returned in response to a "get info" query for a smart contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| contractInfo | [ContractGetInfoResponse.ContractInfo](#proto-ContractGetInfoResponse-ContractInfo) |  | The information, as requested, for a smart contract. A state proof MAY be generated for this value. |






<a name="proto-ContractGetInfoResponse-ContractInfo"></a>

### ContractGetInfoResponse.ContractInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The ID of the smart contract requested in the query. |
| accountID | [AccountID](#proto-AccountID) |  | The Account ID for the account entry associated with this smart contract. |
| contractAccountID | [string](#string) |  | The "Solidity" form contract and account ID value that refers to this smart contract. |
| adminKey | [Key](#proto-Key) |  | The key that MUST sign any transaction to update or modify this smart contract.<br/> If this value is null, or is an empty `KeyList` then the contract CANNOT be deleted, modified, or updated, but MAY still expire. |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The point in time at which this contract will expire. |
| autoRenewPeriod | [Duration](#proto-Duration) |  | The duration, in seconds, for which the contract lifetime will be automatically extended upon expiration, provide sufficient HBAR is available at that time to pay the renewal fee.<br/> See `auto_renew_account_id` for additional conditions. |
| storage | [int64](#int64) |  | The amount of storage used by this smart contract. |
| memo | [string](#string) |  | A short description of this smart contract.<br/> This value, if set, SHALL be encoded UTF-8 and SHALL NOT exceed 100 bytes when so encoded. |
| balance | [uint64](#uint64) |  | The current HBAR balance, in tinybar, of the smart contract account. |
| deleted | [bool](#bool) |  | A flag indicating that this contract is deleted. |
| tokenRelationships | [TokenRelationship](#proto-TokenRelationship) | repeated | **Deprecated.** Because <a href="https://hips.hedera.com/hip/hip-367">HIP-367</a>, which allows an account to be associated to an unlimited number of tokens, it became necessary to only provide this information from a Mirror Node.<br/> The list of tokens associated to this contract. |
| ledger_id | [bytes](#bytes) |  | The ledger ID of the network that generated this response.<br/> This is originally defined in HIP-198 and depends on network configuration.<br/> The current values, as of Q1 2024, are <dl> <dt>Mainnet</dt><dd>0x00</dd> <dt>Testnet</dt><dd>0x01</dd> <dt>Previewnet</dt><dd>0x02</dd> <dt>Undefined</dt><dd>0x03</dd> <dt>Reserved</dt><dd>0x04</dd> </dl> |
| auto_renew_account_id | [AccountID](#proto-AccountID) |  | An account designated to pay the renewal fee upon automatic renewal of this contract.<br/> If this is not set, or is set to an account with zero HBAR available, the HBAR balance of the contract, if available, SHALL be used to pay the renewal fee. |
| max_automatic_token_associations | [int32](#int32) |  | The maximum number of tokens that the contract can be associated to automatically. |
| staking_info | [StakingInfo](#proto-StakingInfo) |  | Staking information for this contract. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


