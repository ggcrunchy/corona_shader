--- Neighboring pixel mixins.

--
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
--
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- [ MIT license: http://www.opensource.org/licenses/mit-license.php ]
--

-- Exports --
local M = {}

--- DOCME
function M.AddAlphaLogic ()
	return [[
		float GetLaplacian (sampler2D s, vec2 uv, float a0, float thickness)
		{
			a0 *= 4.;
			a0 -= texture2D(s, uv + vec2(thickness * CoronaTexelSize.x, 0.)).a;
			a0 -= texture2D(s, uv - vec2(thickness * CoronaTexelSize.x, 0.)).a;
			a0 -= texture2D(s, uv + vec2(0., thickness * CoronaTexelSize.y)).a;
			a0 -= texture2D(s, uv - vec2(0., thickness * CoronaTexelSize.y)).a;

			return a0;
		}
	]]
end

--- DOCME
function M.AddPixelLogic ()
	return [[
		vec4 GetAbovePixel (sampler2D s, vec2 uv)
		{
			return texture2D(s, uv + vec2(0., CoronaTexelSize.y));
		}

		vec4 GetRightPixel (sampler2D s, vec2 uv)
		{
			return texture2D(s, uv + vec2(CoronaTexelSize.x, 0.));
		}
	]]
end

-- Export the module.
return M