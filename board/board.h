/*
    ChibiOS - Copyright (C) 2006-2026 Giovanni Di Sirio.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

/*
 * This file has been automatically generated using ChibiStudio board
 * generator plugin. Do not edit manually.
 */

#ifndef BOARD_H
#define BOARD_H

/*===========================================================================*/
/* Driver constants.                                                         */
/*===========================================================================*/

/*
 * Setup for WeAct STM32F405RG core board + CAN IO shield board.
 */

/*
 * Board identifier.
 */
#define BOARD_WEACT_STM32F405_CANIO
#define BOARD_NAME                  "WeAct STM32F405RG core board + CAN IO shield"

/*
 * Board oscillators-related settings.
 * NOTE: LSE not fitted.
 */
#if !defined(STM32_LSECLK)
#define STM32_LSECLK                0U
#endif

#if !defined(STM32_HSECLK)
#define STM32_HSECLK                8000000U
#endif

/*
 * Board voltages.
 * Required for performance limits calculation.
 */
#define STM32_VDD                   300U

/*
 * MCU type as defined in the ST header.
 */
#undef STM32F405xx
#define STM32F405xx

/* PA9 is an output on this board: no VBUS sensing */
#define BOARD_OTG_NOVBUSSENS

/*
 * IO pins assignments.
 */
#define GPIOA_BUTTON                0U
#define GPIOA_PIN1                  1U
#define GPIOA_PIN2                  2U
#define GPIOA_PIN3                  3U
#define GPIOA_LRCK                  4U
#define GPIOA_SPC                   5U
#define GPIOA_SDO                   6U
#define GPIOA_SDI                   7U
#define GPIOA_PIN8                  8U
#define GPIOA_VBUS_FS               9U
#define GPIOA_OTG_FS_ID             10U
#define GPIOA_OTG_FS_DM             11U
#define GPIOA_OTG_FS_DP             12U
#define GPIOA_SWDIO                 13U
#define GPIOA_SWCLK                 14U
#define GPIOA_PIN15                 15U

#define GPIOB_PIN0                  0U
#define GPIOB_PIN1                  1U
#define GPIOB_PIN2                  2U
#define GPIOB_SWO                   3U
#define GPIOB_PIN4                  4U
#define GPIOB_PIN5                  5U
#define GPIOB_SCL                   6U
#define GPIOB_PIN7                  7U
#define GPIOB_PIN8                  8U
#define GPIOB_SDA                   9U
#define GPIOB_CLK_IN                10U
#define GPIOB_PIN11                 11U
#define GPIOB_PIN12                 12U
#define GPIOB_PIN13                 13U
#define GPIOB_PIN14                 14U
#define GPIOB_PIN15                 15U

#define GPIOC_OTG_FS_POWER_ON       0U
#define GPIOC_PIN1                  1U
#define GPIOC_PIN2                  2U
#define GPIOC_PDM_OUT               3U
#define GPIOC_PIN4                  4U
#define GPIOC_PIN5                  5U
#define GPIOC_PIN6                  6U
#define GPIOC_MCLK                  7U
#define GPIOC_PIN8                  8U
#define GPIOC_PIN9                  9U
#define GPIOC_SCLK                  10U
#define GPIOC_PIN11                 11U
#define GPIOC_SDIN                  12U
#define GPIOC_PIN13                 13U
#define GPIOC_PIN14                 14U
#define GPIOC_PIN15                 15U

#define GPIOD_PIN0                  0U
#define GPIOD_PIN1                  1U
#define GPIOD_PIN2                  2U
#define GPIOD_PIN3                  3U
#define GPIOD_RESET                 4U
#define GPIOD_OVER_CURRENT          5U
#define GPIOD_PIN6                  6U
#define GPIOD_PIN7                  7U
#define GPIOD_PIN8                  8U
#define GPIOD_PIN9                  9U
#define GPIOD_PIN10                 10U
#define GPIOD_PIN11                 11U
#define GPIOD_LED4                  12U
#define GPIOD_LED3                  13U
#define GPIOD_LED5                  14U
#define GPIOD_LED6                  15U

