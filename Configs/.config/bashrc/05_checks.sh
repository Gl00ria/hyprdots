alias mdsum="md5sum"

# ╒══════════════════════════════════════════════════════════╕
# │                                                          │
# │                      GPG encryption                      │
# │                                                          │
# ╘══════════════════════════════════════════════════════════╛
# verify signature for ISOs
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

alias user-list="cut -d: -f1 /etc/passwd"
