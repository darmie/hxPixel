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

package hxpixel.images.gal;

import hxpixel.images.color.Rgb;
import hxpixel.images.color.Rgba;

class GalLayer
{
    public var parent: GalFrame;
    
    public var name: String;
    public var visible: Bool;
    public var isTransparent: Bool;
    public var transparentColorIndex: Int;
    public var density: Int;
    
    public var left:Int;
    public var top:Int;
    public var isLock: Bool;
    
    /* Image Data */
    public var imageData: Array<Int>;
    
    public function new(parent : GalFrame) 
    {
        this.parent = parent;
        
        visible = true;
        isTransparent = false;
        density = 255;
        
        left = 0;
        top = 0;
        isLock = false;
        
        imageData = [];
    }
    
    public function getRbgaPalette() : Array<Rgba>
    {
        var rgbaPalette = new Array<Rgba>();
        var currentPalette = parent.palette;
        
        for (i in 0 ... currentPalette.length) {
            rgbaPalette[i] = currentPalette[i];
            
            if (isTransparent && (i == transparentColorIndex)) {
                rgbaPalette[i].alpha = 0;
            }
        }
        
        return rgbaPalette;
    }
    
    public function getRgbaImageData() : Array<Rgba>
    {
        var rgbaPalette = getRbgaPalette();
        var rgbaImageData = new Array<Rgba>();
        for (i in 0 ... imageData.length) {
            rgbaImageData[i] = rgbaPalette[imageData[i]];
        }
        
        return rgbaImageData;
    }
}