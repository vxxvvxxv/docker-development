#!/bin/sh
PASSWORD=$1

echo "$PASSWORD"; echo ""

echo "password_sha256_hex"
echo -n "$PASSWORD" | sha256sum | tr -d '-'
# хэш SHA256.

echo ""

echo "password_double_sha1_hex"
echo -n "$PASSWORD" | sha1sum | tr -d '-' | xxd -r -p | sha1sum | tr -d '-'
# двойной хэш SHA1.
