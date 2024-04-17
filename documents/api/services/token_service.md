## Table of Contents

- [token_service.proto](#token_service-proto)
    - [TokenService](#proto-TokenService)
  



<a name="token_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_service.proto
# Token Service
gRPC definitions for token service transactions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-TokenService"></a>

### TokenService
Transactions and queries for the Token Service

The following queries are permanently removed
getAccountNftInfos, getTokenNftInfos

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Create a new token. |
| updateToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Update a token. |
| mintToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Mint one or more tokens to the treasury account. <p> This MAY specify a quantity of fungible/common tokens or a list of specific non-fungible/unique tokes, but MUST NOT specify both. |
| burnToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Burn one or more tokens from the treasury account. <p> This MAY specify a quantity of fungible/common tokens or a list of specific non-fungible/unique tokes, but MUST NOT specify both. |
| deleteToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Delete a token. |
| wipeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Wipe one or more tokens from an identified Account. <p> This MAY specify a quantity of fungible/common tokens or a list of specific non-fungible/unique tokes, but MUST NOT specify both. |
| freezeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Freeze the transfer of tokens to or from an identified Account. |
| unfreezeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Unfreeze the transfer of tokens to or from an identified Account. |
| grantKycToTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Assert that KYC requirements are met for a specific account with respect to a specific token. |
| revokeKycFromTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Assert that KYC requirements are _not_ met for a specific account with respect to a specific token. |
| associateTokens | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Associate one or more tokens to an account. |
| dissociateTokens | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Dissociate one or more tokens from an account. |
| updateTokenFeeSchedule | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Update the custom fee schedule for a token. |
| getTokenInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the detail characteristics for a token. <p> This query SHALL return information for the token type as a whole.<br/> This query SHALL NOT return information for individual tokens. |
| getTokenNftInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the metadata for a specific non-fungible/unique token.<br/> The NFT to query is identified by token identifier and serial number. <p> This query SHALL return token metadata and, if an allowance is defined, the designated "spender" account for the queried NFT. |
| pauseToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Pause a token. |
| unpauseToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Unpause (resume) a token. |
| updateNfts | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Update multiple non-fungible/unique tokens (NFTs) in a collection.<br/> The NFTs are identified by token identifier and one or more serial numbers. <p> This transaction SHALL update NFT metadata only.<br/> This transaction MUST be signed by the token `metadata_key`. |

 <!-- end services -->


