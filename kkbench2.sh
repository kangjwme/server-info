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
�qbkkench.sh �Z�s�T���+��N
���I�v�Ni�Ф]H�ݒ��k[Yҵ��������C![h	�[v�N���Nd���/칒|%�r��t���Dֽ����{��z�3RQ3���TR��PY׭�A8���C��	���Ac��{���wܛ��o�t?|��ſK?	�T�(�,U�ąXk�seBA��:X;Oj�X�a��@+�1%̈́��@U��̐y͡�E�J�Cؾ�õIլ���k�G�$�T(��]����Y�PI�,	�y�J�Y�����&x��$2S�vq��ޞ��¥�zV��bJ%M'�t����C��fsّ,-��T�A<9_/A73ޮ���������y6J��J�3��7�"��6ض��Lo��{����q��w�η���������'��A�n������g������Z�~n,_�g�օ�%�o��_{�o7�w����˷܋�����T�|��"�TՂ���SI+�c#]�����TR�6[�_؞��B�p�rj!�HB�GItV�jU6�~�m2���	�i��)�5�KZ�d�ҿ��mBk��S6=��ܟޅ����z�ظp�=wg�����ֵ%��%w���R���P�4�d�U��8�I�Z/�y��΅��=4]Hc3o���?>ux���h=:51]P�0�٤�y�����Ϧ3�]�?
��M��	�pg<�
���`�w�
DG�� 0�@nh���|���<��!'0�v��MG��£CP��ѝc}�xT=D�'bV��2
��6P����<��uj:���d֪�66Z��jF9�!J�6� f{|��R	%vU3�fht�+��Y6Od��~��^��� @f����)8��d��g2�}��iSbx�u)�j�95Q�*Ʀ��
q`@˒,�g�T��,��/O�Y�*�@��P6W�Ô��Zѡ�@z���sÃ�)��ȴ[)L95s�x~q��� �}�N���4=!^`}l5�	t�ރ��W���~}6�T�2;S�l:0�Os^�U┽��u�d}ex��{x��5Q��*:B�Ypf0�|���U�AIUd}%YAk�� �a٦ZSh/��[4�*Y�N�^��$��K͡9=�K(DS6:�l�7dPMe햐]�r�R�͚��A6a�G)������ zm_7F%�qRڅ(1��4���'���{�HdC1kNvx"�a���Gҧ�AwF�Bv�֫X���;z�tl�Da1 `�/������1wh/���q;�7�]�l�=A}���Gde�Jx�,QO��!�U\�{���d:�5�{+�I:���0�I��7�<X�٦>�5��Y$E�䢦kT#���	K���k���ա����]�G�V�`5�8$��R@��9�-�ZP�,%r�QM�e��Pn���y�=���b��'�3m˴��L�B�ux��6)+��I�]����;�C�r�tB׋�N��ڦ�uwGH�ݩ{�!R��!�`��.�D���LJ����(���.����W��tn��"h#�j��A��]���H�<,�}�|��M�8�}}���M=G�f��֯���k\�|���?g}w��*��t�~�h��k�04��8���t�#���ס�⛸wk.����;G	�x�i;4a�s��O�K��Y�EvD�`��YIXny�����.�HU\�u`�������~8嗓^���K�j�2����Gz�8����!I������LT�i������}6&�5uIK6y#�&_<�p~g�ֶ�ڌ���';2��[�h8'���)��О���}�a5���9^QgȘq�2ٕ���7��l� /�r�jժd�j��OO�H��\e���� 	�f�^.�!"h0���g��R7�1��!�eM���8H}]v�����~;Fz�Q߀!H>�j�,�ǹ���Zr�2O���H�̳g��>�����p��O�z�Μ�I�&��h9��ys���lol��l�W���_��#	Z���W�f>�f�b�§{@��a2Ŏ��ؠ����9<��g�Sp�;���|`Z�S��	H�*��6щ쐶9G^�����Ԟ�ql�6�-��`�-��QA���d[�x�z�b��Ӌ�=�6�:<upf��tDÊ���2����������a}շ�
�V[�/�"+�_W����;z5�zJ*�3q�G���,v�%��MD�W!��̖M����bV��Y-�{�]#���nߟ0�*Pd�"��,�}8r�Wů���Ty,���/SylC*�EUKT��f�� K��+���[?��Zy�ɣe�6���ۏ�.=y�yگ ;Y�~�NV{���'͋���V��-��N��W���~��<*�z�B��U��Y�J4!~��W�~�%�<��%�ej�}�J�죠D���5��ks~��v�-n����p10�U<�f���=��������;�%�duē�ܻ�������	n�oE[�����E�K�/��w"�;�����������vo\n~�%@f�T�/�1�p9K@^�H�zÏ�pW�)�,��@�%X��{��`�/�}�Q�\���͹Y:	�SڮH�r9/�	݋4WB�y<):�d�/@}hFρً�E���=�cڒ�6(y,*y,��b�)��GS�����h�g����ͯ�����'���`�Z��X�n|V6���△�n���Y��/�ٽ;��ͻ���[�����S�e�PO�,�E��u.S"ny˛v�	�A��t�v���o^q�_{:��)�\��������P�PV-;Q���驻�]��L�f|���[�����ߖ���֓�<s���V:�LȬ'-��D�'?���L�*i��v�����l��糭v��6��ha��Y����6���S�$*�5bT��&�a{�α0�&PF3l���&��(�HÙ�]�v4F�!�o���M��;�\�Isr�S{�pm��ᙵ<���qd%�?U�U**  