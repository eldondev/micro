FROM micro
ADD .gnupg /.gnupg
RUN wget http://216.165.129.135/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-nomultilib-20141204.tar.bz2.DIGESTS.asc
RUN /gpg2 --verify stage3-amd64-nomultilib-20141204.tar.bz2.DIGESTS.asc
RUN sed -i -n -e's/\([^ ]*\) .*bz2$/\1/p' stage3-amd64-nomultilib-20141204.tar.bz2.DIGESTS.asc
RUN wget http://216.165.129.135/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-nomultilib-20141204.tar.bz2
RUN sha512sum stage3-amd64-nomultilib-20141204.tar.bz2 |grep -f stage3-amd64-nomultilib-20141204.tar.bz2.DIGESTS.asc
RUN cat stage3-amd64-nomultilib-20141204.tar.bz2 | /openssl dgst -whirlpool 2>&1 |grep -f stage3-amd64-nomultilib-20141204.tar.bz2.DIGESTS.asc
RUN wget http://216.165.129.135/snapshots/portage-latest.tar.bz2
RUN wget http://216.165.129.135/snapshots/portage-latest.tar.bz2.gpgsig
RUN /gpg2 --verify portage-latest.tar.bz2.gpgsig portage-latest.tar.bz2
RUN tar -xf stage3-amd64-nomultilib-20141204.tar.bz2 
RUN tar -C /usr -xf portage-latest.tar.bz2
