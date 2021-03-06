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

package tests.images.gif;

import haxe.unit.TestCase;
import hxpixel.images.gif.GifDecoder;
import hxpixel.images.gif.GifFrame;
import hxpixel.images.gif.GifImage;

import hxpixel.images.png.PngDecoder;
import hxpixel.images.png.PngImage;

import tests.utils.PathUtils;

import sys.FileSystem;
import sys.io.File;

class TestGifDecoder extends TestCase
{
    public function testDecode()
    {
        var gifAssetArray = FileSystem.readDirectory(PathUtils.PATH_DIR_ASSET_GIF);
        
        for (fileName in gifAssetArray) {
            
            var fileNameWithoutExt = PathUtils.removeFileExtension(fileName);
            
            if(FileSystem.exists(PathUtils.PATH_DIR_ASSET_PNG + fileNameWithoutExt + ".png")) {
                compareWithPngDecoder(fileNameWithoutExt);
            }
        }
    }
    
    function compareWithPngDecoder(fileNameWithoutExt : String)
    {
        var gifBytes = File.getBytes(PathUtils.PATH_DIR_ASSET_GIF + fileNameWithoutExt + ".gif");
        var gifInfo = GifDecoder.decode(gifBytes);
        var gifFrameInfo = gifInfo.frameList[0];
        var gifRgbaArray = gifFrameInfo.getRgbaImageData();
        
        var pngBytes = File.getBytes(PathUtils.PATH_DIR_ASSET_PNG + fileNameWithoutExt + ".png");
        var pngInfo = PngDecoder.decode(pngBytes);
        var pngRgbaArray = pngInfo.getRgbaImageData();
        
        for (i in 0 ... gifRgbaArray.length) {
            if (gifRgbaArray[i] != pngRgbaArray[i]) {
                trace("file: " + fileNameWithoutExt);
                trace("[" + i % gifFrameInfo.imageWidth + ", " + Std.int(i / gifFrameInfo.imageWidth) + "]");
                trace(gifRgbaArray[i].toString() + " <> " + pngRgbaArray[i].toString());
            }
            
            assertEquals(gifRgbaArray[i], pngRgbaArray[i]);
            
        }
    }
    
}