# Add snap binaries to path if they exist and is not on path
if [[ -d "/snap/bin" ]] && [[ ! "$PATH" == */snap/bin* ]]; then
    export PATH=$PATH:/snap/bin
fi

