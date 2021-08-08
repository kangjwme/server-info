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
�B��`kkbench.sh �Zmw�F�\���p�"�N�	'�H)�$P��!�����ږTI�{�	��BK�Hy+)P�唤$iL#���_�;I�������	��}�{g�Ν{G��:W�5.%��Q�׳!C�U��Ò��������C}݇{B�ق�G�˷�����X���oV����2�@������'�cy����,���X�<��X"�32�!��;:<�F����7�V@l��� VZC>�IK,ƅx�@��|>�l����G��QIe�EhTG��"������  F�7,]�X4�n�l$�{rhc�DL�ǫ*'�%�W�)2GzQT�l�O`K�q��X���k��[�h,���W>����ń��$��FcD���[�� '�a���fb2�X��ɧ"̈́�����%q��P�e��+�6�Ա��JBv]���ft��nװQ�dӌ���;��-k�5{޼r����ײַ��U{�|�<yj��%s����9y��t���OtM��_��K�����/�O~*?����9�E��}s��Y}~6�:r�1�w�X�*��9\���|�N'�*��ե;��}
~�|����yf�~5g�͹��͋�e�A6R�OO|�>��u���9Z��l�R���*rvS}m�V۬ت��=�Yr���Ip�,9	.�����J��)�h���Q��[�'EN�ޛܽ�/��P��-��/q�`�>ObGHTmrg��k������	�/j��$i���g�Z�˷����3�Ĭ��-ǜa LJ*�>���I���PN�b�7X�1�c:
~(�"c��OD�J�C�6��P�k��w#�]���w�pw_�?����ts����pGkx���G�HK^O5P�l#j�v�sx����{=5m�?��&J�õ���3��`X�7XD�;�s,��T(UH����:W���.�⮸���4~�+�6]_ECD,��vW��v��x>��}��M0�&3�Ё����G������&�ҝ�����&&>���Z�Dt�cJ���ڱ���	�P�ݽo�7��D�iE�0��%�m�&���{[_Nž��1�2�A}��DE2��9�D<3DE�{ݱ�"m��B�䠤y��sb�;F��"�����n�c�;�^"�CJ"3UQHѓ�k)�#D�1�0p�%}i^���::\
USĢ`4bq�Y�/�uX�ֈ�tI����2���Q���#�4�2V�	K%�`��.�	M)�U3H����kK2�T���!8�ўzh8K^��N?��� �A��u�%S���(0�h`�.�A���d���:A[s�V����ڈ��c=5$���_�Aw�їWY���5��3�ZW��|b�:�4$��M9�������1�_w+ÍM�D��;�?��F؏�\c���ܱ�H���J�@{MU4ހ�Xohg�y�N�D=�������M��w�� �����=(�4�S��2TW.��!A�ʰ]�r?N��=h(�|��ڃ�V����t������o����_z'��IIN+U	��eH@�%�'��K�{�E�J�c���RV2F�@�HC�F�Hg�	� ���#)���d����A�׋֕k��?���z����l� �Xn�cO��Օ�J+�(A�v��ԶjK�OBMP�=a.ܠ�X`��X����ח�^�]�6���T���+���7�c�턚� G�v���	�ݻ9�}�D�h*�E2c���_��1���v�}s��E��:�H��mM��FS4���'�H?�k*@=�r.:ܱ�u�nհ�&;�%������W������;�����B`>�t@��3׃������2�v���z�#�_���@TQQ���1�+�����#ߕ�j	'ް��\�h���v�'�t��;?�"���K��I�i����P`��V!�MtQ5$H��!"?�O��
/�G1�g1/"6���!NJ>�;#�ʞ�D�5�O;5i=��t;��$WD�{���&dIS�.,`�������MI�C������2B>�9�8bvt��̦��@"B���1�B� d�9��[��K�S�ӄ�4b�����`7�g�e(Ǎ���ǡʡ��X��q!�)�1�.��k��"Ȍ�%�zn��}������}�u�wWBr���;Ɲ/(T�&�6`�`hy"	v	�Ul��)��$,r�$U%����=�D���W|��<浐{�ق�l�_�Ϸ��|�`NU�v�4u�|��������'�o��������ӫ��D,�!�?o�Pp;����������>�����A�Dy�����̼y�Byf����bjD���d�>t�̜,���"�4%�f����H"���dJ�+��K���;� �S�*7G�v�s��Օ�K_ͣpЧ�7ZQ9�:�*?97QO��H�*�#�s�Y;�ȉVr+����o�,�M_����u��>5��[�9]^>O;I���WWf��?��r2>�¾���3��Ϭ{h7	��3�`}J�`�i7����'����d��cلL%ݶ/g�c/C�Ѥ���hV��8�-���;�/g�=�|+E^er����ׇ��!b7�JＰ<А}�O���
�,b�U��1D�6��#�Me+G_�j��dyA����%�:�4dDU��&����E��o�_Ļ�Ux}|����Sk�s���)�ƽ��n{='�̥gk'~~YP�eb��������BO����ϧ_�Pq�-�'�?�:jN?�����9�R�����N�kLs�w���6D��8g�V����~MK͵m��5T��#����w�(S�/��rٺ>G1/�/��d��<9�����t�c!?��
(��M��7H`+�*I_J�%�	��L��ǔ=L���S�LSQ]Պ��Ŋz��tL|t���Iހ|SےB��
1��P�?Z�?�S#  