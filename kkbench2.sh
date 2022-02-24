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
��bkkench.sh �Z�s���οb����(Qrjӱc��Ē�XvҺ��IT � GJ�ıcy��'��(u����~�Nk{���/��?�_� �A���3�P�F �v�����;n{N*��T$v%��6#�60'S��\1@p/6��9�}���sk��͗Υ�/��X�IH�ɠf*�Qb�>0̕)�fi`�8��b�������TʲU2����ll�R�Q�	���.�E�F�B�!ʚ��Dц
c��S�|u�eV�L"�)!Ы�b֮�)�k���"6�ܔ�]PTo�XQ�*ZV#U1���Q[:���{�.WF���H��O��X �������oUAL�MV�ޠ�{6J��J�ө�;�"��6ض��Lo�������q�����ϵ�����w���O�ۃ|ݸ͟6�����������X�Q��uK����v��i|����oWo;��;7�:�+)?��)�2�@�*!��ZZ�F�`R��� )�.�|���|n�
��)PiD��]J�!�lT�DW�!���zH;����*W�$/��-VH��}�(�Y:�OZ�4��6p~� ^S�@��b��e���ՇKΥۭ�K·K�ҭ��S��.3�СdXU�fl��d��w�QH�����GL���yj��:8Y�u����.�C��,ZȼulH���ҙ�]�;
��E��q�pg<�
���`(��]�8�nE`ҁ�Ў���K�y8�C�oT@�E��7���A��Fw����R�����uX�S��(x�c�@Q�B9,Xd�k�4�LɼU6,l4]Q��C�*m������PF����[MW�`WH��Y>ON`�M�E|u �g|����Ru$(���`D_�bX��j]ʠ�l�@Md���ijD�6�Y����|�Jn������j�/_����J�r��]+��H��{qx�C3��eº�S�0����x����#�T��H������W� ������Z󣟜�Ϥ�
�gg���i�J��e�$��5�ͣ��sO������(��
!h/�3� k�O�+�`�*���Zj%�hC����d���uR�k�ԩ��l���c�94��~	�h�F��-j��6Őg�n	�e)'�e˨��CQ���B��ڼ��o��čQ�NJ�š:2�:�0cc����lj�)�e���d�1�'B4�~�q!}�t�(`�l��U(ڽ��kG'�@d>��b�ߏO�s�����9�k�Q�i��/����"��p�(1W���N�*N���~2|���H:����0�I��7�<x�Y�6�5��H21IQ�T�R[��Ƅ����M��{��Ptu���.�#]+���b�Z���UWmÒx-(�q��QM�e��Pn���y�=���l6�'�bX�a�c�4�1?���$�+8��ػ 0C��wd���ԩ��W���Q!04�M����>4�S�C�"	�,��gH����R%ȷ�S�Y�Ϩz���%V�/޾�m�sC A59qV5$��󿿯P�BN��i����Q�8-Z������||��8r�7%�^����~����o:�9�k'�T16�����7_�8�WC�����V��ٰK�9b��~�,��{���ν�(>!/4b�&|{n� ����qɵ\3�Ao���X��{V�[n&��^Ŷ2R|x�'����0>�Nz夛�3~��͚��)��kƖ�:bǷK�.[�%)iX�*=D��^�I�M]CĒEߎ'��WO �����m��6C<�d�B�{+� ��A3��!��_xe̡FJpK�*�'������מAh_f�	6Шf2�J׫�G��t��0f�*�p�p�/43�z�0A�$�>������R'���q�����eG}�v�����;B�|DQ�Yd�s+%�j�d�/t�������"�<�y�Q/���7t��9�Id#Z��A��9�u�Z�7��a�w�+��ԯHˑ-�c�+R3W�f�P	��O��a2Ŏ�}�ؠ���y�9�?��g�S�p�˗��|`��W��	H�ɒa��(�iۜC��OO�afj��861D��B��PN�� I�gbĒ+���X�F�����D���N��31Ѱbج����G!p?�G୨qX_�-��u��V�K��J��U�*�"ǎnM���*��8���{`�|&?���&"��^_fˆQ�hV6��r��6�{�U����nߟp�*��^!'T�e��ƕ@�k�ƨ�:U��<��Tې�cQ��U��8����ڃ�����V.<}���F4>{��ҕ��>O{`'��������oo�>��y����J����I���>��O�C%Z�o���ބ4��x�&ď��*�+�������㇧&��Zg�%������]����~�Ø��֝�Z�}cx��i�s���|�Z��8w�����x��s�N��>Aq�����h��4<}�(t��E�ʍN�z'r=��r��c��;�ͫ�`���|��!�k9\��W1���Eh��i�ua �,�v�9{f�˗g��(j.����y:	�SڮH�r^N'$:�/6WB�y<):�d�/@=hN ���<����iK۠䱨䱤ˋͦ�M������=w�=r��o4��{�����:��k.b���Y���<��-g��XK����]��{wS�wII5��'�&>#���΁�>Y E��u.S"ny˛vP���M���ֽ�O޹�<��l�^S�?��,S���*S�Р���V���w�3w�~5�������#�x�͓�.=;�'��t壭tX��YWZ~3ۏ(�O~ �,\��UR�[���g�[��_�϶�e2ߨ�s���JF�N��?�t�y׮��$Qa���u6��ct��)4�2�acANI`
�b�|i8�ⴣkюFh��pU�kzxbm�װo-{��?��6�S�s����)  