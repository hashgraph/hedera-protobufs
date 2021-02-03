# Hedera protobufs
The authoritative repository of [protocol buffers](https://developers.google.com/protocol-buffers) 
used by the Hedera Hashgraph public network, especially to define its gRPC API. Other repositories 
are used to deploy language-specific libraries generated 
from the contents of the _proto/_ directory in this repository, as follows:
 - [Java](https://github.com/hashgraph/hedera-protobufs-java)

# Overview of services

There are four primary service families, which inter-operate on entities 
controlled by one (or more) Ed25519 keypairs:
1. The [cryptocurrency service](hedera/CryptoService.proto),
for cryptocurrency accounts with transfers denominated 
in [hBar (ℏ)](https://help.hedera.com/hc/en-us/articles/360000674317-What-are-the-official-HBAR-cryptocurrency-denominations-).
2. The [consensus service](hedera/ConsensusService.proto), for
fast and unbiased ordering of opaque binary messages exchanged on 
arbitrary topics.
3. The [smart contract service](hedera/SmartContractService.proto), for
execution of Solidity contract creations and calls; contract may both possess
ℏ themselves and exchange it with non-contract accounts.
4. The [file service](hedera/FileService.proto), for storage and 
retrieval of opaque binary data.
5. The [token service](hedera/TokenService.proto), for token related operations such as create, update, mint, burn, transfer etc.. 

There are also two secondary service families:
1. The [network service](hedera/NetworkService.proto), for operations scoped
to the network or its constituent nodes rather user-controlled entities as above.
2. The [freeze service](hedera/FreezeService.proto), for use by 
privileged accounts to suspend network operations during a maintenance window.

It is important to note that most network services are gated by fees which 
must be paid in ℏ from a cryptocurrency account. The payer authorizes a
fee by signing an appropriate transaction with a sufficient subset of the 
Ed25519 key(s) associated to their account.

# Branching
This repository uses a simple branching model with only two distinguished branches:
 1. The head of `main` points to the latest protobufs blessed for deployment to mainnet. (Tags mark deployed versions )
 2. The head of `develop` points to the latest candidate for the next tag in `main`. 
