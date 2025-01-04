# Add go to path and add environmentvariables
if [[ -d /usr/local/go ]]; then
    if [[ ! "$PATH" == */usr/local/go/bin* ]]; then
        export PATH=$PATH:/usr/local/go/bin
    fi
    export GOPATH=$HOME/.local/share/go
    export GOBIN=$GOPATH/bin
fi

