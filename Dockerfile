FROM alpine
COPY run.sh .
RUN apk add --no-cache git nodejs npm python make curl && \
	npm i -g npm@latest && \
	git clone https://github.com/zencomputersystems/eLeaveCore.git && \
	cd eLeaveCore && \
	npm i
WORKDIR .
CMD ["sh", "run.sh"]

EXPOSE 3000
HEALTHCHECK --interval=2m --timeout=5s --start-period=2m \
	CMD curl -f http://localhost:3000/api/docs/ || exit 1
