"""draw kitty tab"""
# pyright: reportMissingImports=false
# pylint: disable=E0401,C0116,C0103,W0603,R0913

import datetime

from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    TabBarData,
    as_rgb,
    draw_tab_with_powerline,
    draw_title,
)
from kitty.utils import color_as_int

opts = get_options()

ICON: str = " LEI "
ICON_LENGTH: int = len(ICON)
ICON_FG: int = as_rgb(color_as_int(opts.color16))
ICON_BG: int = as_rgb(color_as_int(opts.color8))

if opts.active_tab_foreground is not None:
    FG = as_rgb(color_as_int(opts.active_tab_foreground))
else:
    FG = as_rgb(color_as_int(opts.color15))
if opts.active_tab_background is not None:
    BG = as_rgb(color_as_int(opts.active_tab_background))
else:
    BG = as_rgb(color_as_int(opts.color8))

if opts.inactive_tab_foreground is not None:
    INACTIVE_FG = as_rgb(color_as_int(opts.inactive_tab_foreground))
else:
    INACTIVE_FG = as_rgb(color_as_int(opts.color15))
if opts.inactive_tab_background is not None:
    INACTIVE_BG = as_rgb(color_as_int(opts.inactive_tab_background))
else:
    INACTIVE_BG = as_rgb(color_as_int(opts.color8))

CLOCK_FG = as_rgb(color_as_int(opts.color8))
CLOCK_BG = as_rgb(color_as_int(opts.color15))
DATE_FG = 0
DATE_BG = as_rgb(color_as_int(opts.color8))


def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return screen.cursor.x

    fg, bg, bold, italic = (
        screen.cursor.fg,
        screen.cursor.bg,
        screen.cursor.bold,
        screen.cursor.italic,
    )
    screen.cursor.bold, screen.cursor.italic, screen.cursor.fg, screen.cursor.bg = (
        True,
        False,
        ICON_FG,
        ICON_BG,
    )
    # screen.draw(ICON)
    # set cursor position
    # screen.cursor.x = ICON_LENGTH
    # restore color style
    screen.cursor.fg, screen.cursor.bg, screen.cursor.bold, screen.cursor.italic = (
        fg,
        bg,
        bold,
        italic,
    )
    return screen.cursor.x


def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
    use_kitty_render_function: bool = False,
) -> int:
    left_sep, right_sep = (" ", "")
    fg = FG if tab.is_active else INACTIVE_FG
    bg = BG if tab.is_active else INACTIVE_BG

    def draw_sep(sep: str) -> None:
        if tab.is_active:
            screen.cursor.bg = INACTIVE_BG  # draw_data.default_bg
            screen.cursor.fg = BG
        else:
            screen.cursor.bg = BG
            screen.cursor.fg = INACTIVE_BG

        screen.draw(sep)

        if tab.is_active:
            screen.cursor.fg = FG  # draw_data.default_bg
            screen.cursor.bg = BG
        else:
            screen.cursor.fg = INACTIVE_FG
            screen.cursor.bg = INACTIVE_BG

    if use_kitty_render_function:
        # Use `kitty` function render tab
        end = draw_tab_with_powerline(
            draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
        )
        return end

    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)
    screen.draw(" ")

    # draw tab title
    draw_title(draw_data, screen, tab, index)

    trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
    max_title_length -= trailing_spaces
    extra = screen.cursor.x - before - max_title_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        # Don't change `ICON`
        screen.cursor.x = max(screen.cursor.x, ICON_LENGTH)
        screen.draw("…")
    if trailing_spaces:
        screen.draw(" " * trailing_spaces)

    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = fg
    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        # screen.draw(draw_data.sep)
    draw_sep(right_sep)

    screen.cursor.bg = 0
    return screen.cursor.x


def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return screen.cursor.x

    cells = [
        (CLOCK_FG, CLOCK_BG, datetime.datetime.now().strftime(" %H:%M ")),
        (DATE_FG, DATE_BG, datetime.datetime.now().strftime(" %Y/%m/%d ")),
    ]

    right_status_length = 0
    for _, _, cell in cells:
        right_status_length += len(cell)

    draw_spaces = screen.columns - screen.cursor.x - right_status_length
    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)

    for fg, bg, cell in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    screen.cursor.x = max(screen.cursor.x, screen.columns - right_status_length)
    return screen.cursor.x


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    # _draw_icon(screen, index)

    # Set cursor to where `left_status` ends, instead `right_status`,
    # to enable `open new tab` feature

    end = _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
        use_kitty_render_function=False,
    )

    _draw_right_status(
        screen,
        is_last,
    )
    return end
