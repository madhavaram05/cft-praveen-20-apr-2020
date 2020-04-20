#! /bin/bash
sudo yum update
sudo yum install -y httpd
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This page is created for loadbalancer!</p>
</body></html>
EOF
sudo systemctl restart httpd
