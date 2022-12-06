FROM node:19-alpine3.16
COPY . .
EXPOSE 3000
CMD ["npm","start"]
