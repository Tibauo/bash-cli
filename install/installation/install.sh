#!/bin/bash
CLI_NAME=${1:-cli}
INSTALL_DIR=$HOME/.$CLI_NAME

echo $SCRIPT

echo "INSTALLING CLI"
if [ -d $INSTALL_DIR ]; then echo "FOLDER exist";exit 0; else mkdir -p $INSTALL_DIR/bin; fi

if [ ! -f "$HOME/.profile" ]; then echo "CREATE $HOME/.profile"; touch $HOME/.profile; fi

if ! grep -q "$INSTALL_DIR/bin" "$HOME/.profile" ; then
	echo "INSTALLING TO $INSTALL_DIR"

cat >> $HOME/.profile <<EOF
if [ -d "$INSTALL_DIR" ];then
   export PATH="$INSTALL_DIR/bin:\$PATH"
fi
EOF
fi

cat >> $INSTALL_DIR/bin/$CLI_NAME <<'EOF'
#!/bin/bash

SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

if [ $# -lt 2 ] && [ "$1" != "help" ];then
	echo "at least one parameter is required"
        $SCRIPT/bin/help.sh
        exit 1
fi

if [ ! -f "$SCRIPT/bin/$1.sh" ]; then
	echo "$1 is not a valid command"
	exit 1;
fi

$SCRIPT/bin/$1.sh "${@:2}"
EOF
cp -R "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/bin" $INSTALL_DIR
chmod +x -R $INSTALL_DIR/bin/