#define GPIOE_INT1                  0U
#define GPIOE_INT2                  1U
#define GPIOE_PIN2                  2U
#define GPIOE_CS_SPI                3U
#define GPIOE_PIN4                  4U
#define GPIOE_PIN5                  5U
#define GPIOE_PIN6                  6U
#define GPIOE_PIN7                  7U
#define GPIOE_PIN8                  8U
#define GPIOE_PIN9                  9U
#define GPIOE_PIN10                 10U
#define GPIOE_PIN11                 11U
#define GPIOE_PIN12                 12U
#define GPIOE_PIN13                 13U
#define GPIOE_PIN14                 14U
#define GPIOE_PIN15                 15U

#define GPIOF_PIN0                  0U
#define GPIOF_PIN1                  1U
#define GPIOF_PIN2                  2U
#define GPIOF_PIN3                  3U
#define GPIOF_PIN4                  4U
#define GPIOF_PIN5                  5U
#define GPIOF_PIN6                  6U
#define GPIOF_PIN7                  7U
#define GPIOF_PIN8                  8U
#define GPIOF_PIN9                  9U
#define GPIOF_PIN10                 10U
#define GPIOF_PIN11                 11U
#define GPIOF_PIN12                 12U
#define GPIOF_PIN13                 13U
#define GPIOF_PIN14                 14U
#define GPIOF_PIN15                 15U

#define GPIOG_PIN0                  0U
#define GPIOG_PIN1                  1U
#define GPIOG_PIN2                  2U
#define GPIOG_PIN3                  3U
#define GPIOG_PIN4                  4U
#define GPIOG_PIN5                  5U
#define GPIOG_PIN6                  6U
#define GPIOG_PIN7                  7U
#define GPIOG_PIN8                  8U
#define GPIOG_PIN9                  9U
#define GPIOG_PIN10                 10U
#define GPIOG_PIN11                 11U
#define GPIOG_PIN12                 12U
#define GPIOG_PIN13                 13U
#define GPIOG_PIN14                 14U
#define GPIOG_PIN15                 15U

#define GPIOH_OSC_IN                0U
#define GPIOH_OSC_OUT               1U
#define GPIOH_PIN2                  2U
#define GPIOH_PIN3                  3U
#define GPIOH_PIN4                  4U
#define GPIOH_PIN5                  5U
#define GPIOH_PIN6                  6U
#define GPIOH_PIN7                  7U
#define GPIOH_PIN8                  8U
#define GPIOH_PIN9                  9U
#define GPIOH_PIN10                 10U
#define GPIOH_PIN11                 11U
#define GPIOH_PIN12                 12U
#define GPIOH_PIN13                 13U
#define GPIOH_PIN14                 14U
#define GPIOH_PIN15                 15U

#define GPIOI_PIN0                  0U
#define GPIOI_PIN1                  1U
#define GPIOI_PIN2                  2U
#define GPIOI_PIN3                  3U
#define GPIOI_PIN4                  4U
#define GPIOI_PIN5                  5U
#define GPIOI_PIN6                  6U
#define GPIOI_PIN7                  7U
#define GPIOI_PIN8                  8U
#define GPIOI_PIN9                  9U
#define GPIOI_PIN10                 10U
#define GPIOI_PIN11                 11U
#define GPIOI_PIN12                 12U
#define GPIOI_PIN13                 13U
#define GPIOI_PIN14                 14U
#define GPIOI_PIN15                 15U

/*
 * IO lines assignments.
 */
