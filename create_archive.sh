#!/bin/bash

cd ..

zip -r linux-kernel-rk3399.zip ./kernelbuildscripts/deploy

zip -r arm-firmware-rk3399.zip ./arm-trusted-firmware/build
