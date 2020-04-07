FROM node:12 as builder

WORKDIR /app
COPY . /app

# installing elm compiler
RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
RUN gunzip elm.gz
RUN chmod +x elm

# installing elm-app framework
RUN yarn global add elm-app

# that's a stupid temporal fix 
# -- TODO: Optimize this behaviour
RUN mv elm /usr/local/share/.config/yarn/global/node_modules/elm-app/node_modules/.bin

RUN elm-app build

# Time to serve the build generated
FROM nginx as server

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
# ENTRYPOINT [ "nginx" ]



