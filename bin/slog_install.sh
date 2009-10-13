#!/bin/sh

SLOG_EXEC=/tmp/slog/bin/slog

if [ ! -x $SLOG_EXEC ]; then 
	echo "Installing..."
	cd ~/projects/python/slog
	python setup.py install --prefix=/tmp/slog >>/dev/null
fi
exec /tmp/slog/bin/slog
