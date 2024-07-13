#!/bin/bash

export PYTHONPATH=$PYTHONPATH:$(pwd)/src
python -m uvicorn src.main:app --host 0.0.0.0 --port 8000