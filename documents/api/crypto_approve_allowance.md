## Table of Contents

- [crypto_approve_allowance.proto](#crypto_approve_allowance-proto)
    - [CryptoAllowance](#proto-CryptoAllowance)
    - [CryptoApproveAllowanceTransactionBody](#proto-CryptoApproveAllowanceTransactionBody)
    - [NftAllowance](#proto-NftAllowance)
    - [TokenAllowance](#proto-TokenAllowance)
  



<a name="crypto_approve_allowance-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_approve_allowance.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoAllowance"></a>

### CryptoAllowance
An approved allowance of hbar transfers for a spender.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| owner | [AccountID](#proto-AccountID) |  | The account ID of the hbar owner (ie. the grantor of the allowance). |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the spender of the hbar allowance. |
| amount | [int64](#int64) |  | The amount of the spender's allowance in tinybars. |






<a name="proto-CryptoApproveAllowanceTransactionBody"></a>

### CryptoApproveAllowanceTransactionBody
Creates one or more hbar/token approved allowances <b>relative to the owner account specified in the allowances of
this transaction</b>. Each allowance grants a spender the right to transfer a pre-determined amount of the owner's
hbar/token to any other account of the spender's choice. If the owner is not specified in any allowance, the payer
of transaction is considered to be the owner for that particular allowance.
Setting the amount to zero in CryptoAllowance or TokenAllowance will remove the respective allowance for the spender.

(So if account <tt>0.0.X</tt> pays for this transaction and owner is not specified in the allowance,
then at consensus each spender account will have new allowances to spend hbar or tokens from <tt>0.0.X</tt>).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| cryptoAllowances | [CryptoAllowance](#proto-CryptoAllowance) | repeated | List of hbar allowances approved by the account owner. |
| nftAllowances | [NftAllowance](#proto-NftAllowance) | repeated | List of non-fungible token allowances approved by the account owner. |
| tokenAllowances | [TokenAllowance](#proto-TokenAllowance) | repeated | List of fungible token allowances approved by the account owner. |






<a name="proto-NftAllowance"></a>

### NftAllowance
An approved allowance of non-fungible token transfers for a spender.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | The NFT token type that the allowance pertains to. |
| owner | [AccountID](#proto-AccountID) |  | The account ID of the token owner (ie. the grantor of the allowance). |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the token allowance spender. |
| serial_numbers | [int64](#int64) | repeated | The list of serial numbers that the spender is permitted to transfer. |
| approved_for_all | [google.protobuf.BoolValue](#google-protobuf-BoolValue) |  | If true, the spender has access to all of the owner's NFT units of type tokenId (currently owned and any in the future). |
| delegating_spender | [AccountID](#proto-AccountID) |  | The account ID of the spender who is granted approvedForAll allowance and granting approval on an NFT serial to another spender. |






<a name="proto-TokenAllowance"></a>

### TokenAllowance
An approved allowance of fungible token transfers for a spender.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tokenId | [TokenID](#proto-TokenID) |  | The token that the allowance pertains to. |
| owner | [AccountID](#proto-AccountID) |  | The account ID of the token owner (ie. the grantor of the allowance). |
| spender | [AccountID](#proto-AccountID) |  | The account ID of the token allowance spender. |
| amount | [int64](#int64) |  | The amount of the spender's token allowance. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


