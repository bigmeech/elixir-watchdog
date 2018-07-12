## Introduction

A highly concurrent watchdog server implemented as small lightweight erlang processes. 

## Design Goals
- Should be able to process 100s of 1000s of heartbeat messages concurrently
- Should spawn and kill watchdog processes at will
- Configurable timeout value
- Should be able to run thousands of independent timers in isolation
- Configurable endpoint to publish timeout signal with optional data. (A simple HTTP POST request)

