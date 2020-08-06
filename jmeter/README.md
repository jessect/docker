## Usage

```
docker run -i --rm \
    -v $(pwd)/scripts:/jmeter/scripts:Z \
    -v $(pwd)/reports:/jmeter/reports:Z \
    -e JMX="script.jmx" \
    -e TOKENS="5" \
    -e USERS="5" \
    -e SECONDS="10" \
    -e REQUESTS="30" \
   jmeter:latest
```