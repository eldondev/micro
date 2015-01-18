mkdir -m 0700 .gnupg
gpg --home .gnupg --keyserver pgp.mit.edu --recv-keys "13EBBDBEDE7A12775DFDB1BABB572E0E2D182910" "DCD05B71EAB94199527F44ACDB6B8C1F96D8BF6D"
cat basic.tgz | docker import - micro
docker build -t micro . 
