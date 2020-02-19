#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[0] = LAYOUT(
		KC_KP_DOT, KC_KP_SLASH, KC_KP_ASTERISK, KC_BSPACE,
		KC_7, KC_8, KC_9, KC_KP_PLUS,
		KC_4, KC_5, KC_6, KC_KP_MINUS,
		KC_1, KC_2, KC_3, LT(1, KC_ENTER)),
[1] = LAYOUT(
		M(0), M(1), M(2), M(3),
		M(2), KC_8, KC_9, KC_UP,
		M(4), KC_5, KC_6, KC_DOWN,
		M(5), KC_2, KC_3, KC_0),
};


const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt) {

switch (id) {
    case 0:
    if (record->event.pressed) {
    return MACRO( T(X), T(C), T(1), T(1), T(2), T(5), T(9), T(3), T(7), T(5), END );
    }
    break;
    case 1:
    if (record->event.pressed) {
    return MACRO( T(H), T(A), T(L), T(X), T(G), T(C), T(F), T(L), D(LSFT), T(2), U(LSFT), T(SCLN), T(G), T(L), T(A), T(E), T(I), T(L), END );
    }
    break;
    case 2:
    if (record->event.pressed) {
    return MACRO( D(LSFT), T(7), U(LSFT), T(6), T(1), T(4), D(LSFT), T(2), U(LSFT), T(7), T(2), T(5), D(LSFT), T(4), END );
    }
    break;
    case 3:
    if (record->event.pressed) {
    return MACRO( T(SCLN), T(1), T(5), T(4), T(9), T(4), T(2), T(6), T(3), T(0), END );
    }
    break;
    case 4:
    if (record->event.pressed) {
    return MACRO( D(LSFT), T(P), U(LSFT), T(G), T(L), T(F), T(B), T(1), T(1), T(2), T(5), END );
    }
    break;
    case 5:
    if (record->event.pressed) {
    return MACRO( T(1), T(7), T(5), T(4), T(5), T(1), T(2), T(7), T(6), T(1), T(4), END );
    }
    break;
}
    return MACRO_NONE;
}


#ifdef OLED_DRIVER_ENABLE
static void render_logo(void) {
  static const char PROGMEM qmk_logo[] = {
    0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,0x90,0x91,0x92,0x93,0x94,
    0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,0xb0,0xb1,0xb2,0xb3,0xb4,
    0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,0xd0,0xd1,0xd2,0xd3,0xd4,0};

  oled_write_P(qmk_logo, false);
}

void oled_task_user(void) { render_logo(); }
#endif


void encoder_update_user(uint8_t index, bool clockwise) {
  if (index == 0) {
    if (clockwise) {
      tap_code(KC_F8);
    } else {
      tap_code(KC_F9);
    }
  } else if (index == 1) {
    if (clockwise) {
      tap_code(KC_MS_UP);
    } else {
      tap_code(KC_MS_DOWN);
    }
  }
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {

  return true;
}

void matrix_init_user(void) { render_logo(); }

void matrix_scan_user(void) {}

void led_set_user(uint8_t usb_led) {}
