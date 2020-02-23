# Final class mock example in php

This repository contains an example on how build mock objects during test for classes marked as final.
Phpunit, Prophecy to mock classes, and [dg/bypass-finals](https://github.com/dg/bypass-finals) have been used.

The bootstrap.php file show how to configure bypass-finals in the application bootstrap to apply a whitelist of by-passable finals only when invoked by phpunit.

In the testusite are two tets.
- one mocking a final class that have been instered in the bypass-finals whitelist
- one trying to mock a final class that have not been inserted into the bypass-finals whitelist, throwing exception.

Note:
If you run ubuntu, you can use the script: build.sh to quick start.
The script will try to install "Docker CE runtime" and "docker-compose" and do an "apt-get update" if needed.
