/*
 * SPDX-FileCopyrightText: ukoOS Contributors
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#include <arch/aarch64/insns.h>

[[noreturn]]
void _panic_halt(void) {
  // TODO: Power off.

  // Loop forever.
  for (;;) {
    // TODO: wfi();
  }
}

void _panic_begin(void) {
  // If we get an exception, just go to the halt function anyway.
  csrw(RISCV64_CSR_STVEC, (uptr)_panic_halt);
}
