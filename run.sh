#!/usr/bin/env bash
docker run -it -p 8080:8080 -v $(pwd)/slides:/app/slides msoedov/hacker-slides