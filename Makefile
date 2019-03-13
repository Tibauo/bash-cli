cli_name=cli

test-unit:
	echo "Testing"
	docker build . -t cli --build-arg cli_name=$(cli_name)
	test/test.sh $(cli_name)

build:
	echo "Installing"
	(./install/installation/install.sh $(cli_name))
