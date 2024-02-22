## Table of Contents

- [crypto_delete_allowance.proto](#crypto_delete_allowance-proto)
    - [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody)
    - [NftRemoveAllowance](#proto-NftRemoveAllowance)
  



<a name="crypto_delete_allowance-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete_allowance.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoDeleteAllowanceTransactionBody"></a>

### CryptoDeleteAllowanceTransactionBody
Deletes one or more non-fungible approved allowances from an owner's account. This operation
will remove the allowances granted to one or more specific non-fungible token serial numbers. Each owner account
listed as wiping an allowance must sign the transaction. Hbar and fungible token allowances
can be removed by setting the amount to zero in CryptoApproveAllowance.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nftAllowances | [NftRemoveAllowance](#proto-NftRemoveAllowance) | repeated | List of non-fungible token allowances to remove. |






<a name="proto-NftRemoveAllowance"></a>

### NftRemoveAllowance
Nft allowances to be removed on an owner account


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The token that the allowance pertains to. |
| owner | [AccountID](#proto-AccountID) |  | The account ID of the token owner (ie. the grantor of the allowance). |
| serial_numbers | [int64](#int64) | repeated | The list of serial numbers to remove allowances from. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


