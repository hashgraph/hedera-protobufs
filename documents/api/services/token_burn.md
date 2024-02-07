## Table of Contents

- [token_burn.proto](#token_burn-proto)
    - [TokenBurnTransactionBody](#proto-TokenBurnTransactionBody)
  



<a name="token_burn-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_burn.proto
# Token Burn
Permanently remove tokens from circulation, akin to how a fiat treasury
will physically burn worn out bank notes.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenBurnTransactionBody"></a>

### TokenBurnTransactionBody
Burns tokens from the Token's treasury Account.

The token MUST have a `supply_key` set and that key MUST NOT
be an empty `KeyList`.<br/>
The token `supply_key` MUST sign this transaction.<br/>
This operation SHALL decrease the total supply for the token type by
the number of tokens "burned".<br/>
The total supply for the token type MUST NOT be reduced below zero (`0`)
by this transaction.<br/>
The tokens to burn SHALL be deducted from the token treasury account.<br/>
If the token is a fungible/common type, the amount MUST be specified.<br/>
If the token is a non-fungible/unique type, the specific serial numbers
MUST be specified.<br/>
The global batch size limit (`tokens.nfts.maxBatchSizeBurn`) SHALL set
the maximum number of individual NFT serial numbers permitted in a single
`tokenBurn` transaction.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | A token identifier. <p> This SHALL identify the token type to "burn".<br/> The identified token MUST exist, and MUST NOT be deleted. |
| amount | [uint64](#uint64) |  | An amount to burn from the Treasury Account. <p> This is interpreted as an amount in the smallest possible denomination for the token (10<sup>-decimals</sup> whole tokens).<br/> The balance for the token treasury account MUST contain sufficient tokens to complete this transaction with a non-negative balance.<br/> If this value is equal to zero (`0`), the token SHOULD be a non-fungible/unique type.<br/> If this value is non-zero, the token MUST be a fungible/common type. |
| serialNumbers | [int64](#int64) | repeated | A list of serial numbers to burn from the Treasury Account. <p> This list MUST NOT contain more entries than the current limit set by the network configuration value `tokens.nfts.maxBatchSizeBurn`.<br/> The treasury account for the token MUST hold each unique token identified in this list.<br/> If this list is not empty, the token MUST be a non-fungible/unique type.<br/> If this list is empty, the token MUST be a fungible/common type. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



