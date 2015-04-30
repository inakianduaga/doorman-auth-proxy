#!/bin/bash

# Dump DOORMAN_ prefix container environment variables into a temp file that we will then read within the supervisor doorman process
printenv | grep 'DOORMAN_' > /doorman/environment

#Run processes through supervisor
exec supervisord -n