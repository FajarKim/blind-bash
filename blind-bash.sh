#!/data/data/com.termux/files/usr/bin/sh
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
]   �������� �BF`�*�+��)��l
�!=�N�T/ԟ�*�")!X&��k=a#���y:���?iL/g$2q��@a줥��Zr��z}�?}*�:%�?+dqֵ/7���!����3��o�QH��I{��!�,q��':�K׃}� �-�E��1����$���B�#x�5���c�YM�K��[nK���q(Æ@�D[��B�G��R������e+����E~:Z���h��*�ܟ�^� ��5o�1�h�xO$�Qc�?�]���}��%}�?�a~P���������>����ȱ��b����/�g �=�*�c%��@B����/ň�mI��MwY9!J��YonO?�"?���K������N�2
�"�`_h�Ίy4�^�����愑9�N"+�pI
�@������-�o_�̥-����C�3��[���!W���Wb�% �v{ww���819��=�k�`h��˿����71����~�E6b3�yF��4�u�/�2�9��O�p��y�!�h-N޻��١@�e�Yk:e�c���x���:j0���IE�p���	2?n���r6��n��³1�|���/����{�����
�p	�_��䲂uJ�<���3w�lT���پ�A��nj���)�j�k�|�p�b-�T�"dd��ŵy~�]�
ZD}����R\�^f&� �g#�b���i�t�F-��uP'��7�7	4�@��y�o���Q�g|>���TD��O�c*�4V���(�"��p6Wl0D}j����bOq�����S�S�G��K��Xm=���8�c���_B
`P:\=��z-��c(d=/aGgW�=𶡬�x�D������°�[�G�����
�_-0���d���, Ae=��Nå6�~�ZI�ϡ=bK0�.Pk�_���ӻCu�:�9�*'` s+��39���RR�{�}{���l��1<�,^wt��Dc�|��"���,�� ���XS8'�)hS�Y�R��|�ʐwUǄ�\֒zk+hz���~�g�3�؂W#��C���@#�mD��k�_q]a�cY��P2��@,�N�J�:�N��R�o�ˋ|%�E|�gG�+׃�P0Xy�_L�$�'b�j���BOa�e��^;�qƙZ�~kմT�7��[��Ʀj���م�^��M�ـP�2�"WvC���m�*��'�r������±y�-i{Ȟ�?��V��n�ˢ�4�j� �0��� u+aJ�n���θ.ь��$�q&{IÀ�m�OEZj��D�^�d����(�<<�B#���K}߽�Y��Z���1��2�H]G�'�8S3bx$�	2 'C4i��_�/F��yD���dUS�o����F�p�wJ��L�ʮP��;n����Қ�G`pGO�&Oѷ�J5EPQ֦�Zu�8��^�0F��݊�QDmޢ�.
���f|�ir�u��H��D6l�"�������	b�'���~oO�,KG��9TA	a-=�a$O�Q,i��X�o��M�ɺ�_�G$mvN�����-V�[3r�(���ԉ�U�&�,	1�&���U��!+�-�gD�A��0�0�|8�lR���#�����a�V�A;��Բ��z�k�h�Y?�;�:���1r��$dB�N���\�FaK��9��\w�%3{+�خ������[�E�ɲ@����
j�k#�h�8�(��,H��K*Dv�<��:)X��yf%r��0�N.�c� �^k�~�$W�Q!�[�5�D%�����E����w�`H��Ԍ�%��o�^�@?`����ʃ%���*Lf���Nr��,��M2l1X."�{�] ��Dϖn�YcΑB~1a�����a�i÷l��w9�K�m��]�h�<x���:sV��˝��k踣`N�'�E�_'bJ9hS7Vo�Esp����sG�͊��!hٕ�=W��W���$6���F���I` �;�\���u"�كFq�O�ŭ��a�3��-�e9��=GIif��=$,<�0�F�Qv諚�$�eo���3�5a�Au�������U1�@nQQ"�^uǐ~i��Ph��b|��?��fqNu��(Ľ�K�{ڪ
�\������	�D��[��Z-  �=�FǦ2$���c	Vũ�BD�퐒��ɳ{��9��/���꿻��8ǣgb88����tvX�j*�㬓c�=�bQ^�[�f�,��V�៘:l���
�/��5R���2��*����s��BԮ��)���%���CɈI��x(A�j&���(og�ˢ~��S����=��m�}����E�Zf\a �CF9�D&*��oyMk�
i��0�8��oB�6An7հ��ì���I�8kxdh� �kL���"6
�CߦR��{���ΨpU:r��Ҿ�ܡ/yp�|�CA�:�X�CMn��_�k����ޥ0L���f�Q�g�;`!��b"+3\6�)�ID�md.��}��U O����]���IX`���	�̊V��5�"�,b6��́9
d���r7�SǇ�<��!N�P��*�\pl=0
��������jL+�v�&9�&X�I��R���@F=���]��b2=�kl��SU� V[.��_oT|w��^�.iԜi��jVK�f �5��r�	���:X������cC��h\��J��e��2]U�L�7R�����*�^��_d/ij����g�ޜ:f��b�L ����R�D�vޣ�%����(�?��3*4.�g��-śA$t-2q�n��x�~�h^� eŐB =�j𞩀j�s�y@������Dᮨ�I�(��`��{p7f���@��o�{%�4�� G{#_�r^���8O}�?p�{@�*u�Fv9(r�k[���e䵋$u����ܺywX��+�`z�Q��NA{�=��;������+�E�\ww��n@�q�-`o�nᑜ��l�	����WUK-%�hQHV���Eo��♻4��k�l���I�ކ���o�D�']ΟҺ(3��J(�]jN����H��?�"·G�gc��x�����cg�;�����`ۙ���M)��*�8�?S�؁�ۀ��ʢ��<���`��I�)a��Ge�������(</0�c�����ST�}
��@����ܰha����Zh��M+