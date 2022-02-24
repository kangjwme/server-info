#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�bkkench.sh �Z�sE�|�+��.���l��Wy8�E���	��k�;���]vG���b
��\8 �@\�KRy��/W^I���zvW��V���*>�����t��1===3���T��T��J��6�5��S)�?D� 8�4��8W?]}pǹ����K���_�������&���ʌ��k��a�L(5Ks�Ij��6��b�#P����l`��S�� �&!*#6`�v�"U�N ���o�+Q��i�$_�l@��	�dӔ�?�UI1kW�4�5� �C�DnJۮ (��k��RU-��U1�Ո-���^�+��l.;�e�/�-O��K�Mč�� &��&�ao��=��f�ԙT�b�@fl��_&���ǹ�Y����;��[o���jk��o� _7n�����q�z��k�s?7��ׇ�C�B��A㇯]�￻�����[��k΍���J��`�i�"k�TՂ��yS���Ա�-����H*�K:�-�/l��V!z8Ej!�HB�KI4V�jU��~�m2����i�B�ʚ�%1�b����w����C����`8n�w�%�Z�.:��>Xr>�պ�伿�,�\}�A�T�FJ�U�ٌMO�H�zyϫ�t.|���B��6O���S�'��֣S�u��E
�׏��;�l:��K���ǁ#Cᯐ��8��R�:|��|�ѭ(@ L:��9�3�{~8'z��
�<�������!(���α�R\�"��+z�?�xl��NU�a���нvMc�p}���[��F��U���bDmS`��7/�0bU��o5�������f�<�q{m-�k� ���'����� A�d#���bDwU�R�fsj��*Ʀ��
�a�fI��	*�q�k�뗫�,d|J �v(�+	�a��
v�h3k =�\����CWd֭���9�*�_l���c��S��{ �GO�~_���z�A��+͏~r�>�R*D���S�z�<(�*��nI��k�6���V�=A�k��D1T"t���`�`�y@>� ������J���+AF´���^(~���U�J�X����I��9��Csz� P��lt@�"&�oȠ�,�-!�"�$�l5�Ã|(
�~�Rן C�W�p�}I��L�Ii�8DG&C_fl,�<��M��"�uŨ�8�mL���M��SEH�j�
�1[�b�v���ұ�.�ǀ�������G7�ܡ�plrN�5��G4��/�����-,�1*���\�ۺ�WqY�- ��'��y�1�[ـ�#�󘄻x���G�eh3X���Ȧ\�e��Bt6&,m�&�]�oT���cd�v�Z����X�p�J, �:�Kⵠ 'xJG5����B�]o���NR�2lO�gX�a�c�4�1?��ڤ�TpJ'�wA`�j���!���	]/r;�cB2`hj�.��5!}hv��1�HEY�ϐD���5ȷgRԬ�g�^2:v	�U����|�����E�&'�RCB
?���
���p�8O�V_6�*�i�2�F����SOǑC��(��j��'��>_�w���Y�]�����q�݅����q�7�G7ΆEX�������f�Mܻ5��r��=@�	�x�i;4��s��O�K��Qz�����:ܳ���r39o�*�]�����k��%8�u����p�+'���ӗb�\eN/_3���q�3;�C�vے�5-I��H��T�!��?�lL"o�"�,�F8L�x�θ�m3��ٳ�Kv2��[�h8'���!��О���}�a5��Ĺ���p"�1��e�+���gڗـn�4���V�z�򨟞n��,��EG7��<��L�\(CD�`���`��nc$C��T���8H}]v�����~;Fz�Q߀!H>�R{���j	D6��l��̳a�9�?��Yd�G0�=�%������='�D��d-ZΠb��:|-���0�;�l{�W��H���������Y3y��ݧM�0�b��ql�{��ϼ����3�ϩ����K�P>0L{�+��$�ɰE�hD�Iۜ#/�OO�qfj��861D��B��PN�� I�gb��T\[�m�X��iE��D����O��;1Ѱbج����G!p?�G୨qX_�-��u��V�K��J��U�*�"ǎnM���*��8���{`�|&?���&"⫐^_fˆQ�HV1��B��6�{�U#���nߟp�*Pd�"����>9�+���d�Q�u�<Wy엩<�!�Ǣ*�%��q3�q�%x�Ε���뭟�m����Ѳw�����K��<�<�U���b�O'�����������g+��Gv'i�{XJ?yx�h�s�Mʫ?xҼ�%�?v��l��z�z���25�w�u��_"�w���۵9?��w;�	,n����p�7�W<�f;��=��������;�ŧ�uē����������8ފ��KÓ��B�_4.]�D�w"���k!7�=r޹�ܸ���>Ƌ��שr��Ɛ��,y#��/B�]�tH�i�`�Kι��]�<�FQs�Fv���iH��vEjx��r:!�й�As%T��Ǔ�3Lv�ԃ��0�ȃ�w�똶�J�JK���lJ���5T5�������q���ؿ�ĵ��_�pkߍ��z�/sY�r���4;K��߻��ڼKJ����8����/;�z�dA.�cp�q�[޴���0�m�Own���z�������(��"���(+
1��Q��X�eմ�����������o�G�����o�m���h=��5�+m��ʄ̺����ADq����ͤ��o����n��F}>�j�)|���K���K�ȥP�`���:UM��Z#F��l"���lShe4��������8���p��iGע��R$�M����NF�v$yԧJ�u�o{�rm��ᠵ��R)b�J�i27?1*  