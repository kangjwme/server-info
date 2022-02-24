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
�b101.sh] �Z�sE�|�+��.���l��Wy8�E���	��k�;���]vG���b
��\8 �@\�KRy��/W^I���zvW��V���*>�����t��1===3���T��T��J��6�5��S)�?D� 8�4��8W?]}pǹ����K���_�������&���ʌ��k��a�L(5Ks�Ij��6��b�#P����l`��S�� �&!*#6`�v�"U�N ���oEq��6T3�]�䫔��:a�l�b�*)f�
����z)b���i���Hu�@��e5�j"�T����:��Kt�2��eG��|2�e����z	����*�I}��j�4r�F)�Y)u&�r�Y$���6�����q��u�>n~�N�����_6>��Z����[=�׍���A���lܻ���Z��ύ�����кP���m���kW�����>��q��s�s㲳���:�f���(U� �s�t�% uld&��� �J��g���s��U�NӀZH#��E�R��Z�u�b�L�����x��P��&y�FL�X!�{��"�f�>e�3�����]x��֣�ƅ�ι;���o��-9�/9K7W}�*�t�QC��aUe6cӓ$��^��j!�_�_9zh�����Sc�����B������tA@�g�B���C��N<�����g��q��P�+�-'N@�;��T���CA��*_�qt+
 ��v�����Ér|��.Ͼ�}nxt�??�s��������D�Ê��OF�#�*�S�pX��9t�]�0\c0%�VŰ��4t��e?�Q۔����K%�XU��[M�l�+��Y>Od��^��_��� @f����)8�Eu2HP�3����vŰ�]պ�A�ٜ��(���ij�Bl�Y����|�Jn������jx _����J�s�r��]+��H?�{nx�C3���u+�)�F`����x����#�T��H���E���W� ���{���J󣟜�Ϧ�
Qfg��b��4J�J�[�ͣ��sO������(Q�!h/�3� k�O�+�`�*򾒬���J�ц0-C�)���-�r���R'V/�y�f���М�%�)�P��	�2��2�vKȮH9I)[F��� ���ߥ��'���� zm_7F%�qRZ�(ё�����'��fk�Hd]1j:Nvx"�a����Gҧ�AwF�Bv�֫X���;z�tl�D�1�#`�/������1wh/���q;�5�Mf|�=A=���Gde�Jx�(1W���.�U\�z8���u�k��V6 ���<&�.�0�@��g��8B�")�)�F%���	K���kD�ա����]�G�V:5�8$��R@�NmÒx-(�	��QM�e��Pn���y�=��T����iX�X&�d��:A���6)+��I�]����;�C�r�tB׋�N��ڦ�uwGH�ݩ{�!R�C��3$Q).�D��5������]�a��B��+� q:7�a�ɉ�Ԑ���������>,�$��Ӡ՗ͣ�qZ���߇�#�����q�Po>J<`���ɽƥ�W��p�s�s�.p�bl\ww��o�Fq���C��� ��a�ns�0=�:�Y|�n�巜�P|B>^h�N���*A��Ó�k�f���"?&��N��$,��L�۽�md�*.��v	Ny��g`|j?���I7�g����5W����׌-�~��N쐤ݶ�}MKR&*Ұ<Uz����>�ț�$��%��N�/�D8�3noیfmF�l����V0Z�	=2�f�*�<�g�`a�n�C�*D�-q.��3�d�8r���`}���e6`��`�j&�U�^�<ꧧ[$�1K�r��wz ��B3S/
�4A��3Xk��I���2�6�3R_�#�쨯ߎ�^v�7`G����ԞE�8�Z��M�%�!�l����<���{�z	�x�Ľ��n��8�Df0Y��3��;Ǽ_���6=���q۞�i9��e{,~Ej��j�L*�t�i�9L��1u@����3�?G�����s� ��v��6��^���3�0E2l�"�m�6���������39�M�������!*H� �ᙘl)�Vw[,V�}Z�27ѣhC/���Sg�NLG4�6k/���Q܏�x+j�W}˫p��U��*��zuպʪȱ�[S���
x&�`��� ߀�O��<��ȁ�*�חٲa�5�U�*�?��f�� /���'��Y��'��G{�J��5Yc�c�*��U�e*�mH屨�c�*w܎ud	���s�~c�z��w[+�=y���F4>{��ҥ'?O{`'��������oo�>��y���J����I�����O�G%Z�\h���^�4��x�&ď��*�+������=�LM8�]i�}���]����vm�Oc��c�[��j=\��O��έk����r�q�~�)y��������+|<���·��������Х��K�;����D��Z��{��wn;7.7�����#�u*�,�1�p9K@^�H�zË�pW�)�<��@�'X��s��`�/�}�Q�\���p�t���]�����NH$t.~�\	Ul����]� ��9} �_�.�`���:�-yl��Ǣ�ǒ./6��~4EU��G{�8{�\o~}��/qmu��2\��w㳲^��\��E~c-��Rû|��� �6�5��'&?%���Ρ�>Y����/�\�D��7���':a��ӝۭ���yŹ��8ʽ�p!ʊBL&jT!:��ACY5�De�獵�&~�jp�����G|����[zz>ZO2r���G[�2!����f<vQܟ�@�i�j3)�D�[���g�[��_�϶�e
ߨ�s@�R%#�R'r�T:ؼ{w�NU���ֈQ�:�H��1:���@Ͱ1� �$0}1�r>�4�iq�ѵhGc�I��+���I���}����\�ok8h-���T�ز��"s5*  