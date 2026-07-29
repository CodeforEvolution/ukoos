/*
 * SPDX-FileCopyrightText: ukoOS Contributors
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef UKO_OS_KERNEL__ARCH_AARCH64_CONSTANTS_H
#define UKO_OS_KERNEL__ARCH_AARCH64_CONSTANTS_H 1

/**
 * AARCH64-specific constants.
 */

#include <types.h>

constexpr usize PAGE_BITS = 12;

// TODO: Should this formula live in a different header?
constexpr usize PAGE_SIZE = 1 << PAGE_BITS;

#endif // UKO_OS_KERNEL__ARCH_AARCH64_CONSTANTS_H
