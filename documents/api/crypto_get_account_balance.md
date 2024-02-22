## Table of Contents

- [crypto_get_account_balance.proto](#crypto_get_account_balance-proto)
    - [CryptoGetAccountBalanceQuery](#proto-CryptoGetAccountBalanceQuery)
    - [CryptoGetAccountBalanceResponse](#proto-CryptoGetAccountBalanceResponse)
  



<a name="crypto_get_account_balance-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_account_balance.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoGetAccountBalanceQuery"></a>

### CryptoGetAccountBalanceQuery
Get the balance of a cryptocurrency account. This returns only the balance, so it is a smaller
reply than CryptoGetInfo, which returns the balance plus additional information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The account ID for which information is requested |
| contractID | [ContractID](#proto-ContractID) |  | The account ID for which information is requested |






<a name="proto-CryptoGetAccountBalanceResponse"></a>

### CryptoGetAccountBalanceResponse
Response when the client sends the node CryptoGetAccountBalanceQuery


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| accountID | [AccountID](#proto-AccountID) |  | The account ID that is being described (this is useful with state proofs, for proving to a third party) |
| balance | [uint64](#uint64) |  | The current balance, in tinybars. |
| tokenBalances | [TokenBalance](#proto-TokenBalance) | repeated | **Deprecated.** [DEPRECATED] The balances of the tokens associated to the account. This field was deprecated by <a href="https://hips.hedera.com/hip/hip-367">HIP-367</a>, which allowed an account to be associated to an unlimited number of tokens. This scale makes it more efficient for users to consult mirror nodes to review their token balances. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


