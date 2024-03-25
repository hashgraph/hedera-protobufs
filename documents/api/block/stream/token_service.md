## Table of Contents

- [stream/token_service.proto](#stream_token_service-proto)
    - [BurnTokenFungibleCommonOutput](#proto-BurnTokenFungibleCommonOutput)
    - [BurnTokenNonFungibleUniqueOutput](#proto-BurnTokenNonFungibleUniqueOutput)
    - [BurnTokenOutput](#proto-BurnTokenOutput)
    - [CreateTokenOutput](#proto-CreateTokenOutput)
    - [MintTokenFungibleCommonOutput](#proto-MintTokenFungibleCommonOutput)
    - [MintTokenNonFungibleUniqueOutput](#proto-MintTokenNonFungibleUniqueOutput)
    - [MintTokenOutput](#proto-MintTokenOutput)
    - [WipeTokenAccountFungibleCommonOutput](#proto-WipeTokenAccountFungibleCommonOutput)
    - [WipeTokenAccountNonFungibleUniqueOutput](#proto-WipeTokenAccountNonFungibleUniqueOutput)
    - [WipeTokenAccountOutput](#proto-WipeTokenAccountOutput)
  



<a name="stream_token_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/token_service.proto
# Token Service
Block stream messages that report the results of transactions handled by the `Token` service.

<blockquote>REVIEW NOTE<blockquote>
There are several items split to fungible/non-fungible which are identical in content.
They are even identical across multiple transactions. Should we replace those with an uint64?
We could remove roughly a half-dozen unnecessary messages and also avoid creating
a sub-optimal pattern which would add perhaps a dozen more, most of which are just wrapping
a single (required) integer.</blockquote></blockquote>

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-BurnTokenFungibleCommonOutput"></a>

### BurnTokenFungibleCommonOutput
Block Stream data for a `burnToken` transaction for a fungible/common token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The current total supply of this token. |






<a name="proto-BurnTokenNonFungibleUniqueOutput"></a>

### BurnTokenNonFungibleUniqueOutput
Block Stream data for a `burnToken` transaction for a non-fungible/unique token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The total number of NFTs issued for a given token_id. |






<a name="proto-BurnTokenOutput"></a>

### BurnTokenOutput
Block Stream data for a `burnToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_burn_fungible_common_output | [BurnTokenFungibleCommonOutput](#proto-BurnTokenFungibleCommonOutput) |  |  |
| token_burn_non_fungible_unique_output | [BurnTokenNonFungibleUniqueOutput](#proto-BurnTokenNonFungibleUniqueOutput) |  |  |






<a name="proto-CreateTokenOutput"></a>

### CreateTokenOutput
Block Stream data for a `createToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The id of the newly created token. |






<a name="proto-MintTokenFungibleCommonOutput"></a>

### MintTokenFungibleCommonOutput
Block Stream data for a `mintToken` transaction for a fungible/common token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The current total supply of this token. |






<a name="proto-MintTokenNonFungibleUniqueOutput"></a>

### MintTokenNonFungibleUniqueOutput
Block Stream data for a `mintToken` transaction for a non-fungible/unique token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The total number of NFTs issued for a given token_id. |
| serial_numbers | [uint64](#uint64) | repeated | The serial numbers of the newly created NFTs. |






<a name="proto-MintTokenOutput"></a>

### MintTokenOutput
Block Stream data for a `mintToken` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_mint_fungible_common_output | [MintTokenFungibleCommonOutput](#proto-MintTokenFungibleCommonOutput) |  |  |
| token_mint_non_fungible_unique_output | [MintTokenNonFungibleUniqueOutput](#proto-MintTokenNonFungibleUniqueOutput) |  |  |






<a name="proto-WipeTokenAccountFungibleCommonOutput"></a>

### WipeTokenAccountFungibleCommonOutput
Block Stream data for a `wipeTokenAccount` transaction for a fungible/common token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The current total supply of this token. |






<a name="proto-WipeTokenAccountNonFungibleUniqueOutput"></a>

### WipeTokenAccountNonFungibleUniqueOutput
Block Stream data for a `wipeTokenAccount` transaction for a non-fungible/unique token.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| new_total_supply | [uint64](#uint64) |  | The total number of NFTs issued for a given token_id. |






<a name="proto-WipeTokenAccountOutput"></a>

### WipeTokenAccountOutput
Block Stream data for a `wipeTokenAccount` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_wipe_fungible_common_output | [WipeTokenAccountFungibleCommonOutput](#proto-WipeTokenAccountFungibleCommonOutput) |  |  |
| token_wipe_non_fungible_unique_output | [WipeTokenAccountNonFungibleUniqueOutput](#proto-WipeTokenAccountNonFungibleUniqueOutput) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



