## Table of Contents

- [crypto_transfer.proto](#crypto_transfer-proto)
    - [CryptoTransferTransactionBody](#proto-CryptoTransferTransactionBody)
  



<a name="crypto_transfer-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_transfer.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoTransferTransactionBody"></a>

### CryptoTransferTransactionBody
Transfers cryptocurrency among two or more accounts by making the desired adjustments to their
balances. Each transfer list can specify up to 10 adjustments. Each negative amount is withdrawn
from the corresponding account (a sender), and each positive one is added to the corresponding
account (a receiver). The amounts list must sum to zero. Each amount is a number of tinybars
(there are 100,000,000 tinybars in one hbar).  If any sender account fails to have sufficient
hbars, then the entire transaction fails, and none of those transfers occur, though the
transaction fee is still charged. This transaction must be signed by the keys for all the sending
accounts, and for any receiving accounts that have receiverSigRequired == true. The signatures
are in the same order as the accounts, skipping those accounts that don't need a signature.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transfers | [TransferList](#proto-TransferList) |  | The desired hbar balance adjustments |
| tokenTransfers | [TokenTransferList](#proto-TokenTransferList) | repeated | The desired token unit balance adjustments; if any custom fees are assessed, the ledger will try to deduct them from the payer of this CryptoTransfer, resolving the transaction to INSUFFICIENT_PAYER_BALANCE_FOR_CUSTOM_FEE if this is not possible |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


