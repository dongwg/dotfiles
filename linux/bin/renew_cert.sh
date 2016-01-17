#!/usr/bin/env bash

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

pushd /home/wdong/acme

python /home/wdong/download/acme-tiny/acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir ./challenges/ > ./signed.crt || exit
wget -O - https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem

popd

