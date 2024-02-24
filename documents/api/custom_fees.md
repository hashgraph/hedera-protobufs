## Table of Contents

- [custom_fees.proto](#custom_fees-proto)
    - [AssessedCustomFee](#proto-AssessedCustomFee)
    - [CustomFee](#proto-CustomFee)
    - [FixedFee](#proto-FixedFee)
    - [FractionalFee](#proto-FractionalFee)
    - [RoyaltyFee](#proto-RoyaltyFee)
  



<a name="custom_fees-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## custom_fees.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-AssessedCustomFee"></a>

### AssessedCustomFee
A custom transfer fee that was assessed during handling of a CryptoTransfer.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| amount | [int64](#int64) |  | The number of units assessed for the fee |
| token_id | [TokenID](#proto-TokenID) |  | The denomination of the fee; taken as hbar if left unset |
| fee_collector_account_id | [AccountID](#proto-AccountID) |  | The account to receive the assessed fee |
| effective_payer_account_id | [AccountID](#proto-AccountID) | repeated | The account(s) whose final balances would have been higher in the absence of this assessed fee |






<a name="proto-CustomFee"></a>

### CustomFee
A transfer fee to assess during a CryptoTransfer that transfers units of the token to which the
fee is attached. A custom fee may be either fixed or fractional, and must specify a fee collector
account to receive the assessed fees. Only positive fees may be assessed.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fixed_fee | [FixedFee](#proto-FixedFee) |  | Fixed fee to be charged |
| fractional_fee | [FractionalFee](#proto-FractionalFee) |  | Fractional fee to be charged |
| royalty_fee | [RoyaltyFee](#proto-RoyaltyFee) |  | Royalty fee to be charged |
| fee_collector_account_id | [AccountID](#proto-AccountID) |  | The account to receive the custom fee |
| all_collectors_are_exempt | [bool](#bool) |  | If true, exempts all the token's fee collection accounts from this fee. (The token's treasury and the above fee_collector_account_id will always be exempt. Please see <a href="https://hips.hedera.com/hip/hip-573">HIP-573</a> for details.) |






<a name="proto-FixedFee"></a>

### FixedFee
A fixed number of units (hbar or token) to assess as a fee during a CryptoTransfer that transfers
units of the token to which this fixed fee is attached.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| amount | [int64](#int64) |  | The number of units to assess as a fee |
| denominating_token_id | [TokenID](#proto-TokenID) |  | The denomination of the fee; taken as hbar if left unset and, in a TokenCreate, taken as the id of the newly created token if set to the sentinel value of 0.0.0 |






<a name="proto-FractionalFee"></a>

### FractionalFee
A fraction of the transferred units of a token to assess as a fee. The amount assessed will never
be less than the given minimum_amount, and never greater than the given maximum_amount.  The
denomination is always units of the token to which this fractional fee is attached.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fractional_amount | [Fraction](#proto-Fraction) |  | The fraction of the transferred units to assess as a fee |
| minimum_amount | [int64](#int64) |  | The minimum amount to assess |
| maximum_amount | [int64](#int64) |  | The maximum amount to assess (zero implies no maximum) |
| net_of_transfers | [bool](#bool) |  | If true, assesses the fee to the sender, so the receiver gets the full amount from the token transfer list, and the sender is charged an additional fee; if false, the receiver does NOT get the full amount, but only what is left over after paying the fractional fee |






<a name="proto-RoyaltyFee"></a>

### RoyaltyFee
A fee to assess during a CryptoTransfer that changes ownership of an NFT. Defines the fraction of
the fungible value exchanged for an NFT that the ledger should collect as a royalty. ("Fungible
value" includes both ℏ and units of fungible HTS tokens.) When the NFT sender does not receive
any fungible value, the ledger will assess the fallback fee, if present, to the new NFT owner.
Royalty fees can only be added to tokens of type type NON_FUNGIBLE_UNIQUE.

**IMPORTANT:** Users must understand that native royalty fees are _strictly_ a convenience feature,
and that the network cannot enforce inescapable royalties on the exchange of a non-fractional NFT.
For example, if the counterparties agree to split their value transfer and NFT exchange into separate
transactions, the network cannot possibly intervene. (And note the counterparties could use a smart
contract to make this split transaction atomic if they do not trust each other.)

Counterparties that _do_ wish to respect creator royalties should follow the pattern the network
recognizes: The NFT sender and receiver should both sign a single `CryptoTransfer` that credits
the sender with all the fungible value the receiver is exchanging for the NFT.

Similarly, a marketplace using an approved spender account for an escrow transaction should credit
the account selling the NFT in the same `CryptoTransfer` that deducts fungible value from the buying
account.

There is an [open HIP discussion](https://github.com/hashgraph/hedera-improvement-proposal/discussions/578)
that proposes to broaden the class of transactions for which the network automatically collects
royalties. If this interests or concerns you, please add your voice to that discussion.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| exchange_value_fraction | [Fraction](#proto-Fraction) |  | The fraction of fungible value exchanged for an NFT to collect as royalty |
| fallback_fee | [FixedFee](#proto-FixedFee) |  | If present, the fixed fee to assess to the NFT receiver when no fungible value is exchanged with the sender |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


