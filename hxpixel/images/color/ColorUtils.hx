/*
 * Copyright (c) heriet [http://heriet.info/].
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package hxpixel.images.color;

import haxe.io.Input;

class ColorUtils
{
  
    public static function readRgb(input: Input) : Rgb
    {
        var red = input.readByte();
        var green = input.readByte();
        var blue = input.readByte();
        
        return Rgb.fromComponents(red, green, blue);
    }
    
    public static function readBgr(input: Input) : Rgb
    {
        var blue = input.readByte();
        var green = input.readByte();
        var red = input.readByte();
        
        return Rgb.fromComponents(red, green, blue);
    }
    
    public static function readRgba(input: Input) : Rgba
    {
        var red = input.readByte();
        var green = input.readByte();
        var blue = input.readByte();
        var alpha = input.readByte();
        
        return Rgba.fromComponents(red, green, blue, alpha);
    }
}