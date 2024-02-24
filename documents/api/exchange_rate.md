## Table of Contents

- [exchange_rate.proto](#exchange_rate-proto)
    - [ExchangeRate](#proto-ExchangeRate)
    - [ExchangeRateSet](#proto-ExchangeRateSet)
  



<a name="exchange_rate-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## exchange_rate.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ExchangeRate"></a>

### ExchangeRate
An exchange rate between hbar and cents (USD) and the time at which the exchange rate will
expire, and be superseded by a new exchange rate.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hbarEquiv | [int32](#int32) |  | Denominator in calculation of exchange rate between hbar and cents |
| centEquiv | [int32](#int32) |  | Numerator in calculation of exchange rate between hbar and cents |
| expirationTime | [TimestampSeconds](#proto-TimestampSeconds) |  | Expiration time in seconds for this exchange rate |






<a name="proto-ExchangeRateSet"></a>

### ExchangeRateSet
Two sets of exchange rates


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| currentRate | [ExchangeRate](#proto-ExchangeRate) |  | Current exchange rate |
| nextRate | [ExchangeRate](#proto-ExchangeRate) |  | Next exchange rate which will take effect when current rate expires |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


