## Table of Contents

- [token_service.proto](#token_service-proto)
    - [TokenService](#proto-TokenService)
  



<a name="token_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-TokenService"></a>

### TokenService
Transactions and queries for the Token Service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Creates a new Token by submitting the transaction |
| updateToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates the account by submitting the transaction |
| mintToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Mints an amount of the token to the defined treasury account |
| burnToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Burns an amount of the token from the defined treasury account |
| deleteToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a Token |
| wipeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Wipes the provided amount of tokens from the specified Account ID |
| freezeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Freezes the transfer of tokens to or from the specified Account ID |
| unfreezeTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Unfreezes the transfer of tokens to or from the specified Account ID |
| grantKycToTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Flags the provided Account ID as having gone through KYC |
| revokeKycFromTokenAccount | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Removes the KYC flag of the provided Account ID |
| associateTokens | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Associates tokens to an account |
| dissociateTokens | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Dissociates tokens from an account |
| updateTokenFeeSchedule | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates the custom fee schedule on a token |
| getTokenInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the metadata of a token |
| getAccountNftInfos | [Query](#proto-Query) | [Response](#proto-Response) | (DEPRECATED) Gets info on NFTs N through M on the list of NFTs associated with a given account |
| getTokenNftInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the metadata of an NFT by TokenID and serial number |
| getTokenNftInfos | [Query](#proto-Query) | [Response](#proto-Response) | (DEPRECATED) Gets info on NFTs N through M on the list of NFTs associated with a given Token of type NON_FUNGIBLE |
| pauseToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Pause the token |
| unpauseToken | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Unpause the token |
| updateNfts | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates the NFTs in a collection by TokenID and serial number |

 <!-- end services -->


