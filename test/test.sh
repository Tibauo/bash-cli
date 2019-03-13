#!/bin/bash
cli_name=${1:-cli}
status_code=0

docker run -it cli ls -al /root/.$cli_name > /dev/null
ret=$?

if [ $ret != 0 ]; then
  echo "[FAILED] $cli_name isn't installed"
  status_code=$((status_code + 1))
else
  echo "[SUCCESS] $cli_name is installed"
  status_code=$((status_code + 0))
fi


docker run -it cli /bin/bash -c "source /root/.profile && $cli_name test test" 
ret=$?

if [ $ret != 0 ]; then
  echo "[FAILED] $cli_name test test"
  status_code=$((status_code + 1))
else
  echo "[SUCCESS] $cli_name test test"
  status_code=$((status_code + 0))
fi


exit $status_code
