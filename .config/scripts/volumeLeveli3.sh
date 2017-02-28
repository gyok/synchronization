#!/bin/bash

amixer get Master -M | grep -oE "[[:digit:]]*%"
