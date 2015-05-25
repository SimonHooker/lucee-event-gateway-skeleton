# lucee-event-gateway-skeleton

This repository is simply intended to serve as an illustration of a bare-bones event gateway within Lucee.  Functionally this is pretty pointless but hopefully will help other gateways getting started.

## Installation

1. Rename gateway.cfc to be whatever you like.  Move it if you like.  Just make sure it's accessible from your web root.
2. Update driver.cfc to have the correct path by editing the value returned by getCFCPath().
3. Copy driver.cfc to {lucee-web}/context/admin/gdriver/yourDriverName.cfc
4. Open up your Lucee web context
5. Go to Settings -> Logging
6. Add in a log file named "event-gateway-skeleton" (or whatever you renamed that too in the _log() function)
7. Go to Services -> Event Gateways
8. Set up your event gateway
9. Start it up

If you have used the default skeleton without changing it you will have to specify a string for "external url" (which isn't actually used).  You will also see some entries in the event-gateway-skeleton log file.  

All you have to do now is actually make it useful!