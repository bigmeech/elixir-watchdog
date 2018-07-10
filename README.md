## Introduction

A highly concurrent watchdog server implemented as small lightweight erlang processes. 

## Goals
- Should be able to process 100s of 1000s of heartbeat messages concurrently
- Should spawn and kill watchdog processes at will
- Configurable timeout value
- Should be able to run thousands of independent timers in isolation
- Configurable endpoint to publish timeout signal with optional data. (A simple HTTP POST request)

## Process Encapsulation
Normally to hold state in an elixir process, you'd have to pass it through series of function calls by way of recursion. Retrieving this state outside its containing process requires sending messages to the process as long as you know its `pid`. 

Elixir provides us with a nice little gem called `Agents` which make this whole charade easier instead of dealing with the mechanics yourself.

This server however has a special requirement in that we dont want to keep the process running forever, but rather need it to timeout and die after a set number of time.

