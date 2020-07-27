FROM pandoc/latex:2.9.2.1

RUN tlmgr install \
      bxjscls \
      bxwareki \
      everyhook \
      ipaex \
      luatexja \
      svn-prov \
      type1cm && \
    tlmgr update latex
COPY numberring.lua /usr/lib/
RUN wget -O - https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.6.4/pandoc-crossref-Linux-2.9.2.1.tar.xz | \
  tar Jxf - \
  && mv pandoc-crossref /usr/lib/ \
  && rm -rf pandoc-crossref.1
RUN wget -O - https://github.com/Hide-KC/easy-pandoc-templates/archive/v1.0.0.tar.gz | \
  tar zxvf - -C /tmp/ \
  && mv /tmp/easy-pandoc-templates* /usr/lib/easy-pandoc-templates \
  && rm -rf /tmp/*
