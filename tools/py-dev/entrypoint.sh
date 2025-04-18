#!/bin/sh

uv venv ${PROJECT:-myapp}
. /workdir/${PROJECT:-myapp}/bin/activate
uv pip install -r /tmp/requirements.txt
/usr/bin/zsh
