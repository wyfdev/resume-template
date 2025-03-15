FROM ubuntu

COPY --from=denoland/deno:bin /deno /usr/local/bin/deno

WORKDIR /work

ADD ./deno.json /work/

RUN deno install