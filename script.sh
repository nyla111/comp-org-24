#!/bin/bash

# Iterate through all directories in the current folder
for dir in */; do
  # Check if the directory contains a "lab6.c" file
  if [ -f "${dir}lab6.c" ]; then
    echo "Processing folder: $dir"

    # Navigate into the directory
    cd "$dir" || continue

    # Compile lab6.c to assembly
    riscv32-unknown-elf-gcc -march=rv32im -mabi=ilp32 -S lab6.c -o lab6.s

    # Check if the compilation was successful
    if [ -f "lab6.s" ]; then
      echo "Generated lab6.s in $dir"
    else
      echo "Failed to compile lab6.c in $dir"
    fi

    # Compile to object file
    riscv32-unknown-elf-gcc -march=rv32im -mabi=ilp32 -c lab6.c -o lab6.o

    # Check if object file is generated
    if [ -f "lab6.o" ]; then
      # Disassemble the object file
      riscv32-unknown-elf-objdump -d lab6.o > disassembled_lab6.txt
      echo "Disassembled lab6.o in $dir"

      # Generate symbol table
      riscv32-unknown-elf-objdump -t lab6.o > symbol_table_lab6.txt
      echo "Generated symbol table for lab6.o in $dir"
    else
      echo "Failed to generate lab6.o in $dir"
    fi

    # Navigate back to the parent directory
    cd ..

  else
    echo "No lab6.c found in $dir"
  fi
done

echo "Processing complete."
