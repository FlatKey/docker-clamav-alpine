## ClamAV

ClamAV is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.

## ClamAV Docker Image

This image is based on Alpine Linux and provides milter service.

### Usage

Example:

    docker run -d --name clamav -p 3310:3310 -p 7357:7357 flatkey/clamav-alpine

link:

    docker run -d --name clamav flatkey/clamav-alpine
    docker run -d --link clamav:clamav some_app
