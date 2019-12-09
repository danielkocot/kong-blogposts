#!/bin/sh
echo "Creating consumer and key"
http POST :8001/consumers username=api-user

echo "Initializing service1 through Kong"
http POST :8001/services/ name=service1 url=http://host.docker.internal/api/service1
http POST :8001/services/service1/routes paths:='["/service1"]' name=service1_route methods:='["GET"]'
http POST :8001/services/service1/plugins name=key-auth
http POST :8001/consumers/api-user/key-auth key=secret_key
echo "Initializing service2 through Kong"
http POST :8001/services/ name=service2 url=http://host.docker.internal/api/service2
http POST :8001/services/service2/routes paths:='["/service2"]' name=service2_route methods:='["GET"]'
http POST :8001/services/service2/plugins name=key-auth
