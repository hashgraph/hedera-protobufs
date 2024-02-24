## Table of Contents

- [file_update.proto](#file_update-proto)
    - [FileUpdateTransactionBody](#proto-FileUpdateTransactionBody)
  



<a name="file_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-FileUpdateTransactionBody"></a>

### FileUpdateTransactionBody
Modify the metadata and/or contents of a file. If a field is not set in the transaction body, the
corresponding file attribute will be unchanged. This transaction must be signed by all the keys
in the top level of a key list (M-of-M) of the file being updated. If the keys themselves are
being updated, then the transaction must also be signed by all the new keys. If the keys contain
additional KeyList or ThresholdKey then M-of-M secondary KeyList or ThresholdKey signing
requirements must be meet If the update transaction sets the <tt>auto_renew_account_id</tt> field
to anything other than the sentinel <tt>0.0.0</tt>, the key of the referenced account must sign.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [FileID](#proto-FileID) |  | The ID of the file to update |
| expirationTime | [Timestamp](#proto-Timestamp) |  | The new expiry time (ignored if not later than the current expiry) |
| keys | [KeyList](#proto-KeyList) |  | The new list of keys that can modify or delete the file |
| contents | [bytes](#bytes) |  | The new contents that should overwrite the file's current contents |
| memo | [google.protobuf.StringValue](#google-protobuf-StringValue) |  | If set, the new memo to be associated with the file (UTF-8 encoding max 100 bytes) |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


