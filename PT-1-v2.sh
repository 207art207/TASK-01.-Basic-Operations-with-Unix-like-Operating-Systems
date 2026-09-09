#!/bin/bash

echo "task-a"
ps -eo pid,user,pri,stat,comm | tee ps-1.txt &&
  echo

echo "task-b"
top -b -n 1 | tee top.txt &&
  echo

echo "task-c"
ps -eo pid,user,pri,stat,comm | tee ps-2.txt &&
  echo

echo "task-d"
diff -y ps-1.txt ps-2.txt | tee changes.txt
echo

echo "task-e"
awk '{print $2}' <(tail -n +2 ps-1.txt) <(tail -n +2 ps-2.txt) | sort -u | tee pipelines.txt &&
  echo &&
  ls &&
  echo &&
  echo "successful operation"
