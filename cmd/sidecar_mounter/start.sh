#! /bin/bash

# We'll start our HTTP request proxy, mitmproxy. This is used to control cache headers when sending data to google cloud storage using gcsfuse.
./mitmdump -s /rewriteCacheHeaders.py --mode regular@8082 -w outfile &
# # We'll wait until mitmdump has created a certificate
until [ -f ~/.mitmproxy/mitmproxy-ca-cert.pem ]
do
     sleep 5
done
# # We'll install the certificate
mkdir /usr/local/share/ca-certificates/extra 
cd ~/.mitmproxy 
openssl x509 -in mitmproxy-ca-cert.pem -inform PEM -out mitmproxy-ca-cert.crt
cp mitmproxy-ca-cert.crt /usr/local/share/ca-certificates/extra/mitmproxy-ca-cert.crt 
update-ca-certificates

/gcs-fuse-csi-driver-sidecar-mounte
# # Start gcsfuse 
# http_proxy=http://127.0.0.1:8082 https_proxy=http://127.0.0.1:8082 mount -t gcsfuse -o allow_other,file_mode=777,dir_mode=777,key_file=/service-account-key.json wag3r-live-media /tmp/ls_media &
# Start our NGINX RTMP server
# nginx -g "daemon off;"

# cd mitmproxy
# python3 -m venv venv
# venv/bin/pip install -e ".[dev]"
# source venv/bin/activate
# ./mitmdump -s /rewriteCacheHeaders.py --mode regular@8082 -w outfile
# ./mitmproxy -p 8082 --ssl-insecure --no-web-open-browser --no-web-open-login -w outfile
# ./mitmdump -w outfile --mode regular@8083

# echo "Running new" &
# sudo chmod g+x /tmp/ls_media &
# chmod +x /tmp/ls_media/* &

# sudo mkdir /usr/local/share/ca-certificates/extra
# cd /.mitmproxy
# openssl x509 -in mitmproxy-ca-cert.pem -inform PEM -out mitmproxy-ca-cert.crt
# sudo cp mitmproxy-ca-cert.crt /usr/local/share/ca-certificates/extra/mitmproxy-ca-cert.crt
# sudo update-ca-certificates