-- mod-version:1 -- lite-xl 1.16

local style = require "core.style"
local common = require "core.common"

local syntax = require "core.syntax"

syntax.add {
  files = { "%.hlsl$", },
  comment = "//",
  patterns = {
    { pattern = "//.-\n",               type = "comment"  },
    { pattern = { "/%*", "%*/" },       type = "comment"  },
    { pattern = { "#", "[^\\]\n" },     type = "comment"  },
    { pattern = { '"', '"', '\\' },     type = "string"   },
    { pattern = { "'", "'", '\\' },     type = "string"   },
    { pattern = "-?0x%x+",              type = "number"   },
    { pattern = "-?%d+[%d%.eE]*f?",     type = "number"   },
    { pattern = "-?%.?%d+f?",           type = "number"   },
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },

    { pattern = "int[1-9]x[1-9]",       type = "keyword2" },
    { pattern = "int1[0-6]x[1-9]",      type = "keyword2" },
    { pattern = "int[1-9]x1[0-6]",      type = "keyword2" },
    { pattern = "int1[0-6]x1[0-6]",     type = "keyword2" },
    { pattern = "int[1-4]",             type = "keyword2" },

    { pattern = "uint[1-9]x[1-9]",      type = "keyword2" },
    { pattern = "uint1[0-6]x[1-9]",     type = "keyword2" },
    { pattern = "uint[1-9]x1[0-6]",     type = "keyword2" },
    { pattern = "uint1[0-6]x1[0-6]",    type = "keyword2" },
    { pattern = "uint[1-4]",            type = "keyword2" },

    { pattern = "dword[1-9]x[1-9]",     type = "keyword2" },
    { pattern = "dword1[0-6]x[1-9]",    type = "keyword2" },
    { pattern = "dword[1-9]x1[0-6]",    type = "keyword2" },
    { pattern = "dword1[0-6]x1[0-6]",   type = "keyword2" },
    { pattern = "dword[1-4]",           type = "keyword2" },

    { pattern = "half[1-9]x[1-9]",      type = "keyword2" },
    { pattern = "half1[0-6]x[1-9]",     type = "keyword2" },
    { pattern = "half[1-9]x1[0-6]",     type = "keyword2" },
    { pattern = "half1[0-6]x1[0-6]",    type = "keyword2" },
    { pattern = "half[1-4]",            type = "keyword2" },

    { pattern = "float[1-9]x[1-9]",     type = "keyword2" },
    { pattern = "float1[0-6]x[1-9]",    type = "keyword2" },
    { pattern = "float[1-9]x1[0-6]",    type = "keyword2" },
    { pattern = "float1[0-6]x1[0-6]",   type = "keyword2" },
    { pattern = "float[1-4]",           type = "keyword2" },

    { pattern = "double[1-9]x[1-9]",    type = "keyword2" },
    { pattern = "double1[0-6]x[1-9]",   type = "keyword2" },
    { pattern = "double[1-9]x1[0-6]",   type = "keyword2" },
    { pattern = "double1[0-6]x1[0-6]",  type = "keyword2" },
    { pattern = "double[1-4]",          type = "keyword2" },

    { pattern = "[%a_][%w_]*%f[(]",     type = "function" },
    { pattern = "[%a_][%w_]*",          type = "symbol"   },
  },
  symbols = {
    --https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl-appendix-keywords
    --The symbols are added in the order they appear on this webpage, which is alphabetically
    ["AppendStructuredBuffer"]= "keyword",
    ["asm"]              = "keyword",
    ["asm_fragment"]     = "keyword",
    ["BlendState"]       = "keyword2",
    ["bool"]             = "keyword2",
    ["break"]            = "keyword",
    ["Buffer"]           = "keyword2",
    ["ByteAddressBuffer"]= "keyword2",
    ["case"]             = "keyword",
    ["cbuffer"]          = "keyword2",
    ["centroid"]         = "keyword2",
    ["class"]            = "keyword",
    ["column_major"]     = "keyword",
    ["compile"]          = "keyword",
    ["compile_fragment"] = "keyword",
    ["CompileShader"]    = "keyword",
    ["const"]            = "keyword",
    ["continue"]         = "keyword",
    ["ComputeShader"]    = "keyword",
    ["ConsumeStructuredBuffer"]= "keyword",
    ["default"]          = "keyword",
    ["DepthStencilState"]= "keyword",
    ["DepthStencilView"] = "keyword",
    ["discard"]          = "keyword",
    ["do"]               = "keyword",
    ["double"]           = "keyword2",
    ["DomainShader"]     = "keyword2",
    ["dword"]            = "keyword2",
    ["else"]             = "keyword",
    ["export"]           = "keyword",
    ["extern"]           = "keyword",
    ["false"]            = "literal",
    ["float"]            = "keyword2",
    ["for"]              = "keyword",
    ["fxgroup"]          = "keyword2",
    ["GeometryShader"]   = "keyword2",
    ["groupshared"]      = "keyword",
    ["half"]             = "keyword2",
    ["HullShader"]       = "keyword2",
    ["if"]               = "keyword",
    ["in"]               = "keyword",
    ["inline"]           = "keyword",
    ["inout"]            = "keyword",
    ["InputPatch"]       = "keyword2",
    ["int"]              = "keyword2",
    ["interface"]        = "keyword",
    ["line"]             = "keyword2",
    ["lineadj"]          = "keyword2",
    ["linear"]           = "keyword",
    ["LineStream"]       = "keyword2",
    ["matrix"]           = "keyword2",
    ["min16float"]       = "keyword2",
    ["min10float"]       = "keyword2",
    ["min16int"]         = "keyword2",
    ["min12int"]         = "keyword2",
    ["min16uint"]        = "keyword2",
    ["namespace"]        = "keyword",
    ["nointerpolation"]  = "keyword",
    ["noperspective"]    = "keyword",
    ["NULL"]             = "literal",
    ["out"]              = "keyword",
    ["OutputPatch"]      = "keyword2",
    ["packoffset"]       = "keyword",
    ["pass"]             = "keyword",
    ["pixelfragment"]    = "keyword",
    ["PixelShader"]      = "keyword2",
    ["point"]            = "keyword2",
    ["PointStream"]      = "keyword2",
    ["precise"]          = "keyword",
    ["RasterizerState"]  = "keyword2",
    ["RenderTargetView"] = "keyword2",
    ["return"]           = "keyword",
    ["register"]         = "keyword",
    ["row_major"]        = "keyword",
    ["RWBuffer"]         = "keyword2",
    ["RWByteAddressBuffer"]= "keyword2",
    ["RWStructuredBuffer"]= "keyword2",
    ["RWTexture1D"]      = "keyword2",
    ["RWTexture1DArray"] = "keyword2",
    ["RWTexture2D"]      = "keyword2",
    ["RWTexture2DArray"] = "keyword2",
    ["RWTexture3D"]      = "keyword2",
    ["sample"]           = "keyword",
    ["sampler"]          = "keyword2",
    ["SamplerState"]     = "keyword2",
    ["SamplerComparisonState"]= "keyword2",
    ["shared"]           = "keyword",
    ["snorm"]            = "keyword",
    ["stateblock"]       = "keyword",
    ["stateblock_state"] = "keyword",
    ["static"]           = "keyword",
    ["string"]           = "keyword2",
    ["struct"]           = "keyword",
    ["switch"]           = "keyword",
    ["StructuredBuffer"] = "keyword2",
    ["tbuffer"]          = "keyword2",
    ["technique"]        = "keyword2",
    ["technique10"]      = "keyword2",
    ["technique11"]      = "keyword2",
    ["texture"]          = "keyword2",
    ["Texture1D"]        = "keyword2",
    ["Texture1DArray"]   = "keyword2",
    ["Texture2D"]        = "keyword2",
    ["Texture2DArray"]   = "keyword2",
    ["Texture2DMS"]      = "keyword2",
    ["Texture2DMSArray"] = "keyword2",
    ["Texture3D"]        = "keyword2",
    ["TextureCube"]      = "keyword2",
    ["TextureCubeArray"] = "keyword2",
    ["true"]             = "literal",
    ["typedef"]          = "keyword",
    ["triangle"]         = "keyword2",
    ["triangleadj"]      = "keyword2",
    ["TriangleStream"]   = "keyword2",
    ["uint"]             = "keyword2",
    ["uniform"]          = "keyword",
    ["unorm"]            = "keyword",
    ["unsigned"]         = "keyword",
    ["vector"]           = "keyword2",
    ["vertexfragment"]   = "keyword2",
    ["VertexShader"]     = "keyword2",
    ["void"]             = "keyword",
    ["volatile"]         = "keyword",
    ["while"]            = "keyword",

    --https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl-intrinsic-functions
    --The symbols are added in the order they appear on this webpage, which is alphabetically
    ["abort"]       = "keyword",
    ["abs"]         = "keyword",
    ["acos"]        = "keyword",
    ["all"]         = "keyword",
    ["any"]         = "keyword",
    ["asdouble"]    = "keyword",
    ["asfloat"]     = "keyword",
    ["asin"]        = "keyword",
    ["asint"]       = "keyword",
    ["asuint"]      = "keyword",
    ["atan"]        = "keyword",
    ["atan2"]       = "keyword",
    ["ceil"]        = "keyword",
    ["clamp"]       = "keyword",
    ["clip"]        = "keyword",
    ["cos"]         = "keyword",
    ["cosh"]        = "keyword",
    ["countbits"]   = "keyword",
    ["cross"]       = "keyword",
    ["ddx"]         = "keyword",
    ["ddx_coarse"]  = "keyword",
    ["ddx_fine"]    = "keyword",
    ["ddy"]         = "keyword",
    ["ddy_coarse"]  = "keyword",
    ["ddy_fine"]    = "keyword",
    ["degrees"]     = "keyword",
    ["determinant"] = "keyword",
    ["distance"]    = "keyword",
    ["dot"]         = "keyword",
    ["dst"]         = "keyword",
    ["errorf"]      = "keyword",
    ["exp"]         = "keyword",
    ["exp2"]        = "keyword",
    ["f16tof32"]    = "keyword",
    ["f32tof16"]    = "keyword",
    ["faceforward"] = "keyword",
    ["firstbithigh"]= "keyword",
    ["firstbitlow"] = "keyword",
    ["floor"]       = "keyword",
    ["fma"]         = "keyword",
    ["fmod"]        = "keyword",
    ["frac"]        = "keyword",
    ["frexp"]       = "keyword",
    ["fwidth"]      = "keyword",
    ["isfinite"]    = "keyword",
    ["isinf"]       = "keyword",
    ["isnan"]       = "keyword",
    ["ldexp"]       = "keyword",
    ["length"]      = "keyword",
    ["lerp"]        = "keyword",
    ["lit"]         = "keyword",
    ["log"]         = "keyword",
    ["log10"]       = "keyword",
    ["log2"]        = "keyword",
    ["mad"]         = "keyword",
    ["max"]         = "keyword",
    ["min"]         = "keyword",
    ["modf"]        = "keyword",
    ["msad4"]       = "keyword",
    ["mul"]         = "keyword",
    ["noise"]       = "keyword",
    ["normalize"]   = "keyword",
    ["pow"]         = "keyword",
    ["printf"]      = "keyword",
    ["radians"]     = "keyword",
    ["rcp"]         = "keyword",
    ["reflect"]     = "keyword",
    ["refract"]     = "keyword",
    ["reversebits"] = "keyword",
    ["round"]       = "keyword",
    ["rsqrt"]       = "keyword",
    ["saturate"]    = "keyword",
    ["sign"]        = "keyword",
    ["sin"]         = "keyword",
    ["sincos"]      = "keyword",
    ["sinh"]        = "keyword",
    ["smoothstep"]  = "keyword",
    ["sqrt"]        = "keyword",
    ["step"]        = "keyword",
    ["tan"]         = "keyword",
    ["tanh"]        = "keyword",
    ["transpose"]   = "keyword",
    ["trunc"]       = "keyword",
  },
}

