def hex_to_hsl(hex_color):
    ## strip the # from the hex color
    hex_color = hex_color.lstrip('#')
    
    ## check if the hex color has an alpha value
    alpha = False
    if len(hex_color) == 8:
        alpha = True

    ## convert the hex color to RGB
    if not alpha:  ## If no alpha value
        r = int(hex_color[0:2], 16) / 255
        g = int(hex_color[2:4], 16) / 255
        b = int(hex_color[4:6], 16) / 255
    elif alpha: ## If alpha value
        r = int(hex_color[0:2], 16) / 255
        g = int(hex_color[2:4], 16) / 255
        b = int(hex_color[4:6], 16) / 255
        a = int(hex_color[6:8], 16) / 255 if len(hex_color) == 8 else 1.0
    else:
        raise ValueError('Invalid hex color')
    
    ## find the max, min, and color delta (difference between max and min)
    max_color = max(r, g, b)
    min_color = min(r, g, b)
    color_delta = max_color - min_color

    ## calculate the luminance
    luminance = (max_color + min_color) / 2

    ## calculate the saturation
    if color_delta == 0:
        saturation = 0
    else:
        saturation = color_delta / (1 - abs(2 * luminance - 1))

    ## calculate the hue
    if color_delta == 0:
        hue = 0
    else:
        if max_color == r:
            hue = ((g - b) / color_delta) % 6
        elif max_color == g:
            hue = ((b - r) / color_delta) + 2
        elif max_color == b:
            hue = ((r - g) / color_delta) + 4
        
        hue *= 60
        if hue < 0:
            hue += 360

    ## round the values to 2 decimal places
    h = round(hue, 2)
    s = round(saturation, 2)
    l = round(luminance, 2)
    a = round(a, 2) if alpha else None

    ## return the HSL values
    return (h, s, l, a) if alpha else (h, s, l)

def hsl_to_hex(h, s, l, a=1.0):
    ## convert saturation and luminance to percentages
    saturation /= 100.0
    luminance /= 100.0

    ## calculate the chroma
    chroma = (1 - abs(2 * luminance - 1)) * saturation

    ## determine rgb values based on the hue
    if h in range(0, 60):
        r = chroma
        g = chroma * h / 60
        b = 0
    elif h in range(60, 120):
        r = chroma * (120 - h) / 60
        g = chroma
        b = 0
    elif h in range(120, 180):
        r = 0
        g = chroma
        b = chroma * (h - 120) / 60
    elif h in range(180, 240):
        r = 0
        g = chroma * (240 - h) / 60
        b = chroma
    elif h in range(240, 300):
        r = chroma * (h - 240) / 60
        g = 0
        b = chroma
    elif h in range(300, 360):
        r = chroma
        g = 0
        b = chroma * (360 - h) / 60
    else:
        raise ValueError('Invalid value')
    
    ## calculate the rgb values
    red = round((r + (l - 0.5 * chroma)) * 255)
    green = round((g + (l - 0.5 * chroma)) * 255)
    blue = round((b + (l - 0.5 * chroma)) * 255)

    alpha = round(a * 255)

    ## convert the rgb values to hex
    return f"#{red:02x}{green:02x}{blue:02x}{alpha:02x}" if alpha else f"#{red:02x}{green:02x}{blue:02x}"