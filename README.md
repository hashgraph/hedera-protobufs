# Hedera protobufs
The authoritative repository of [protocol buffers](https://developers.google.com/protocol-buffers) 
used by the Hedera Hashgraph public network, especially to define its gRPC API.

Other repositories are used to deploy language-specific libraries generated 
from the contents of the _proto/_ directory in this repository, as follows:
 - [Java](https://github.com/hashgraph/hedera-protobuf)

# Branching
This repository uses a simple branching model with only two distinguished branches:
 1. The head of `master` points to the protobufs currently deployed in mainnet.
   - Consult its tag for the deployed version.
 2. The head of `develop` points to the latest candidate for the next tag in `master`. 
