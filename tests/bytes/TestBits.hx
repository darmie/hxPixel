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

package tests.bytes;

import haxe.unit.TestCase;

import hxpixel.bytes.Bits;

class TestBits extends TestCase
{

    public function testWriteBit()
    {
        var bits:Bits = Bits.fromIntBits(0, 1);
        assertEquals(0, bits.toInt());
        
        bits.writeBit(true);
        assertEquals(2, bits.toInt());
        
        bits.writeBit(false);
        assertEquals(2, bits.toInt());
        
        bits.writeBit(true);
        assertEquals(10, bits.toInt());
        
        bits.writeBit(true);
        assertEquals(26, bits.toInt());
    }
    
}