## Table of Contents

- [crypto_get_account_balance.proto](#crypto_get_account_balance-proto)
    - [CryptoGetAccountBalanceQuery](#proto-CryptoGetAccountBalanceQuery)
    - [CryptoGetAccountBalanceResponse](#proto-CryptoGetAccountBalanceResponse)
  



<a name="crypto_get_account_balance-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_account_balance.proto
# Crypto Get Account Balance
Query request to obtain balance information for a single account.

This query SHOULD NOT be used by client software, queries to a
Mirror Node provide more information at much lower cost.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoGetAccountBalanceQuery"></a>

### CryptoGetAccountBalanceQuery
Query to read the HBAR balance of an account or contract.

This query SHALL return _only_ the HBAR balance for an account
or smart contract. Early releases of the network would return all
fungible/common token balances, but HIP-367 made it infeasible to
return all such balances. This query SHALL NOT return any information
beyond the current HBAR balance.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | An account identifier.<br/> This identifies an account for which the balance is requested. <p> Exactly one identifier MUST be provided. |
| contractID | [ContractID](#proto-ContractID) |  | A smart contract identifier.<br/> This identifies a smart contract for which the balance is requested. <p> Exactly one identifier MUST be provided. |






<a name="proto-CryptoGetAccountBalanceResponse"></a>

### CryptoGetAccountBalanceResponse
Response to a CryptoGetAccountBalanceQuery.<br/>

This response SHALL contain only the information needed to
identify the query request and the actual HBAR balance of the
identified account or contract.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | An account identifier.<br/> This is the account ID queried. <br/> The inclusion of the account queried is useful with state proofs, when needed to prove an account balance to a third party. |
| balance | [uint64](#uint64) |  | A current account balance.<br/> This is the current HBAR balance denominated in tinybar (10<sup>-8</sup> HBAR). |
| tokenBalances | [TokenBalance](#proto-TokenBalance) | repeated | **Deprecated.** This field became infeasible to support after HIP-367 removed limits on the number of associated tokens.<br/> A list of token balances for all tokens associated to the account. <p> This field was deprecated by <a href="https://hips.hedera.com/hip/hip-367">HIP-367</a>, which allowed an account to be associated to an unlimited number of tokens. This scale makes it more efficient for users to consult mirror nodes to review their token balances. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


