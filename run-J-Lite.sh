#/bin/bash
nohup docker run --rm -e HOST=localhost -p 5000:5000 --network="host" --name myJlite jupyterlite &

