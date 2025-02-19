## 3.0.32
- feat: Upgrade at_commons for notifyFetch verb
## 3.0.31
- fix: tls keys are being dumped only by some secure socket connections when decryptPackets is set to true
- feat: tcpNoDelay set to true for all sockets 
- fix: Dart analyzer issues
## 3.0.30
- Introduce clientConfig which can be used to send client configurations to server.
## 3.0.29
- Enhance the executeVerb to handle server responses in JSON format
## 3.0.28
- createConnection() now directly uses CacheableSecondaryAddressFinder which can be passed on as optional param
- Introducing SecureSocketUtil which [optionally] allows creation of secure sockets with security context
- Add mutex to PKAM and CRAM authentication
- AtCommons upgraded to latest version v3.0.20
## 3.0.27
- Improved timeout handling logic in outbound message listener
- Upgraded at_commons version to 3.0.19
## 3.0.26
- Update at_commons version 3.0.18 to display hidden keys in scan
## 3.0.25
- Update at_commons version 3.0.17 for AtException hierarchy
## 3.0.24
- Removed invalid line added to base_connection.dart
## 3.0.23
- Update at_commons version 3.0.16 for bypass cache feature
## 3.0.22
- find secondary bug fix
## 3.0.21
- Added CacheableSecondaryAddressFinder
## 3.0.20
- Update at_commons version
- Remove unnecessary print statement
## 3.0.19
- Export secondary address cache from the package
- Update at_commons and at_utils version
## 3.0.18
- Updated dependencies
## 3.0.17
- Added cache for secondary url lookup from root server
## 3.0.16
- Rename NotifyDelete to NotifyRemove
## 3.0.15
- Update at_commons version for Info and NoOp verb
- Update at_commons version for NotifyDelete verb
## 3.0.14
- Upgrade at_commons version for bug fix in notify verb syntax
## 3.0.13
- Upgrade at_commons version for shared key metadata support in notify
## 3.0.12
- Add encryption shared key and public key checksum of sharedWith atsign in metadata
## 3.0.11
- increase outbound connection timeout
## 3.0.10
- outbound listener bug fix
## 3.0.9
- at_commons version change for AtTimeoutException
- Handle error: responses from server
## 3.0.8
- at_lookup fix race condition when not using await with lookup requests
## 3.0.7
- at_utils version change for fix formatAtSign bug for null value
## 3.0.6
- at_commons and at_utils version change
## 3.0.5
- at_commons and at_utils version change
## 3.0.4
- at_utils and at_commons version change for AtKey validations. 
## 3.0.3
- Reduce wait time on address lookup to root server 
## 3.0.2
- Reduce wait time on server response
## 3.0.1
- connection close replaced with destroy
## 3.0.0
- Sync pagination feature
## 2.0.5
- bug fix for no verb response
## 2.0.4
- at_commons version change
## 2.0.3
- at_utils and at_commons version change for stream resume
## 2.0.2
- at_utils and at_commons version change
## 2.0.1
- at_utils and at_commons version change
## 2.0.0
- Null safety upgrade
## 1.0.0+8
- Refactor code with dart lint rules
- at_utils and at_commons version changes
## 1.0.0+7
- Third party package dependency upgrade
- Call back to auto restart monitor connection
## 1.0.0+6
- at_utils and at_commons version changes
## 1.0.0+5
- atsign validation changes
- at_utils and at_commons version changes
## 1.0.0+4
- at_utils and at_commons version changes
## 1.0.0+3
- public data signing, at_utils and at_commons version changes
## 1.0.0+2
- at_utils and at_commons version changes
## 1.0.0+1
- at_utils version changes
## 1.0.0
- Initial version, created by Stagehand
