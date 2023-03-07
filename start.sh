#!/bin/bash


cat >${WWW_DIR:-/var/www/html}/index.html <<EOF
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body bgcolor="${COLOR:-gray}">
  <h1>${TITLE:-Welcome}</h1>
  ${BODY:-please use BODY/TITLE/COLOR wenv vars}
  <hr/>Kopiralyt 2023
</body>
</html>
EOF

exec nginx -g 'daemon off;'