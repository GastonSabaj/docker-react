FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx 
#Quiero copiar algo de la otra fase (builder phase)
COPY --from=builder /app/build /usr/share/nginx/html
