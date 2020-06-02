#!/bin/sh
xvfb-run --server-args="-screen 0 1024x768x24" /opt/Unity/Editor/Unity -batchmode -logfile -force-opengl -quit -projectPath /project -executeMethod WebGLBuilder.build