#define LINE_BUTTON                 PAL_LINE(GPIOA, 0U)
#define LINE_LRCK                   PAL_LINE(GPIOA, 4U)
#define LINE_SPC                    PAL_LINE(GPIOA, 5U)
#define LINE_SDO                    PAL_LINE(GPIOA, 6U)
#define LINE_SDI                    PAL_LINE(GPIOA, 7U)
#define LINE_VBUS_FS                PAL_LINE(GPIOA, 9U)
#define LINE_OTG_FS_ID              PAL_LINE(GPIOA, 10U)
#define LINE_OTG_FS_DM              PAL_LINE(GPIOA, 11U)
#define LINE_OTG_FS_DP              PAL_LINE(GPIOA, 12U)
#define LINE_SWDIO                  PAL_LINE(GPIOA, 13U)
#define LINE_SWCLK                  PAL_LINE(GPIOA, 14U)
#define LINE_SWO                    PAL_LINE(GPIOB, 3U)
#define LINE_SCL                    PAL_LINE(GPIOB, 6U)
#define LINE_SDA                    PAL_LINE(GPIOB, 9U)
#define LINE_CLK_IN                 PAL_LINE(GPIOB, 10U)
#define LINE_OTG_FS_POWER_ON        PAL_LINE(GPIOC, 0U)
#define LINE_PDM_OUT                PAL_LINE(GPIOC, 3U)
#define LINE_MCLK                   PAL_LINE(GPIOC, 7U)
#define LINE_SCLK                   PAL_LINE(GPIOC, 10U)
#define LINE_SDIN                   PAL_LINE(GPIOC, 12U)
#define LINE_RESET                  PAL_LINE(GPIOD, 4U)
#define LINE_OVER_CURRENT           PAL_LINE(GPIOD, 5U)
#define LINE_LED4                   PAL_LINE(GPIOD, 12U)
#define LINE_LED3                   PAL_LINE(GPIOD, 13U)
#define LINE_LED5                   PAL_LINE(GPIOD, 14U)
#define LINE_LED6                   PAL_LINE(GPIOD, 15U)
#define LINE_INT1                   PAL_LINE(GPIOE, 0U)
#define LINE_INT2                   PAL_LINE(GPIOE, 1U)
#define LINE_CS_SPI                 PAL_LINE(GPIOE, 3U)
#define LINE_OSC_IN                 PAL_LINE(GPIOH, 0U)
#define LINE_OSC_OUT                PAL_LINE(GPIOH, 1U)

/*===========================================================================*/
/* Driver pre-compile time settings.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Derived constants and error checks.                                       */
/*===========================================================================*/

/*===========================================================================*/
/* Driver data structures and types.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Driver macros.                                                            */
/*===========================================================================*/

/*
 * I/O ports initial setup, this configuration is established soon after reset
 * in the initialization code.
 * Please refer to the STM32 Reference Manual for details.
 */
#define PIN_MODE_INPUT(n)           (0U << ((n) * 2U))
#define PIN_MODE_OUTPUT(n)          (1U << ((n) * 2U))
#define PIN_MODE_ALTERNATE(n)       (2U << ((n) * 2U))
#define PIN_MODE_ANALOG(n)          (3U << ((n) * 2U))
#define PIN_ODR_LOW(n)              (0U << (n))
#define PIN_ODR_HIGH(n)             (1U << (n))
#define PIN_OTYPE_PUSHPULL(n)       (0U << (n))
#define PIN_OTYPE_OPENDRAIN(n)      (1U << (n))
#define PIN_OSPEED_VERYLOW(n)       (0U << ((n) * 2U))
#define PIN_OSPEED_LOW(n)           (1U << ((n) * 2U))
#define PIN_OSPEED_MEDIUM(n)        (2U << ((n) * 2U))
#define PIN_OSPEED_HIGH(n)          (3U << ((n) * 2U))
#define PIN_PUPDR_FLOATING(n)       (0U << ((n) * 2U))
#define PIN_PUPDR_PULLUP(n)         (1U << ((n) * 2U))
#define PIN_PUPDR_PULLDOWN(n)       (2U << ((n) * 2U))
#define PIN_AFIO_AF(n, v)           ((v) << (((n) % 8U) * 4U))

/*
 * Default pin setup. Everything is an input with pull-down except USB (PA11/PA12) and SWD (PA13/PA14).
 * The firmware configures each pin when the matching function starts.
 */
