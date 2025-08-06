FROM node:22 as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --configuration production

FROM nginx:alpine
COPY --from=builder /app/dist/coreui-free-angular-admin-template/brower /usr/share/nginx/html
EXPOSE 80