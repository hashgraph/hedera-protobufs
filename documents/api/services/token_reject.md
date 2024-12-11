## Table of Contents

- [token_reject.proto](#token_reject-proto)
    - [TokenReference](#proto-TokenReference)
    - [TokenRejectTransactionBody](#proto-TokenRejectTransactionBody)
  



<a name="token_reject-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_reject.proto
# Token Reject
Messages used to implement a transaction to reject a token type from an
account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenReference"></a>

### TokenReference
A union token identifier.

Identify a fungible/common token type, or a single
non-fungible/unique token serial.


| Field | Type | Description |
| ----- | ---- | ----------- |
| fungible_token | [TokenID](#proto-TokenID) | A fungible/common token type. |
| nft | [NftID](#proto-NftID) | A single specific serialized non-fungible/unique token. |






<a name="proto-TokenRejectTransactionBody"></a>

### TokenRejectTransactionBody
Reject undesired token(s).<br/>
Transfer one or more token balances held by the requesting account to the
treasury for each token type.

Each transfer SHALL be one of the following
- A single non-fungible/unique token.
- The full balance held for a fungible/common token.
A single `tokenReject` transaction SHALL support a maximum
of 10 transfers.<br/>
A token that is `pause`d MUST NOT be rejected.<br/>
If the `owner` account is `frozen` with respect to the identified token(s)
the token(s) MUST NOT be rejected.<br/>
The `payer` for this transaction, and `owner` if set, SHALL NOT be charged
any custom fees or other fees beyond the `tokenReject` transaction fee.

### Block Stream Effects
- Each successful transfer from `payer` to `treasury` SHALL be recorded in
  the `token_transfer_list` for the transaction record.


| Field | Type | Description |
| ----- | ---- | ----------- |
| owner | [AccountID](#proto-AccountID) | An account identifier.<br/> This OPTIONAL field identifies the account holding the tokens to be rejected. <p> If set, this account MUST sign this transaction. If not set, the `payer` for this transaction SHALL be the effective `owner` for this transaction. |
| rejections | [TokenReference](#proto-TokenReference) | A list of one or more token rejections. <p> On success each rejected token serial number or balance SHALL be transferred from the requesting account to the treasury account for that token type.<br/> After rejection the requesting account SHALL continue to be associated with the token.<br/> If dissociation is desired then a separate `TokenDissociate` transaction MUST be submitted to remove the association.<br/> This list MUST contain at least one (1) entry and MUST NOT contain more than ten (10) entries. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



