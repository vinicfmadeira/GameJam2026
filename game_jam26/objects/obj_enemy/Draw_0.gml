draw_self();

if (nivel_bloodlust > 0) {
    draw_set_color(c_red);
    draw_set_alpha(0.4);
    draw_circle(x, y, 16 + nivel_bloodlust * 6, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
