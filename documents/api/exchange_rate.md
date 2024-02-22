## Table of Contents

- [exchange_rate.proto](#exchange_rate-proto)
    - [ExchangeRate](#proto-ExchangeRate)
    - [ExchangeRateSet](#proto-ExchangeRateSet)
  



<a name="exchange_rate-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## exchange_rate.proto
# Exchange Rates
Exchange rates that define ratios between HBAR and USD.<br/>
Fees are denominated in USD, but paid in HBAR, so accurate exchange rates are important and
the exchange rates kept in state are updated frequently.<br/>
Exchange rates are also reported in every receipt for fee transparency.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ExchangeRate"></a>

### ExchangeRate
An exchange rate as a ratio of USD cents per HBAR.

This ratio SHALL be used to convert tinycent (<tt>10<sup>-8</sup></tt> USD cent) to
tinybar for fees and other purposes.<br/>
When applying an `ExchangeRate`, implementations SHOULD ensure input values are `tinycent`
and/or `tinybar` before applying the exchange ratio. Exchange results MAY be converted
to USD or HBAR via division if whole unit values are required.

The ratio described here SHALL be assigned such that a value in `tinybar` may be obtained with
the following equation.
```
  amountInTinybar = (amountInTinycent * hbarEquiv) / centEquiv
```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hbarEquiv | [int32](#int32) |  | Denominator for a ratio of USD cents per HBAR. |
| centEquiv | [int32](#int32) |  | Numerator for a ratio of USD cents per HBAR. |
| expirationTime | [TimestampSeconds](#proto-TimestampSeconds) |  | Expiration time stamp for this exchange rate. |






<a name="proto-ExchangeRateSet"></a>

### ExchangeRateSet
A set of two exchange rates.

The exchange rate for the network SHALL be stored and reported as a set of two rates;
current and next. This structure supports the network cleanly switching between exchange
rates when necessary. This also provides clear notice to clients when the exchange rate
rate will change and the exchange rate that will be applied for the next time period.

The difference in rate between `currentRate` and `nextRate` MUST NOT exceed the configured
maximum percentage change. This limit SHALL be a network configuration value.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| currentRate | [ExchangeRate](#proto-ExchangeRate) |  | A current exchange rate.<br/> When present in a receipt, this SHALL be the exchange rate used to compute the fees for that transaction. |
| nextRate | [ExchangeRate](#proto-ExchangeRate) |  | A future exchange rate.<br/> This exchange rate SHALL be applied after the current exchange rate expires. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


