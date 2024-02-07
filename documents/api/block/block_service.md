## Table of Contents

- [block_service.proto](#block_service-proto)
    - [BlockNodeVersions](#com-hedera-hapi-block-BlockNodeVersions)
    - [PublishStreamRequest](#com-hedera-hapi-block-PublishStreamRequest)
    - [PublishStreamResponse](#com-hedera-hapi-block-PublishStreamResponse)
    - [PublishStreamResponse.Acknowledgement](#com-hedera-hapi-block-PublishStreamResponse-Acknowledgement)
    - [PublishStreamResponse.BlockAcknowledgement](#com-hedera-hapi-block-PublishStreamResponse-BlockAcknowledgement)
    - [PublishStreamResponse.EndOfStream](#com-hedera-hapi-block-PublishStreamResponse-EndOfStream)
    - [PublishStreamResponse.ItemAcknowledgement](#com-hedera-hapi-block-PublishStreamResponse-ItemAcknowledgement)
    - [ServerStatusRequest](#com-hedera-hapi-block-ServerStatusRequest)
    - [ServerStatusResponse](#com-hedera-hapi-block-ServerStatusResponse)
    - [SingleBlockRequest](#com-hedera-hapi-block-SingleBlockRequest)
    - [SingleBlockResponse](#com-hedera-hapi-block-SingleBlockResponse)
    - [StateSnapshotRequest](#com-hedera-hapi-block-StateSnapshotRequest)
    - [StateSnapshotResponse](#com-hedera-hapi-block-StateSnapshotResponse)
    - [SubscribeStreamRequest](#com-hedera-hapi-block-SubscribeStreamRequest)
    - [SubscribeStreamResponse](#com-hedera-hapi-block-SubscribeStreamResponse)
  
    - [PublishStreamResponseCode](#com-hedera-hapi-block-PublishStreamResponseCode)
    - [SingleBlockResponseCode](#com-hedera-hapi-block-SingleBlockResponseCode)
    - [StateSnapshotResponseCode](#com-hedera-hapi-block-StateSnapshotResponseCode)
    - [SubscribeStreamResponseCode](#com-hedera-hapi-block-SubscribeStreamResponseCode)
  
    - [BlockAccessService](#com-hedera-hapi-block-BlockAccessService)
    - [BlockNodeService](#com-hedera-hapi-block-BlockNodeService)
    - [BlockStreamService](#com-hedera-hapi-block-BlockStreamService)
    - [StateService](#com-hedera-hapi-block-StateService)
  



<a name="block_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## block_service.proto
# Block Service
The Service API exposed by the Block Nodes.

## Workarounds
> There are incorrect elements in this file to work around bugs in the
> PBJ Compiler.
>> Issues 262, 263, 240, 218, 217, and 216 are related.
>
> Issue 263
>> A number of fields reference child messages, these _should_ specify
>> the parent message (i.e. `Parent.child field = #;`) but do not do
>> so due to issue 263.
>
> Issue 262
>> Some fields reference messages defined in other packages that share
>> a common prefix (e.g. `com.hedera.hapi.block.stream`). These fields
>> specify the entire package instead of the shorter and clearer suffix
>> due to issue 262
>
> Issue 240
>> These files may cause PBJ integration tests to fail if included
>> due to issue 240. This was worked around by specifying different
>> values for java_package and pbj.java_package.
>
> Issue 218
>> These files _should_ have the same value for package and java_package.
>> Ideally we would not specify `java_package` or the pbj comment in that
>> situation, but Issue 218 prevents eliding the unnecessary directives.
>
> Issue 217
>> These files may cause PBJ to fail compilation due to comments preceding
>> the `syntax` keyword. Currently this is a warning, but in projects that
>> make warnings errors, this will cause compilation to fail.
>
> Issue 216
>> These files would do well with validation support, but cannot make
>> use of validation, even as an advisory element, due to Issue 216.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-BlockNodeVersions"></a>

### BlockNodeVersions
Version information for a block node.

The `stream_proto_version` SHOULD be an officially released Block Stream
version.
The `address_book_version` SHALL be defined by networks of block nodes.
The `software_version` SHALL be defined by the implementation of the
Block Node specification.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address_book_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | A version of the Block Node network address book.<br/> The address book version describes what version of address book this block node holds for discovering and identifying other block nodes. <p> This version SHALL be specific to each "network" of interconnected Block Nodes. |
| stream_proto_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | A version of the Block Stream specification.<br/> This is the Stream version currently supported by this Block Node. <p> Implementations SHOULD make reasonable effort to ensure the latest released Block Stream version is supported.<br/> This version MUST be an officially released Block Stream version if the responding block node is not private. |
| software_version | [proto.SemanticVersion](#proto-SemanticVersion) |  | A version of the block node software.<br/> This is the software version that this block node is currently running. <p> This value is implementation-defined. |






<a name="com-hedera-hapi-block-PublishStreamRequest"></a>

### PublishStreamRequest
Publish a stream of blocks.

Each item in the stream MUST contain one `BlockItem`.<br/>
Each Block MUST begin with a single `BlockHeader` block item.<br/>
The block node SHALL append each `BlockItem` to an internal structure
to reconstruct full blocks.<br/>
The block node MUST verify the block proof for each block before sending a
response message acknowledging that block.<br/>
Each Block MUST end with a single `BlockStateProof` block item.<br/>
The block node MUST verify the Block using the `BlockStateProof` to
ensure all data was received and processed correctly.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_item | [stream.BlockItem](#com-hedera-hapi-block-stream-BlockItem) |  | A single item written to the block stream. |






<a name="com-hedera-hapi-block-PublishStreamResponse"></a>

### PublishStreamResponse
A response to writing a block stream.

This message is sent in response to each Block in a block stream sent
to a block node. The block stream is sent as a stream of messages, and each
message MAY be acknowledged with a message of this type.<br/>
Each `BlockItem` MAY be acknowledged with an `Acknowledgement`
response. Item acknowledgement is an OPTIONAL feature.<br/>
Each completed block SHALL be acknowledged with an `Acknowledgement`
response. Block acknowledgement is a REQUIRED feature.<br/>
A final response SHALL be sent with an `EndOfStream` status result after
the last block stream item is received, or when the receiving system
must end the stream for any reason.<br/>
If a failure is detected (which may include a block or block item that
fails validation) an `EndOfStream` response SHALL be sent with a
relevant error status.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| acknowledgement | [PublishStreamResponse.Acknowledgement](#com-hedera-hapi-block-PublishStreamResponse-Acknowledgement) |  | A response sent for each block, and optionally for each item. |
| status | [PublishStreamResponse.EndOfStream](#com-hedera-hapi-block-PublishStreamResponse-EndOfStream) |  | A response sent when a stream ends. |






<a name="com-hedera-hapi-block-PublishStreamResponse-Acknowledgement"></a>

### PublishStreamResponse.Acknowledgement
A response to acknowledge receipt and verification of a single item
or full block.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_ack | [PublishStreamResponse.BlockAcknowledgement](#com-hedera-hapi-block-PublishStreamResponse-BlockAcknowledgement) |  | A response type to acknowledge a full and complete block. <p> All block node implementations SHOULD acknowledge each block. |
| item_ack | [PublishStreamResponse.ItemAcknowledgement](#com-hedera-hapi-block-PublishStreamResponse-ItemAcknowledgement) |  | A response type to acknowledge a single `BlockItem`.<br/> This is an OPTIONAL message and implementations MAY choose to only acknowledge full blocks. |






<a name="com-hedera-hapi-block-PublishStreamResponse-BlockAcknowledgement"></a>

### PublishStreamResponse.BlockAcknowledgement
Acknowledgement of a full block.<br/>
This message is a necessary part of the block streaming protocol.

This response SHALL be sent after a block state proof item is
received and verified.<br/>
The block node SHALL send exactly one `BlockAcknowledgement` for
each successful block.<br/>
The `BlockAcknowledgement` response MAY be sent after sending an
`ItemAcknowledgement` response for the `BlockStateProof` item
at the end of the block, if item acknowledgement is enabled.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  | A block number number of the acknowledged block. <p> A source system SHOULD verify that this value matches the block sent. |
| block_root_hash | [bytes](#bytes) |  | A hash of the virtual merkle root for the block. <p> This SHALL be the hash calculated by the block node for the root node of the virtual merkle tree that is signed by the source system to validate the block. |
| block_already_exists | [bool](#bool) |  | A flag indicating that the received block duplicates an existing block. <p> If a source system receives acknowledgement with this flag set true the source system SHOULD end the stream. The `block_number` returned SHALL be the last block known and verified by the receiving system, and the source system MAY resume publishing immediately after that block. |






<a name="com-hedera-hapi-block-PublishStreamResponse-EndOfStream"></a>

### PublishStreamResponse.EndOfStream
A message sent to end a stream.

This response message SHALL be sent from a block node to a block
stream source system when a `publishBlockStream` stream ends.<br/>
This message SHALL be sent exactly once for each `publishBlockStream`
call.<br/>
The source system SHALL cease sending block items upon receiving
this response, and MAY determine the ending state of the stream from
the `status` enumeration and the `block_number` returned.<br/>
A source system SHOULD verify that the `block_number` value matches the
last block sent, and SHOULD resend one or more blocks if the value
here does not match the expected value.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [PublishStreamResponseCode](#com-hedera-hapi-block-PublishStreamResponseCode) |  | A response code. <p> This code indicates the reason the stream ended.<br/> This value MUST be set to a non-default value. |
| block_number | [uint64](#uint64) |  | The number of the last completed and _verified_ block. <p> Nodes SHOULD only end a stream after a block state proof to avoid the need to resend items.<br/> If status is a failure code, the source node MUST start a new stream at the beginning of the first block _following_ this number (e.g. if this is 91827362983, then the new stream must start with the _header_ for block 91827362984). |






<a name="com-hedera-hapi-block-PublishStreamResponse-ItemAcknowledgement"></a>

### PublishStreamResponse.ItemAcknowledgement
Acknowledgement for a single `BlockItem`.<br/>
Most nodes are expected to implement this acknowledgement only for
debugging and development purposes.

If a node implements single item acknowledgement, the block node SHALL
send one `ItemAcknowledgement` for each `BlockItem` received
and verified.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item_hash | [bytes](#bytes) |  | A SHA2-384 hash of the `BlockItem` received. <p> This field is REQUIRED.<br/> A source system MUST verify that this value matches its own internal calculated hash value, and MUST end the stream if the values do not match. |






<a name="com-hedera-hapi-block-ServerStatusRequest"></a>

### ServerStatusRequest
A request for the status of a block node server.






<a name="com-hedera-hapi-block-ServerStatusResponse"></a>

### ServerStatusResponse
A response to a server status request.

This message SHALL provide a client with information needed to successfully
query this block node server for a block, stream of blocks, or
state snapshot.<br/>
A request for blocks between `first_available_block` and
`last_available_block`, inclusive, SHOULD succeed. Any request for blocks
outside that range SHOULD fail.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| first_available_block | [uint64](#uint64) |  | The lowest numbered block available on this block node server. <p> Any request for a block with lower number than this value SHALL fail with a status value indicating and invalid start block number. |
| last_available_block | [uint64](#uint64) |  | The greatest block number available from this block node server. <p> Any request for a block with a block number higher than this value MAY fail. |
| only_latest_state | [bool](#bool) |  | A flag indicating this block node only offers the latest state snapshot. <p> If this value is `true` the client MUST set `retrieve_latest` `true` in any `StateSnapshotRequest` sent to this block node. |
| version_information | [BlockNodeVersions](#com-hedera-hapi-block-BlockNodeVersions) |  | Version information.<br/> Versions for the block network address book, block stream protocol buffer schema, and block node software. |






<a name="com-hedera-hapi-block-SingleBlockRequest"></a>

### SingleBlockRequest
A request to read a single block.

A client system SHALL send this message to request a single block,
including the block state proof.<br/>
A client MAY request that the block be sent without verification.
A compliant Block Node MAY respond to requests that allow unverified
responses by returning the full requested block before verifying
the included block proof.<br/>
A compliant Block Node MAY support _only_ requests that allow unverified
blocks, but MUST clearly document that limitation, and MUST respond to
a request that does not allow unverified blocks with the
`ALLOW_UNVERIFIED_REQUIRED` response code.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  | The block number of a block to retrieve. <p> The requested block MUST exist on the block node.<br/> This value MUST NOT be set if `retrieve_latest` is set `true`.<br/> This value MUST be set to a valid block number if `retrieve_latest` is unset or is set `false`. |
| allow_unverified | [bool](#bool) |  | A flag to indicate that the requested block may be sent without verifying its `BlockProof`.<br/> This might be set by a client that expects to perform its own verification and wishes lower latency or, potentially, lower cost. <p> If this value is set, then the responding Block Node MAY respond with a block that has not completed verification of its `BlockProof`.<br/> If this is _not_ set then the Block Node MUST respond with either a fully verified and validated block, or `VERIFIED_BLOCK_UNAVAILABLE` if the requested block is not yet verified.<br/> The default value is _not set_. |
| retrieve_latest | [bool](#bool) |  | A flag to request the latest available block. <p> This value MAY be set `true` to request the last block available.<br/> If this value is set to `true` then `block_number` MUST NOT be set and SHALL be ignored. |






<a name="com-hedera-hapi-block-SingleBlockResponse"></a>

### SingleBlockResponse
A response to a `singleBlock` request.

This message SHALL be sent in response to a request, and SHALL contain at
least a valid `status`.<br/>
If `status` is `READ_BLOCK_SUCCESS`, the response SHALL contain the
requested block in the `block` field.

> Note
>> A block can become quite large. A client MUST be prepared to receive the
>> full content of the block, perhaps many megabytes of data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [SingleBlockResponseCode](#com-hedera-hapi-block-SingleBlockResponseCode) |  | A response status. <p> The reported status SHALL reflect the success of the request, or a detailed reason the request failed. |
| block | [stream.Block](#com-hedera-hapi-block-stream-Block) |  | The requested block. <p> This container object SHALL hold the entire sequence of block items for the requested block.<br/> The block items in this message SHALL be in the same order as received.<br/> The items in this message SHALL begin with a `BlockHeader` and end with a `BlockStateProof` applicable to this block. |






<a name="com-hedera-hapi-block-StateSnapshotRequest"></a>

### StateSnapshotRequest
A request to read a state snapshot.

A state snapshot is a full copy of the network state at the completion of a
particular block.

This request MUST contain a block number that has already reached this block
node and completed verification, or request the "latest" snapshot.<br/>
This request MAY specify the "latest" snapshot, and the block node SHALL
respond with a reference to a snapshot containing the most recent contents
of the network state known to that block node.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| last_block_number | [uint64](#uint64) |  | A block number. <p> This SHALL be the last block number present in the snapshot returned.<br/> If `retrieve_latest` is set `true` this field SHOULD NOT be set and SHALL be ignored.<br/> A block node implementation MAY reject any request with a non-default value for this field, but MUST clearly document that behavior. |
| retrieve_latest | [bool](#bool) |  | A boolean to request the latest available snapshot. <p> This value MAY be set `true` to request the most recent state snapshot available.<br/> If this value is set to `true` then `last_block_number` SHOULD NOT be set and SHALL be ignored.<br/> A block node implementation MAY reject any request with that does _not_ set this field `true`, but MUST clearly document that behavior. |






<a name="com-hedera-hapi-block-StateSnapshotResponse"></a>

### StateSnapshotResponse
A response to a request for a state snapshot.

This message SHALL deliver a _reference_ to the requested snapshot
data if successful.<br/>
This message SHALL deliver a code indicating the reason for failure
if unsuccessful.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [StateSnapshotResponseCode](#com-hedera-hapi-block-StateSnapshotResponseCode) |  | A status response. <p> This code SHALL indicate a successful call, or the detailed reason for failure. |
| last_block_number | [uint64](#uint64) |  | A block number. <p> This SHALL be the number of the last block included in this state snapshot. |
| snapshot_reference | [string](#string) |  | A reference to where the requested state snapshot may be obtained. <p> <blockquote>REVIEW NOTE<blockquote> This is TEMPORARY. We have not yet designed how state snapshots may be sent. One idea is to use `Any` and let implementations decide; another is to use a time limited URL (with the same login as the block node server); another is to use a customer-pays cloud storage bucket. </blockquote></blockquote> |






<a name="com-hedera-hapi-block-SubscribeStreamRequest"></a>

### SubscribeStreamRequest
A request to stream block items from block node to a client.

The block node SHALL respond to this request with a stream of
`SubscribeStreamResponse` messages.<br/>
The block node SHALL stream the full contents of the blocks requested.<br/>
The block items SHALL be streamed in order originally produced within
a block.<br/>
The blocks SHALL be streamed in ascending order by `block_number`.<br/>
The block node SHALL end the stream when the last requested block has
been sent.<br/>
The block node SHALL end the stream with a response code status of SUCCESS
when the stream is complete.<br/>
The client SHOULD call the `serverStatus` rpc prior to constructing this
request to determine the available start and end blocks.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start_block_number | [uint64](#uint64) |  | A block number to start the stream. <p> This SHALL be the block number of the first block returned.<br/> This field MUST be less than or equal to the latest available block number. |
| end_block_number | [uint64](#uint64) |  | A block number to end the stream.<br/> This is optional, and if not set (0), the stream will be "infinite". <p> This field MAY be zero (`0`) to indicate the stream SHOULD continue indefinitely, streaming new blocks as each becomes available.<br/> If this value is greater than zero (`0`) <ul> <li>This value SHALL be the number of the last block returned.</li> <li>This field MUST NOT be less than `start_block_number`.</li> <li>This SHOULD be a block number that is immediately available from the block node.</li> <li>A block node SHALL continue to stream blocks until the last requested block is transmitted.</li> <li>A block node implementation MAY reject a request for a block that is not yet available.</li> <li>A block node implementation MAY accept future block numbers.</li> <li>Block node implementations MAY charge increased fees for such "future" streams.</li> </ul> |
| allow_unverified | [bool](#bool) |  | A flag to indicate that the requested block(s) may be sent before verifying each block's `BlockProof`.<br/> This might be set by a client that expects to perform its own verification and wishes lower latency or, potentially, lower cost. <p> If this value is set, then the responding Block Node MAY respond with blocks that have not (yet) completed block proof verification.<br/> If this is _not set_ then the Block Node MUST respond with only fully verified and validated block(s).<br/> If this is _set_, then a Block Node MAY stream items from blocks that have not yet been verified or do not yet have a block proof available.<br/> The default value is _not set_. |






<a name="com-hedera-hapi-block-SubscribeStreamResponse"></a>

### SubscribeStreamResponse
One item in a stream of `subscribeBlockStream` responses.

The block node SHALL respond to a `subscribeBlockStream` request with a
stream of `SubscribeStreamResponse` messages.<br/>
The block node SHALL stream the full contents of the blocks requested.<br/>
The block items SHALL be streamed in order originally produced within
a block.<br/>
The blocks SHALL be streamed in ascending order by `block_number`.<br/>
The block node SHALL end the stream when the last requested block has
been sent.<br/>
The block node SHALL end the stream with a response code status of SUCCESS
when the stream is complete.<br/>
The block node SHALL end the stream with a response code status of
`READ_STREAM_INVALID_START_BLOCK_NUMBER` if the start block number is
greater than the end block number.<br/>
The block node SHALL end the stream with a response code status of
`READ_STREAM_INSUFFICIENT_BALANCE` if insufficient balance remains to
complete the requested stream.
The block node SHALL make every reasonable effort to fulfill as much of the
request as available balance supports, in the event balance is not
sufficient to complete the request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [SubscribeStreamResponseCode](#com-hedera-hapi-block-SubscribeStreamResponseCode) |  | A final response item describing the terminal status of this stream. <p> The block node server SHALL end the stream following this message. |
| block_item | [stream.BlockItem](#com-hedera-hapi-block-stream-BlockItem) |  | A stream response item containing a single `BlockItem`. <p> The full response SHALL consist of many `block_item` messages followed by a single `status` message. |





 <!-- end messages -->


<a name="com-hedera-hapi-block-PublishStreamResponseCode"></a>

### PublishStreamResponseCode
An enumeration indicating the status of this request.

This enumeration describes the reason a block stream
(sent via `publishBlockStream`) ended.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STREAM_ITEMS_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| STREAM_ITEMS_SUCCESS | 1 | The request succeeded.<br/> No errors occurred and the source node orderly ended the stream. |
| STREAM_ITEMS_TIMEOUT | 2 | The delay between items was too long.<br/> The source MUST start a new stream before the failed block. |
| STREAM_ITEMS_OUT_OF_ORDER | 3 | An item was received out-of-order.<br/> The source MUST start a new stream before the failed block. |
| STREAM_ITEMS_BAD_STATE_PROOF | 4 | A block state proof item could not be validated.<br/> The source MUST start a new stream before the failed block. |
| STREAM_ITEMS_BEHIND | 5 | The block node is "behind" the publisher.<br/> Ths consensus node has sent a block later than this block node can process. The publisher may retry by sending blocks immediately following the `block_number` returned, or may end the stream and try again later. <p> Block nodes that are "behind" SHOULD attempt to "catch up" by requesting blocks from another block node or other source of recent historical block stream data. |



<a name="com-hedera-hapi-block-SingleBlockResponseCode"></a>

### SingleBlockResponseCode
An enumeration indicating the status of this request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| READ_BLOCK_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| READ_BLOCK_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| READ_BLOCK_SUCCESS | 2 | The request succeeded.<br/> The requested block SHALL be returned in the `block` field. |
| READ_BLOCK_NOT_FOUND | 3 | The requested block was not found.<br/> Something failed and a block that SHOULD be available was not found.<br/> The client MAY retry the request; if this result is repeated the request SHOULD be directed to a different block node server. |
| READ_BLOCK_NOT_AVAILABLE | 4 | The requested block is not available on this block node server.<br/> The client SHOULD send a `serverStatus` request to determine the lowest and highest block numbers available at this block node server. |
| ALLOW_UNVERIFIED_REQUIRED | 5 | The request for a verified block cannot be fulfilled.<br/> The client requested a verified block from a block node that does not offer verified blocks. <p> The client MAY retry the request with the `allow_unverified` flag set. |
| VERIFIED_BLOCK_UNAVAILABLE | 6 | The request for a verified block cannot be fulfilled.<br/> The client requested a verified block from a block node but the requested block is not yet verified. <p> The client MAY retry the request after a short delay (typically 2 seconds or more). |



<a name="com-hedera-hapi-block-StateSnapshotResponseCode"></a>

### StateSnapshotResponseCode
An enumeration indicating the status of a StateSnapshotResponse request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STATE_SNAPSHOT_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| STATE_SNAPSHOT_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| STATE_SNAPSHOT_SUCCESS | 2 | The request succeeded.<br/> The full snapshot data MAY be read via the endpoint provided in the `snapshot_reference` field for the duration specified. |



<a name="com-hedera-hapi-block-SubscribeStreamResponseCode"></a>

### SubscribeStreamResponseCode
An enumeration indicating the status of this request.

This response code SHALL be the last message in the stream of responses.
This code SHALL represent the final status of the full request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| READ_STREAM_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| READ_STREAM_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| READ_STREAM_SUCCESS | 2 | The request succeeded. <p> The requested block(s) SHALL precede the status response with this value. |
| READ_STREAM_INVALID_START_BLOCK_NUMBER | 3 | The requested start block number is not valid.<br/> The start block number is after the end block number, less than `0`, or otherwise invalid.<br/> The client MAY retry this request, but MUST change the `start_block_number` field to a valid start block. |
| READ_STREAM_INVALID_END_BLOCK_NUMBER | 4 | The requested end block number is not valid.<br/> The end block number is greater than the highest current block number, less than `0`, or otherwise invalid.<br/> The client MAY retry this request, but MUST change the `end_block_number` field to a valid end block. |


 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="com-hedera-hapi-block-BlockAccessService"></a>

### BlockAccessService
Remote procedure calls (RPCs) for the Block Node block services.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| singleBlock | [SingleBlockRequest](#com-hedera-hapi-block-SingleBlockRequest) | [SingleBlockResponse](#com-hedera-hapi-block-SingleBlockResponse) | Read a single block from the block node. <p> The request SHALL describe the block number of the block to retrieve. |


<a name="com-hedera-hapi-block-BlockNodeService"></a>

### BlockNodeService
Remote procedure calls (RPCs) for the Block Node ancillary services.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| serverStatus | [ServerStatusRequest](#com-hedera-hapi-block-ServerStatusRequest) | [ServerStatusResponse](#com-hedera-hapi-block-ServerStatusResponse) | Read the status of this block node server. <p> A client SHOULD request server status prior to requesting block stream data or a state snapshot. |


<a name="com-hedera-hapi-block-BlockStreamService"></a>

### BlockStreamService
Remote procedure calls (RPCs) for the Block Node stream services.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| publishBlockStream | [PublishStreamRequest](#com-hedera-hapi-block-PublishStreamRequest) stream | [PublishStreamResponse](#com-hedera-hapi-block-PublishStreamResponse) stream | Publish a stream of blocks. <p> Each item in the stream MUST contain one `BlockItem`.<br/> Each Block MUST begin with a single `BlockHeader` block item.<br/> The block node SHALL append each `BlockItem` to an internal structure to construct full blocks.<br/> Each Block MUST end with a single `BlockStateProof` block item.<br/> It is RECOMMENDED that the implementations verify the Block using the `BlockStateProof` to validate all data was received correctly.<br/> This API SHOULD, generally, be restricted based on mTLS authentication to a limited set of source (i.e. consensus node) systems. |
| subscribeBlockStream | [SubscribeStreamRequest](#com-hedera-hapi-block-SubscribeStreamRequest) | [SubscribeStreamResponse](#com-hedera-hapi-block-SubscribeStreamResponse) stream | Subscribe to a stream of blocks. <p> Each item in the stream SHALL contain one `BlockItem` or a response code.<br/> The request message MUST specify start and end block numbers to return/<br/> The block node SHALL stream the full contents of the blocks requested.<br/> The block items SHALL be streamed in order originally produced within a block.<br/> The blocks shall be streamed in ascending order by `block_number`.<br/> The block node SHALL end the stream when the last requested block, if set, has been sent.<br/> A request with an end block of `0` SHALL be interpreted to indicate the stream has no end. The block node SHALL continue to stream new blocks as soon as each becomes available.<br/> The block node SHALL end the stream with response code containing a status of SUCCESS when the stream is complete.<br/> The block node SHALL end the stream with a response code containing a status of `READ_STREAM_INVALID_START_BLOCK_NUMBER` if the start block number is greater than the end block number.<br/> The block node SHALL end the stream with a response code containing a status of `READ_STREAM_PAYMENT_INSUFFICIENT` if insufficient payment remains to complete the requested stream.<br/> The block node SHALL make every reasonable effort to fulfill as much of the request as possible in the event payment is not sufficient to complete the request. |


<a name="com-hedera-hapi-block-StateService"></a>

### StateService
Remote procedure calls (RPCs) for the Block Node state snapshot
and query services.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| stateSnapshot | [StateSnapshotRequest](#com-hedera-hapi-block-StateSnapshotRequest) | [StateSnapshotResponse](#com-hedera-hapi-block-StateSnapshotResponse) | Read a state snapshot from the block node. <p> The request SHALL describe the last block number present in the snapshot.<br/> Block node implementations MAY decline a request for a snapshot older than the latest available, but MUST clearly document this behavior. |

 <!-- end services -->



