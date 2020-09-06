function new_x = fun_minmax_normalize(x)

new_x = (x - min(x)) / (max(x) - min(x));
