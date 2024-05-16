#!/bin/sh


{ echo keydown A; sleep $1; echo key H shift+1; } | DOTOOL_XKB_LAYOUT=de dotool
