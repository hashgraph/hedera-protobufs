## Table of Contents

- [crypto_delete_allowance.proto](#crypto_delete_allowance-proto)
    - [CryptoDeleteAllowanceTransactionBody](#proto-CryptoDeleteAllowanceTransactionBody)
    - [NftRemoveAllowance](#proto-NftRemoveAllowance)
  



<a name="crypto_delete_allowance-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete_allowance.proto
# Crypto Delete Allowance
Delete one or more NFT allowances that permit transfer of tokens from
an "owner" account by a different, "spender", account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoDeleteAllowanceTransactionBody"></a>

### CryptoDeleteAllowanceTransactionBody
Delete one or more allowances.<br/>
Given one or more, previously approved, allowances for non-fungible/unique
tokens to be transferred by a spending account from an owning account;
this transaction removes a specified set of those allowances.

The owner account for each listed allowance MUST sign this transaction.<br/>
Allowances for HBAR cannot be removed with this transaction. The owner
account MUST submit a new `cryptoApproveAllowance` transaction with the
amount set to `0` to "remove" that allowance.<br/>
Allowances for fungible/common tokens cannot be removed with this
transaction. The owner account MUST submit a new `cryptoApproveAllowance`
transaction with the amount set to `0` to "remove" that allowance.<br/>

### Record Stream Effects
???


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nftAllowances | [NftRemoveAllowance](#proto-NftRemoveAllowance) | repeated | List of non-fungible/unique token allowances to remove. <p> This list MUST NOT be empty. |






<a name="proto-NftRemoveAllowance"></a>

### NftRemoveAllowance
A single allowance for one non-fungible/unique token.
This is specific to removal, and the allowance is identified for that
specific purpose.

All fields in this message are REQUIRED.
The `serial_numbers` list MUST NOT be empty.
The combination of field values in this message MUST match existing
allowances for one or more individual non-fungible/unique tokens.

> REVIEW NOTE
>> How does one remove an `approve_for_all` allowance?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | A token identifier. <p> This MUST be a valid token identifier for a non-fungible/unique token type. |
| owner | [AccountID](#proto-AccountID) |  | An `owner` account identifier. <p> This account MUST sign the transaction containing this message. |
| serial_numbers | [int64](#int64) | repeated | The list of serial numbers to remove allowances from. <p> This list MUST NOT be empty. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


