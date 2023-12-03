#!/bin/bash

read -p "Enter the directory: " -e x
du -sh "$x"
