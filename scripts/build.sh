#!/bin/bash

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"

mkdir -p "$BUILD/iso/boot/grub"

nasm -f elf64 \
    "$ROOT/kernel/arch/x86_64/boot.asm" \
    -o "$BUILD/boot.o"

ld -T "$ROOT/kernel/kernel.ld" \
    -o "$BUILD/kernel.elf" \
    "$BUILD/boot.o"

cp "$BUILD/kernel.elf" "$BUILD/iso/boot/kernel.elf"

grub-mkrescue \
    -o "$BUILD/SingularityOS.iso" \
    "$BUILD/iso"

echo "SingularityOS ISO: $BUILD/SingularityOS.iso"
