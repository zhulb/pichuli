�S
��������             ��������              Invalid Option
 Syntax error
�F*u4�F*t<w<ar<zw$��S�  :�u����� tC��r�[�<w<Ar<Zw �S�  :�u����� tC��r�[�V���<r8tF��^�
   Rf+�f+Ɋ��0;�sf�&�f�F��u�Z�f+�f�6���v��R���Z��0�ª�*���Ӵ�t*��<t�<t�*��+Ӆ�t�+�û �֋BB�@�!ËV�N�  *��B�!�~$����  �?�!s+���� ��u��t
����uOu���<u�N+��~��+ۀ<t0�<t<	u� �C��u���C��<t�<u��<uF���<
uF^��-F�V Ë^ �N � ��:�w� ��;^s����uIC��v(<"u��CI��;^sˊCI��"u<"t����t�:�u�.���ۋ^ �N ;^s��C�����ËV;�v��}� uO��Ë�+Nv��^^";�v�SKO����;^vK� ��_À<!uF�V(���L���u���Ь< t�N<+t<-uF���.���-u�� �y���F �f* �����tH=v�F �<,t�N������u��uH�F �F& �F' �< t�N<$u/F������s��V&�< t�N<:uF�< t�<$t�N�X�:V(v�V(�V'�<,t�< t�N�*�<Uu�N*F<Lu�N*F�< t�N��<RuF��w���u�F ��t=��t�F"�N*�< t�N<]t�É~�~& u������V&�B���:V'w� ����F*t���ÿ$�~�v��$'w�<t�<[u�<[uF���v�<-u�<+u	�
��~�^<=u������tH����+F+�v� ��?<"u�<]t<tF<"t����'<~u�����s��<#uf�F�~)���N�s�r�< t�N<]uF�f���[��v�F,�<uê�P��< t�N</t�F������<St<Bu�G�< t
���r��{ � ���<Lu7�	�1�f��u@f�F�<-t�<:uF�	��f;Fvf�F��<*uF�N+�<Nu�	���f�F�	(��F)�{�<Eu�N+�p�<Wu������u�����F$�W��F,�-��� �� �< t�N<t�</?u�� ����p �(��v�$+ɻ �@�!����F+uUf�Ff�Ff;Fr��u�F+t'�<�<-t
�V����
��$��)ѻ �@�!�N+f�F�F+t��F+t
f�Ff;Fr��~,u�?�}��  �>�!� �>�!�L�F,�!         ����       $                 ,;=                             :LMOD 1.3 Filter (c) 2002 Horst Schaeffer
Syntax: LMOD options string_with_tokens
Options:
	/Ln[-m] line [range] to select (default: first non blank line)
	/L[n]*  all lines [starting n]
	/E      include empty input lines (default: no output)
	/S..    delimiters for word extraction, instead of default (,;=)
	/B..    as /S, but excluding blank space as delimiter
	/Nn     starting line number (for token [#]), default: /N001
Insert from source line (expression in square brackets):
 [p,l $n U|L Rn]  default []: complete line
	p,l     from position p, length l (default rest of line)
	$n      word number n ("!" for last word); optionally �offset
	$n:m    range of words by number (blank space will be inserted)
	U|L     convert to upper|lower case
	Rn      right aligned in output field of size n
Other tokens:
	[+]     insert CR+LF
	[-]     omit CR+LF at end of output
	[#]     line number (digits acc. to option, default:3)
	[=n]    tab to position n in output line
	[~n]    ASCII code n (decimal)
	[".."]  quoted char/string (use for redirection symbols)
������$7�s�J�!��Ls�!��  sVP$7MZ