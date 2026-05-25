# SPDX-FileCopyrightText: ukoOS Contributors
#
# SPDX-License-Identifier: GPL-3.0-or-later

kernel-cflags += -march=armv9-a
target-qemuflags = --machine virt --cpu cortex-a710 --smp 2 -m 1G --netdev user,id=net0 -device rtl8139,netdev=net0,bus=pcie.0
bootstub-startaddr = 0x80080000
 