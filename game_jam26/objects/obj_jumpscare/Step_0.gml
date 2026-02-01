// Aumenta a escala rapidamente (ajuste o 0.2 para ser mais rápido ou lento)
image_xscale += 0.2;
image_yscale += 0.2;

// Opcional: faz ele tremer um pouco enquanto cresce
x = x_centro + irandom_range(-5, 5);
y = y_centro + irandom_range(-5, 5);