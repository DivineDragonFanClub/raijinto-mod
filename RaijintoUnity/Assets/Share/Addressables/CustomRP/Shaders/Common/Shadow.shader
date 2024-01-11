Shader "CustomRP/Shadow"
{
    Properties
    {
		[Toggle(_KEY_DITHER_ALPHA)] _Key_DitherAlpha ("Dither Alpha", Float) = 0
		_DitherAlphaValue ("Dither Alpha Value", Range(0, 1)) = 1
		[KeywordEnum(DEFAULT,CHARA)] _Tag ("Tag", Float) = 0
    }
    FallBack "Hidden/Universal Render Pipeline/FallbackError"
}
