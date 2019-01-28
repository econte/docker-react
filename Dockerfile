#containers para multiplas fases

# as = tag da fase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
# --from=<fase a qual os arquivos sao recuperados>
COPY --from=builder /app/build /usr/share/nginx/html