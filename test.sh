#!/bin/bash
echo 'Running tests...'
./app.sh
if [ $? -eq 0 ]; then
echo 'Test Passed: app.sh ran successfully'
exit 0
else
echo 'Test failed'
exit 1
fi
