# Hedera protobufs
The authoritative repository of [protocol buffers](https://developers.google.com/protocol-buffers) 
used by the Hedera Hashgraph public network, especially to define its gRPC API. Other repositories 
are used to deploy language-specific libraries generated 
from the _*.proto_ files in this repository:
 - [Java](https://github.com/hashgraph/hedera-protobufs-java)

# Overview of services

There are five primary service families, which inter-operate on entities 
controlled by one (or more) Ed25519 keypairs:
1. The [cryptocurrency service](services/crypto_service.proto),
for cryptocurrency accounts with transfers denominated 
in [hBar (ℏ)](https://help.hedera.com/hc/en-us/articles/360000674317-What-are-the-official-HBAR-cryptocurrency-denominations-).
2. The [consensus service](services/consensus_service.proto), for
fast and unbiased ordering of opaque binary messages exchanged on 
arbitrary topics.
3. The [smart contract service](services/smart_contract_service.proto), for
execution of Solidity contract creations and calls; contract may both possess
ℏ themselves and exchange it with non-contract accounts.
4. The [file service](services/file_service.proto), for storage and 
retrieval of opaque binary data.
5. The [token service](services/token_service.proto), for token related operations such as create, update, mint, burn, transfer etc.

There are also four secondary service families:
1. The [network service](services/network_service.proto), for operations scoped
to the network or its constituent nodes rather user-controlled entities as above.
2. The [scheduling service](services/schedule_service.proto), for scheduling a transaction to 
be executed when the ledger has received enough prequisite signatures. 
3. The [freeze service](services/freeze_service.proto), for use by 
privileged accounts to suspend network operations during a maintenance window.
4. The [util service](services/util_service.proto), for utility operations on the network.

It is important to note that most network services are gated by fees which 
must be paid in ℏ from a cryptocurrency account. The payer authorizes a
fee by signing an appropriate transaction with a sufficient subset of the 
Ed25519 key(s) associated to their account.

# Branching
This repository uses a simple branching model with only two distinguished branches:
 1. The head of `main` points to the latest protobufs blessed for deployment to mainnet. 
Tags such as `v0.12.0` mark commits used for testnet and mainnet deploys.
 2. The head of `develop` points to the latest candidate for the next tag in `main`. 
Tags suffixed with `-alpha.x` mark commits used for previewnet deploys. 
