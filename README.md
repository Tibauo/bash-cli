cli bash
===================

test
-------------
```
[tibauo@localhost cli]$ make test-unit cli_name=macli
echo "Testing"
Testing
docker build . -t cli --build-arg cli_name=macli
[...]
Successfully tagged cli:latest
test/test.sh macli
[SUCCESS] macli is installed
test
[SUCCESS] macli test test
```


Installation
-------------
```
[tibauo@localhost cli]$ make build cli_name=macli
echo "Installing"
Installing
(./install/installation/install.sh macli)

INSTALLING CLI
CREATE /home/tibauo/.profile
INSTALLING TO /home/tibauo/.macli
```

Utilisation
-------------
```
[tibauo@localhost cli]$ source ~/.profile 
[tibauo@localhost cli]$ macli test montest
montest
```
