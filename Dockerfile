FROM klakegg/hugo as BUILDER
WORKDIR /blog
COPY . .
RUN hugo

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=BUILDER /blog/public/ .
