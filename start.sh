#!/bin/bash


cat > /var/www/html/index.html <<EOF
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body bgcolor="${COLOR:-gray}">
  <h1>${TITLE:-Welcome}</h1>
    
</body>
</html>
EOF

nginx -g 'daemon off;'