#define VAL_GPIOA_MODER   0x2A800000U
#define VAL_GPIOA_OTYPER  0x00000000U
#define VAL_GPIOA_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOA_PUPDR   0xA42AAAAAU
#define VAL_GPIOA_ODR     0x00000000U
#define VAL_GPIOA_AFRL    0x00000000U
#define VAL_GPIOA_AFRH    0x000AA000U

#define VAL_GPIOB_MODER   0x00000000U
#define VAL_GPIOB_OTYPER  0x00000000U
#define VAL_GPIOB_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOB_PUPDR   0xAAAAAAAAU
#define VAL_GPIOB_ODR     0x00000000U
#define VAL_GPIOB_AFRL    0x00000000U
#define VAL_GPIOB_AFRH    0x00000000U

#define VAL_GPIOC_MODER   0x00000000U
#define VAL_GPIOC_OTYPER  0x00000000U
#define VAL_GPIOC_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOC_PUPDR   0xAAAAAAAAU
#define VAL_GPIOC_ODR     0x00000000U
#define VAL_GPIOC_AFRL    0x00000000U
#define VAL_GPIOC_AFRH    0x00000000U

#define VAL_GPIOD_MODER   0x00000000U
#define VAL_GPIOD_OTYPER  0x00000000U
#define VAL_GPIOD_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOD_PUPDR   0xAAAAAAAAU
#define VAL_GPIOD_ODR     0x00000000U
#define VAL_GPIOD_AFRL    0x00000000U
#define VAL_GPIOD_AFRH    0x00000000U

#define VAL_GPIOE_MODER   0x00000000U
#define VAL_GPIOE_OTYPER  0x00000000U
#define VAL_GPIOE_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOE_PUPDR   0xAAAAAAAAU
#define VAL_GPIOE_ODR     0x00000000U
#define VAL_GPIOE_AFRL    0x00000000U
#define VAL_GPIOE_AFRH    0x00000000U

#define VAL_GPIOF_MODER   0x00000000U
#define VAL_GPIOF_OTYPER  0x00000000U
#define VAL_GPIOF_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOF_PUPDR   0xAAAAAAAAU
#define VAL_GPIOF_ODR     0x00000000U
#define VAL_GPIOF_AFRL    0x00000000U
#define VAL_GPIOF_AFRH    0x00000000U

#define VAL_GPIOG_MODER   0x00000000U
#define VAL_GPIOG_OTYPER  0x00000000U
#define VAL_GPIOG_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOG_PUPDR   0xAAAAAAAAU
#define VAL_GPIOG_ODR     0x00000000U
#define VAL_GPIOG_AFRL    0x00000000U
#define VAL_GPIOG_AFRH    0x00000000U

#define VAL_GPIOH_MODER   0x00000000U
#define VAL_GPIOH_OTYPER  0x00000000U
#define VAL_GPIOH_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOH_PUPDR   0xAAAAAAA0U
#define VAL_GPIOH_ODR     0x00000000U
#define VAL_GPIOH_AFRL    0x00000000U
#define VAL_GPIOH_AFRH    0x00000000U

#define VAL_GPIOI_MODER   0x00000000U
#define VAL_GPIOI_OTYPER  0x00000000U
#define VAL_GPIOI_OSPEEDR 0xFFFFFFFFU
#define VAL_GPIOI_PUPDR   0xAAAAAAAAU
#define VAL_GPIOI_ODR     0x00000000U
#define VAL_GPIOI_AFRL    0x00000000U
#define VAL_GPIOI_AFRH    0x00000000U

/*===========================================================================*/
/* External declarations.                                                    */
/*===========================================================================*/

#if !defined(_FROM_ASM_)
#ifdef __cplusplus
extern "C" {
#endif
  void boardInit(void);
#ifdef __cplusplus
}
#endif
#endif /* _FROM_ASM_ */

#endif /* BOARD_H */
